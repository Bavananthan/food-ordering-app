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
//total price of cart item list
  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

//remove duplicate list in cart list count
  int _count = 1;
  int get count => _count;

  removeDuplicate() {
    List nonDuplicate = cartItemList.toSet().toList();
    print(nonDuplicate.length);
    _count = nonDuplicate.length;
    notifyListeners();
  }

//calculate total price pase on the order type
  sumOfPrice() {
    _totalPrice = 0;
    for (var element in cartItemList) {
      if (_isDelivery) {
        _totalPrice = totalPrice + element.priceInfo.price.deliveryPrice;
      } else if (_isPickup) {
        _totalPrice = totalPrice + element.priceInfo.price.pickupPrice;
      } else {
        _totalPrice = totalPrice + element.priceInfo.price.tablePrice;
      }
    }
    notifyListeners();
  }

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
}
