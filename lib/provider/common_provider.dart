import 'package:ecologital/model/categories_model.dart';
import 'package:ecologital/model/item_model/item_model.dart';
import 'package:ecologital/model/menu_model.dart';
import 'package:ecologital/model/modifierGroups/modifier_groups_model.dart';
import 'package:ecologital/screens/menu_view/enum/order_type_enum.dart';
import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  List<MenuModel> _menuList = [];
  List<MenuModel> get menuList => _menuList;
  set setMenuList(List<MenuModel> value) => _menuList = value;

  List<CategoriesModel> _categoryList = [];
  List<CategoriesModel> get categoryList => _categoryList;
  set setCategoryList(List<CategoriesModel> value) => _categoryList = value;

  List<ItemModel> _itemList = [];
  List<ItemModel> get itemList => _itemList;
  set setItemList(List<ItemModel> value) => _itemList = value;

  List<ModifierGroupsModel> _modifierList = [];
  List<ModifierGroupsModel> get modifierList => _modifierList;
  set setModifierList(List<ModifierGroupsModel> value) => _modifierList = value;

  List<ItemModel> _cartItemList = [];
  List<ItemModel> get cartItemList => _cartItemList;
  set setCartItemList(List<ItemModel> value) => _cartItemList = value;

  bool isLunch = false;
  bool isBreakfast = true;

  //after tap a menu
  String _menuName = "Lunch Menu ";
  String get menuName => _menuName;
  set setMenuName(value) {
    _menuName = value;
    notifyListeners();
  }

  bool _isDelivery = false;
  bool get isDelivery => _isDelivery;
  set setIsDelivery(value) => _isDelivery = value;

  bool _isPickup = true;
  bool get isPickup => _isPickup;
  set setIsPickup(value) => _isPickup = value;

  bool _isTable = false;
  bool get isTable => _isTable;
  set setIsTable(value) => _isTable = value;

//select type of order
  void onTabOrder({required OrderTypeEnum type}) {
    if (type == OrderTypeEnum.delivery) {
      setIsDelivery = true;
      setIsPickup = false;
      setIsTable = false;
    } else if (type == OrderTypeEnum.table) {
      setIsDelivery = false;
      setIsPickup = false;
      setIsTable = true;
    } else {
      setIsDelivery = false;
      setIsPickup = true;
      setIsTable = false;
    }
    print("isdeliveru ${isDelivery}");
    print("istable ${isTable}");
    print("ispick ${isPickup}");
    notifyListeners();
  }
}
