// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecologital/model/categories_model.dart';
import 'package:ecologital/model/item_model/item_model.dart';
import 'package:ecologital/model/menu_model.dart';
import 'package:ecologital/model/modifierGroups/modifier_groups_model.dart';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  bool status;
  Result result;

  DataModel({
    required this.status,
    required this.result,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        status: json["Status"],
        result: Result.fromJson(json["Result"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Result": result.toJson(),
      };
}

class Result {
  List<MenuModel> menu;
  List<CategoriesModel> categories;
  List<ItemModel> items;
  List<ModifierGroupsModel> modifierGroups;

  Result({
    required this.menu,
    required this.categories,
    required this.items,
    required this.modifierGroups,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        menu: List<MenuModel>.from(
            json["Menu"].map((x) => MenuModel.fromJson(x))),
        categories: List<CategoriesModel>.from(
            json["Categories"].map((x) => CategoriesModel.fromJson(x))),
        items: List<ItemModel>.from(
            json["Items"].map((x) => ItemModel.fromJson(x))),
        modifierGroups: List<ModifierGroupsModel>.from(
            json["ModifierGroups"].map((x) => ModifierGroupsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Menu": List<dynamic>.from(menu.map((x) => x.toJson())),
        "Categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
        "ModifierGroups":
            List<dynamic>.from(modifierGroups.map((x) => x.toJson())),
      };
}
