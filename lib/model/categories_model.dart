// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  String id;
  String menuCategoryId;
  String menuId;
  String storeId;
  Title title;
  Title subTitle;
  List<MenuEntity> menuEntities;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdBy;
  String modifiedBy;

  CategoriesModel({
    required this.id,
    required this.menuCategoryId,
    required this.menuId,
    required this.storeId,
    required this.title,
    required this.subTitle,
    required this.menuEntities,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json["ID"],
        menuCategoryId: json["MenuCategoryID"],
        menuId: json["MenuID"],
        storeId: json["StoreID"],
        title: Title.fromJson(json["Title"]),
        subTitle: Title.fromJson(json["SubTitle"]),
        menuEntities: List<MenuEntity>.from(
            json["MenuEntities"].map((x) => MenuEntity.fromJson(x))),
        createdDate: DateTime.parse(json["CreatedDate"]),
        modifiedDate: DateTime.parse(json["ModifiedDate"]),
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MenuCategoryID": menuCategoryId,
        "MenuID": menuId,
        "StoreID": storeId,
        "Title": title.toJson(),
        "SubTitle": subTitle.toJson(),
        "MenuEntities": List<dynamic>.from(menuEntities.map((x) => x.toJson())),
        "CreatedDate": createdDate.toIso8601String(),
        "ModifiedDate": modifiedDate.toIso8601String(),
        "CreatedBy": createdBy,
        "ModifiedBy": modifiedBy,
      };
}

class MenuEntity {
  String id;
  String type;

  MenuEntity({
    required this.id,
    required this.type,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) => MenuEntity(
        id: json["ID"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Type": type,
      };
}

class Title {
  String en;

  Title({
    required this.en,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}
