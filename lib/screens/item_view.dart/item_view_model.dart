import 'package:ecologital/model/item_model/item_model.dart';
import 'package:ecologital/model/modifierGroups/modifier_groups_model.dart';
import 'package:ecologital/provider/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ItemViewModel extends BaseViewModel {
  late ItemModel item;

  List<String?> _modifierIds = [];
  List<String?> get modifierIds => _modifierIds;
  set setModifierIds(List<String?> value) => _modifierIds = value;

  List<ModifierGroupsModel> _modifierGroups = [];
  List<ModifierGroupsModel> get modifierGroups => _modifierGroups;
  set setModifierGroups(List<ModifierGroupsModel> value) =>
      _modifierGroups = value;

  fetchItemGetByID({required String id}) {
    setBusy(true);
    try {
      int index = commonProvider.itemList.indexWhere(
        (element) => element.menuItemId == id,
      );
      if (index != -1) {
        item = commonProvider.itemList[index];
        getModifierIds(item);
      } else {
        throw Exception('Item not found');
      }
    } catch (e) {
      print(e);
    } finally {
      setBusy(false);
    }
  }

  //get modifierRules id taped item ids
  getModifierIds(ItemModel item) {
    try {
      if (item.modifierGroupRules.iDs != null) {
        setModifierIds = item.modifierGroupRules.iDs!;
      }
      print(_modifierIds.length);
      getModifierGroup();
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

//get modifier group
  getModifierGroup() {
    try {
      setModifierGroups = commonProvider.modifierList.where(
        (element) {
          final isHave = modifierIds.any(
            (e) => e == element.modifierGroupId,
          );
          return isHave;
        },
      ).toList();
      print(modifierGroups.length);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

//list of cart list as temp list
  List<ItemModel> _tempCartItemList = [];
  List<ItemModel> get tempCartItemList => _tempCartItemList;
  set setTempCartItemList(List<ItemModel> value) => _tempCartItemList = value;

  //product count
  int _count = 0;
  int get count => _count;

  void increase() {
    if (count > -1) {
      _count++;
      tempCartItemList.add(item);
      sumOfPrice();
      print(tempCartItemList.length);
    }
    notifyListeners();
  }

  void decrease() {
    if (count > 0 && tempCartItemList.isNotEmpty) {
      _count--;

      tempCartItemList.removeLast();
      sumOfPrice();
      print(tempCartItemList.length);
    }
    notifyListeners();
  }

//total price of temp cart item list
  int _totalPrice = 0;
  int get totalPrice => _totalPrice;
  sumOfPrice() {
    _totalPrice = 0;
    for (var element in tempCartItemList) {
      if (commonProvider.isDelivery) {
        _totalPrice = totalPrice + element.priceInfo.price.deliveryPrice;
      } else if (commonProvider.isPickup) {
        _totalPrice = totalPrice + element.priceInfo.price.pickupPrice;
      } else {
        _totalPrice = totalPrice + element.priceInfo.price.tablePrice;
      }
    }
    notifyListeners();
  }

  void addCartList(BuildContext context) async {
    if (count > 0) {
      commonProvider.cartItemList.addAll(tempCartItemList);
      await commonProvider.removeDuplicate();
      await commonProvider.sumOfPrice();
    }

    print(commonProvider.cartItemList.length);
    Navigator.pop(context);
    notifyListeners();
  }

  bool _isTab = false;
  bool get isTab => _isTab;
  set setIsTab(value) => _isTab = value;
}

class CartItemModel {
  final ItemModel item;
  final String? msg;

  CartItemModel({required this.item, this.msg});
}
