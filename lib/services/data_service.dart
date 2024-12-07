import 'dart:convert';

import 'package:ecologital/model/data_model.dart';
import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/services/categories_service.dart';
import 'package:ecologital/services/item_service.dart';
import 'package:ecologital/services/menu_service.dart';
import 'package:ecologital/services/modifier_service.dart';
import 'package:flutter/services.dart';

Future<void> readDataJson() async {
  final String response = await rootBundle.loadString('assets/json/data.json');
  final data = await json.decode(response);
  final res = DataModel.fromJson(data);
  try {
    if (res.status == true) {
      commonProvider.setCategoryList =
          await CategoriesService.getCategoryList(response: res);

      commonProvider.setMenuList = await MenuService.getMenuList(res: res);
      commonProvider.setItemList = await ItemService.getItemList(res: res);
      commonProvider.setModifierList =
          await ModifierService.getModifierList(res: res);
    } else {
      throw Exception('Error reading JSON file');
    }
  } catch (e) {
    throw Exception('Error reading JSON file: $e');
  }
}
