// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

List<MenuModel> menuModelFromJson(String str) =>
    List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
  String id;
  String menuId;
  String verticalId;
  String storeId;
  Title title;
  dynamic subTitle;
  dynamic description;
  MenuAvailability menuAvailability;
  List<String> menuCategoryIDs;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdBy;
  String modifiedBy;

  MenuModel({
    required this.id,
    required this.menuId,
    required this.verticalId,
    required this.storeId,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.menuAvailability,
    required this.menuCategoryIDs,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json["ID"],
        menuId: json["MenuID"],
        verticalId: json["VerticalID"],
        storeId: json["StoreID"],
        title: Title.fromJson(json["Title"]),
        subTitle: json["SubTitle"],
        description: json["Description"],
        menuAvailability: MenuAvailability.fromJson(json["MenuAvailability"]),
        menuCategoryIDs:
            List<String>.from(json["MenuCategoryIDs"].map((x) => x)),
        createdDate: DateTime.parse(json["CreatedDate"]),
        modifiedDate: DateTime.parse(json["ModifiedDate"]),
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MenuID": menuId,
        "VerticalID": verticalId,
        "StoreID": storeId,
        "Title": title.toJson(),
        "SubTitle": subTitle,
        "Description": description,
        "MenuAvailability": menuAvailability.toJson(),
        "MenuCategoryIDs": List<dynamic>.from(menuCategoryIDs.map((x) => x)),
        "CreatedDate": createdDate.toIso8601String(),
        "ModifiedDate": modifiedDate.toIso8601String(),
        "CreatedBy": createdBy,
        "ModifiedBy": modifiedBy,
      };
}

class MenuAvailability {
  Day sunday;
  Day monday;
  Day tuesday;
  Day wednesday;
  Day thursday;
  Day friday;
  Day saturday;

  MenuAvailability({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  factory MenuAvailability.fromJson(Map<String, dynamic> json) =>
      MenuAvailability(
        sunday: Day.fromJson(json["Sunday"]),
        monday: Day.fromJson(json["Monday"]),
        tuesday: Day.fromJson(json["Tuesday"]),
        wednesday: Day.fromJson(json["Wednesday"]),
        thursday: Day.fromJson(json["Thursday"]),
        friday: Day.fromJson(json["Friday"]),
        saturday: Day.fromJson(json["Saturday"]),
      );

  Map<String, dynamic> toJson() => {
        "Sunday": sunday.toJson(),
        "Monday": monday.toJson(),
        "Tuesday": tuesday.toJson(),
        "Wednesday": wednesday.toJson(),
        "Thursday": thursday.toJson(),
        "Friday": friday.toJson(),
        "Saturday": saturday.toJson(),
      };
}

class Day {
  String startTime;
  String endTime;

  Day({
    required this.startTime,
    required this.endTime,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        startTime: json["StartTime"],
        endTime: json["EndTime"],
      );

  Map<String, dynamic> toJson() => {
        "StartTime": startTime,
        "EndTime": endTime,
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
