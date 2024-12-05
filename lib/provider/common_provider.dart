import 'package:ecologital/model/categories_model.dart';
import 'package:ecologital/model/item_model/item_model.dart';
import 'package:ecologital/model/menu_model.dart';
import 'package:ecologital/model/modifierGroups/modifier_groups_model.dart';
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
}
