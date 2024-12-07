import 'package:ecologital/model/categories_model.dart';
import 'package:ecologital/model/item_model/item_model.dart';
import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/screens/item_view.dart/item_view.dart';
import 'package:ecologital/screens/menu_view/enum/order_type_enum.dart';
import 'package:ecologital/screens/menu_view/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MenuViewModel extends BaseViewModel {
//menu id
  String _menuId = '';
  String get menuId => _menuId;
  set setMenuId(value) => _menuId = value;

//tap index for category
  int _tapIndex = 0;
  int get tapIndex => _tapIndex;
  set setIndex(value) => _tapIndex = value;

  void onTapCategory({required int index, required String id}) async {
    if (index != _tapIndex) {
      setIndex = index;
    }
    await fetchCategories(index: _tapIndex);
    await fetchItems();
    notifyListeners();
  }

  int _tapMenuIndex = -1;
  int get tapMenuIndex => _tapMenuIndex;
  set setMenuIndex(value) => _tapMenuIndex = value;

  void onTapMenu() {
    if (commonProvider.isLunch) {
      commonProvider.isLunch = false;
      commonProvider.isBreakfast = true;
    } else {
      commonProvider.isLunch = true;
      commonProvider.isBreakfast = false;
    }
    notifyListeners();
  }

  showBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.4,
      showDragHandle: true,
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
      (value) {
        notifyListeners();
      },
    );
  }

//this for get item list
  List<ItemModel> _itemList = [];
  List<ItemModel> get itemList => _itemList;
  set setItemList(List<ItemModel> value) => _itemList = value;

//menu wise category list
  List<CategoriesModel> _categoryList = [];
  List<CategoriesModel> get categoryList => _categoryList;
  set setCategoryList(List<CategoriesModel> value) => _categoryList = value;

  Future<void> fetchCategories({required int index}) async {
    try {
      //list by menu category ids
      List<String> menuCategoryIds =
          commonProvider.menuList[index].menuCategoryIDs;

      //find the category lists
      setCategoryList = commonProvider.categoryList.where(
        (element) {
          final category = menuCategoryIds.contains(element.menuCategoryId);
          return category;
        },
      ).toList();
    } catch (e) {
      print("error in fetching categories ${e.toString()}");
    }

    notifyListeners();
  }

  Future<void> fetchItems() async {
//get the menu entities based on selected category
    try {
      List menuEntitiesIds = [];
      for (int i = 0; i < categoryList.length; i++) {
        menuEntitiesIds = categoryList[i]
            .menuEntities
            .map(
              (e) => e.id,
            )
            .toList();
      }
      print("List of menu Category ${menuEntitiesIds[0]}");

      //get item list for specific category
      setItemList = commonProvider.itemList
          .where(
            (element) => menuEntitiesIds.contains(element.menuItemId),
          )
          .toList();
    } catch (e) {
      print("error in fetching items ${e.toString()}");
    }

    notifyListeners();
  }

//select type of order
  void onTabOrder({required OrderTypeEnum type}) {
    if (type == OrderTypeEnum.delivery) {
      commonProvider.setIsDelivery = true;
      commonProvider.setIsPickup = false;
      commonProvider.setIsTable = false;
    } else if (type == OrderTypeEnum.table) {
      commonProvider.setIsDelivery = false;
      commonProvider.setIsPickup = false;
      commonProvider.setIsTable = true;
    } else {
      commonProvider.setIsDelivery = false;
      commonProvider.setIsPickup = true;
      commonProvider.setIsTable = false;
    }
    print("isdeliveru ${commonProvider.isDelivery}");
    print("istable ${commonProvider.isTable}");
    print("ispick ${commonProvider.isPickup}");
    notifyListeners();
  }

  void onItemTaped(BuildContext context, {required String id}) {
    showModalBottomSheet(
      //showDragHandle: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      enableDrag: true,
      context: context,
      builder: (context) => ItemView(id: id),
    ).then(
      (value) {
        notifyListeners();
      },
    );
    //Handel Navigation
  }
}
