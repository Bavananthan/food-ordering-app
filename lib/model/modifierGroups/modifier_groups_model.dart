// To parse this JSON data, do
//
//     final modifierGroups = modifierGroupsFromJson(jsonString);

import 'dart:convert';

List<ModifierGroupsModel> modifierGroupsFromJson(String str) =>
    List<ModifierGroupsModel>.from(
        json.decode(str).map((x) => ModifierGroupsModel.fromJson(x)));

String modifierGroupsToJson(List<ModifierGroupsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModifierGroupsModel {
  String id;
  String modifierGroupId;
  Description title;
  Description description;
  String storeId;
  String displayType;
  List<ModifierOption> modifierOptions;
  QuantityConstraintsRules quantityConstraintsRules;
  DateTime createdDate;
  DateTime modifiedDate;
  dynamic metaData;

  ModifierGroupsModel({
    required this.id,
    required this.modifierGroupId,
    required this.title,
    required this.description,
    required this.storeId,
    required this.displayType,
    required this.modifierOptions,
    required this.quantityConstraintsRules,
    required this.createdDate,
    required this.modifiedDate,
    required this.metaData,
  });

  factory ModifierGroupsModel.fromJson(Map<String, dynamic> json) =>
      ModifierGroupsModel(
        id: json["ID"],
        modifierGroupId: json["ModifierGroupID"],
        title: Description.fromJson(json["Title"]),
        description: Description.fromJson(json["Description"]),
        storeId: json["StoreID"],
        displayType: json["DisplayType"],
        modifierOptions: List<ModifierOption>.from(
            json["ModifierOptions"].map((x) => ModifierOption.fromJson(x))),
        quantityConstraintsRules:
            QuantityConstraintsRules.fromJson(json["QuantityConstraintsRules"]),
        createdDate: DateTime.parse(json["CreatedDate"]),
        modifiedDate: DateTime.parse(json["ModifiedDate"]),
        metaData: json["MetaData"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "ModifierGroupID": modifierGroupId,
        "Title": title.toJson(),
        "Description": description.toJson(),
        "StoreID": storeId,
        "DisplayType": displayType,
        "ModifierOptions":
            List<dynamic>.from(modifierOptions.map((x) => x.toJson())),
        "QuantityConstraintsRules": quantityConstraintsRules.toJson(),
        "CreatedDate": createdDate.toIso8601String(),
        "ModifiedDate": modifiedDate.toIso8601String(),
        "MetaData": metaData,
      };
}

class Description {
  String en;

  Description({
    required this.en,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class ModifierOption {
  String id;
  String type;

  ModifierOption({
    required this.id,
    required this.type,
  });

  factory ModifierOption.fromJson(Map<String, dynamic> json) => ModifierOption(
        id: json["Id"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Type": type,
      };
}

class QuantityConstraintsRules {
  Quantity quantity;
  dynamic overrides;

  QuantityConstraintsRules({
    required this.quantity,
    required this.overrides,
  });

  factory QuantityConstraintsRules.fromJson(Map<String, dynamic> json) =>
      QuantityConstraintsRules(
        quantity: Quantity.fromJson(json["Quantity"]),
        overrides: json["Overrides"],
      );

  Map<String, dynamic> toJson() => {
        "Quantity": quantity.toJson(),
        "Overrides": overrides,
      };
}

class Quantity {
  int minPermitted;
  int maxPermitted;
  bool isMinPermittedOptional;
  int chargeAbove;
  int refundUnder;
  int minPermittedUnique;
  int maxPermittedUnique;

  Quantity({
    required this.minPermitted,
    required this.maxPermitted,
    required this.isMinPermittedOptional,
    required this.chargeAbove,
    required this.refundUnder,
    required this.minPermittedUnique,
    required this.maxPermittedUnique,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        minPermitted: json["MinPermitted"],
        maxPermitted: json["MaxPermitted"],
        isMinPermittedOptional: json["IsMinPermittedOptional"],
        chargeAbove: json["ChargeAbove"],
        refundUnder: json["RefundUnder"],
        minPermittedUnique: json["MinPermittedUnique"],
        maxPermittedUnique: json["MaxPermittedUnique"],
      );

  Map<String, dynamic> toJson() => {
        "MinPermitted": minPermitted,
        "MaxPermitted": maxPermitted,
        "IsMinPermittedOptional": isMinPermittedOptional,
        "ChargeAbove": chargeAbove,
        "RefundUnder": refundUnder,
        "MinPermittedUnique": minPermittedUnique,
        "MaxPermittedUnique": maxPermittedUnique,
      };
}
