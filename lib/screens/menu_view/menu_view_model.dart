import 'package:ecologital/model/categories_model.dart';
import 'package:ecologital/model/item_model/item_model.dart';
import 'package:ecologital/model/menu_model.dart';
import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/screens/menu_view/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MenuViewModel extends BaseViewModel {
  bool _isTap = false;
  bool get isTap => _isTap;

//menu id
  String _menuId = '';
  String get menuId => _menuId;
  set setMenuId(value) => _menuId = value;

//after tap a menu
  String _menuName = "Select ";
  String get menuName => _menuName;
  set setMenuName(value) {
    _menuName = value;
    notifyListeners();
  }

//tap index for category
  int _tapIndex = -1;
  int get tapIndex => _tapIndex;
  set setIndex(value) => _tapIndex = value;

  void onTapCategory({required int index, required String id}) {
    fetchItems(id, index);
    if (index != _tapIndex) {
      setIndex = index;
    }

    notifyListeners();
  }

  int _tapMenuIndex = -1;
  int get tapMenuIndex => _tapMenuIndex;
  set setMenuIndex(value) => _tapMenuIndex = value;

  void onTapMenu(
    BuildContext context, {
    required int index,
    required String value,
    required String id,
  }) {
    if (index != _tapMenuIndex) {
      _tapMenuIndex = index;
      setMenuName = value;

      Navigator.pop(context, MenuList(id: id, menuName: menuName));
    }

    notifyListeners();
  }

  showBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      useRootNavigator: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      enableDrag: true,
      context: context,
      builder: (context) => MenuScreen(),
    ).then(
      (value) async {
        value as MenuList;
        setMenuName = value.menuName;
        setMenuId = value.id;
        setBusy(false);
        // await fetchCategory(value.id);
      },
    );
  }

  List<ItemModel> _itemList = [];
  List<ItemModel> get itemList => _itemList;
  set setItemList(List<ItemModel> value) => _itemList = value;

//menu wise category list
  List<CategoriesModel> _categoryList = [];
  List<CategoriesModel> get categoryList => _categoryList;
  set setCategoryList(List<CategoriesModel> value) => _categoryList = value;

  List<CategoriesModel> findCategoriesForMenu(
      MenuModel menu, List<CategoriesModel> categoriesList) {
    return categoriesList
        .where((category) =>
            menu.menuCategoryIDs.contains(category.menuCategoryId))
        .toList();
  }

  List<ItemModel> findItemsForCategory(
      CategoriesModel category, List<ItemModel> itemList) {
    return category.menuEntities
        .where((entity) =>
            entity.type == "ITEM") // You can check the type to filter items
        .map((entity) =>
            itemList.firstWhere((item) => item.menuItemId == entity.id))
        .toList();
  }

  fetchItems(String id, int index) {
    //list by menu category ids
    List<String> menuCategoryIds =
        commonProvider.menuList[index].menuCategoryIDs;

    //find the category lists
    List<CategoriesModel> _menuCategory = commonProvider.categoryList.where(
      (element) {
        final category = menuCategoryIds.contains(element.menuCategoryId);
        return category;
      },
    ).toList();

    print("List of menu Category ${_menuCategory[0].title.en}");

    //get the menu entities based on selected category
    List menuEntitiesIds = [];
    for (int i = 0; i < _menuCategory.length; i++) {
      menuEntitiesIds = _menuCategory[i]
          .menuEntities
          .map(
            (e) => e.id,
          )
          .toList();
    }
    print("List of menu Category ${menuEntitiesIds[0]}");

    //get item list for specific category
    List<ItemModel> selectedItem = commonProvider.itemList
        .where(
          (element) => menuEntitiesIds.contains(element.menuItemId),
        )
        .toList();
    print("List of menu Category ${selectedItem.length}");
  }
}
