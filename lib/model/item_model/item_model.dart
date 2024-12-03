// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

import 'quality_model.dart';

List<ItemModel> itemModelFromJson(String str) =>
    List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
  String id;
  String menuItemId;
  String storeId;
  Description title;
  Description description;
  String imageUrl;
  PriceInfo priceInfo;
  String externalData;
  QuantityInfo quantityInfo;
  SuspensionRules suspensionRules;
  ModifierGroupRules modifierGroupRules;
  RewardGroupRules rewardGroupRules;
  TaxInfo taxInfo;
  int aggregatedProductRating;
  int totalReviews;
  DateTime createdDate;
  DateTime modifiedDate;
  NutrientData nutrientData;
  DishInfo dishInfo;
  VisibilityInfo visibilityInfo;
  ProductInfo productInfo;
  dynamic bundleItems;
  BeverageInfo beverageInfo;
  List<String>? categoryIDs;
  List<dynamic>? allergens;
  MetaData metaData;

  ItemModel({
    required this.id,
    required this.menuItemId,
    required this.storeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.priceInfo,
    required this.externalData,
    required this.quantityInfo,
    required this.suspensionRules,
    required this.modifierGroupRules,
    required this.rewardGroupRules,
    required this.taxInfo,
    required this.aggregatedProductRating,
    required this.totalReviews,
    required this.createdDate,
    required this.modifiedDate,
    required this.nutrientData,
    required this.dishInfo,
    required this.visibilityInfo,
    required this.productInfo,
    required this.bundleItems,
    required this.beverageInfo,
    required this.categoryIDs,
    required this.allergens,
    required this.metaData,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["ID"],
        menuItemId: json["MenuItemID"],
        storeId: json["StoreID"],
        title: Description.fromJson(json["Title"]),
        description: Description.fromJson(json["Description"]),
        imageUrl: json["ImageURL"],
        priceInfo: PriceInfo.fromJson(json["PriceInfo"]),
        externalData: json["ExternalData"],
        quantityInfo: QuantityInfo.fromJson(json["QuantityInfo"]),
        suspensionRules: SuspensionRules.fromJson(json["SuspensionRules"]),
        modifierGroupRules:
            ModifierGroupRules.fromJson(json["ModifierGroupRules"]),
        rewardGroupRules: RewardGroupRules.fromJson(json["RewardGroupRules"]),
        taxInfo: TaxInfo.fromJson(json["TaxInfo"]),
        aggregatedProductRating: json["AggregatedProductRating"],
        totalReviews: json["TotalReviews"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        modifiedDate: DateTime.parse(json["ModifiedDate"]),
        nutrientData: NutrientData.fromJson(json["NutrientData"]),
        dishInfo: DishInfo.fromJson(json["DishInfo"]),
        visibilityInfo: VisibilityInfo.fromJson(json["VisibilityInfo"]),
        productInfo: ProductInfo.fromJson(json["ProductInfo"]),
        bundleItems: json["BundleItems"],
        beverageInfo: BeverageInfo.fromJson(json["BeverageInfo"]),
        categoryIDs: json["CategoryIDs"] == null
            ? []
            : List<String>.from(json["CategoryIDs"]!.map((x) => x)),
        allergens: json["Allergens"] == null
            ? []
            : List<dynamic>.from(json["Allergens"]!.map((x) => x)),
        metaData: MetaData.fromJson(json["MetaData"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "MenuItemID": menuItemId,
        "StoreID": storeId,
        "Title": title.toJson(),
        "Description": description.toJson(),
        "ImageURL": imageUrl,
        "PriceInfo": priceInfo.toJson(),
        "ExternalData": externalData,
        "QuantityInfo": quantityInfo.toJson(),
        "SuspensionRules": suspensionRules.toJson(),
        "ModifierGroupRules": modifierGroupRules.toJson(),
        "RewardGroupRules": rewardGroupRules.toJson(),
        "TaxInfo": taxInfo.toJson(),
        "AggregatedProductRating": aggregatedProductRating,
        "TotalReviews": totalReviews,
        "CreatedDate": createdDate.toIso8601String(),
        "ModifiedDate": modifiedDate.toIso8601String(),
        "NutrientData": nutrientData.toJson(),
        "DishInfo": dishInfo.toJson(),
        "VisibilityInfo": visibilityInfo.toJson(),
        "ProductInfo": productInfo.toJson(),
        "BundleItems": bundleItems,
        "BeverageInfo": beverageInfo.toJson(),
        "CategoryIDs": categoryIDs == null
            ? []
            : List<dynamic>.from(categoryIDs!.map((x) => x)),
        "Allergens": allergens == null
            ? []
            : List<dynamic>.from(allergens!.map((x) => x)),
        "MetaData": metaData.toJson(),
      };
}

class BeverageInfo {
  int caffeineAmount;
  int alcoholbyVolume;
  CoffeeInfo coffeeInfo;

  BeverageInfo({
    required this.caffeineAmount,
    required this.alcoholbyVolume,
    required this.coffeeInfo,
  });

  factory BeverageInfo.fromJson(Map<String, dynamic> json) => BeverageInfo(
        caffeineAmount: json["CaffeineAmount"],
        alcoholbyVolume: json["AlcoholbyVolume"],
        coffeeInfo: CoffeeInfo.fromJson(json["CoffeeInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "CaffeineAmount": caffeineAmount,
        "AlcoholbyVolume": alcoholbyVolume,
        "CoffeeInfo": coffeeInfo.toJson(),
      };
}

class CoffeeInfo {
  dynamic coffeeBeanOrigin;

  CoffeeInfo({
    required this.coffeeBeanOrigin,
  });

  factory CoffeeInfo.fromJson(Map<String, dynamic> json) => CoffeeInfo(
        coffeeBeanOrigin: json["CoffeeBeanOrigin"],
      );

  Map<String, dynamic> toJson() => {
        "CoffeeBeanOrigin": coffeeBeanOrigin,
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

class DishInfo {
  Classifications classifications;

  DishInfo({
    required this.classifications,
  });

  factory DishInfo.fromJson(Map<String, dynamic> json) => DishInfo(
        classifications: Classifications.fromJson(json["Classifications"]),
      );

  Map<String, dynamic> toJson() => {
        "Classifications": classifications.toJson(),
      };
}

class Classifications {
  bool canServeAlone;
  bool isVegetarian;
  int alcoholicItem;
  List<dynamic>? dietaryLabelInfo;
  String instructionsForUse;
  List<dynamic>? ingredients;
  List<dynamic>? additives;
  String preparationType;
  FoolBusinessOperator foolBusinessOperator;
  bool isHighFatSaltSugar;
  bool isHalal;
  int spiceLevel;

  Classifications({
    required this.canServeAlone,
    required this.isVegetarian,
    required this.alcoholicItem,
    required this.dietaryLabelInfo,
    required this.instructionsForUse,
    required this.ingredients,
    required this.additives,
    required this.preparationType,
    required this.foolBusinessOperator,
    required this.isHighFatSaltSugar,
    required this.isHalal,
    required this.spiceLevel,
  });

  factory Classifications.fromJson(Map<String, dynamic> json) =>
      Classifications(
        canServeAlone: json["CanServeAlone"],
        isVegetarian: json["IsVegetarian"],
        alcoholicItem: json["AlcoholicItem"],
        dietaryLabelInfo: json["DietaryLabelInfo"] == null
            ? []
            : List<dynamic>.from(json["DietaryLabelInfo"]!.map((x) => x)),
        instructionsForUse: json["InstructionsForUse"],
        ingredients: json["Ingredients"] == null
            ? []
            : List<dynamic>.from(json["Ingredients"]!.map((x) => x)),
        additives: json["Additives"] == null
            ? []
            : List<dynamic>.from(json["Additives"]!.map((x) => x)),
        preparationType: json["PreparationType"],
        foolBusinessOperator:
            FoolBusinessOperator.fromJson(json["FoolBusinessOperator"]),
        isHighFatSaltSugar: json["IsHighFatSaltSugar"],
        isHalal: json["IsHalal"],
        spiceLevel: json["SpiceLevel"],
      );

  Map<String, dynamic> toJson() => {
        "CanServeAlone": canServeAlone,
        "IsVegetarian": isVegetarian,
        "AlcoholicItem": alcoholicItem,
        "DietaryLabelInfo": dietaryLabelInfo == null
            ? []
            : List<dynamic>.from(dietaryLabelInfo!.map((x) => x)),
        "InstructionsForUse": instructionsForUse,
        "Ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x)),
        "Additives": additives == null
            ? []
            : List<dynamic>.from(additives!.map((x) => x)),
        "PreparationType": preparationType,
        "FoolBusinessOperator": foolBusinessOperator.toJson(),
        "IsHighFatSaltSugar": isHighFatSaltSugar,
        "IsHalal": isHalal,
        "SpiceLevel": spiceLevel,
      };
}

class FoolBusinessOperator {
  String name;
  String address;

  FoolBusinessOperator({
    required this.name,
    required this.address,
  });

  factory FoolBusinessOperator.fromJson(Map<String, dynamic> json) =>
      FoolBusinessOperator(
        name: json["Name"],
        address: json["Address"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Address": address,
      };
}

class MetaData {
  String productId;
  String productName;
  String unitChartId;
  String unitChartName;
  String? dealProductId;
  bool? isDealProduct;

  MetaData({
    required this.productId,
    required this.productName,
    required this.unitChartId,
    required this.unitChartName,
    this.dealProductId,
    this.isDealProduct,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        productId: json["ProductID"],
        productName: json["ProductName"],
        unitChartId: json["UnitChartID"],
        unitChartName: json["UnitChartName"],
        dealProductId: json["DealProductID"],
        isDealProduct: json["IsDealProduct"],
      );

  Map<String, dynamic> toJson() => {
        "ProductID": productId,
        "ProductName": productName,
        "UnitChartID": unitChartId,
        "UnitChartName": unitChartName,
        "DealProductID": dealProductId,
        "IsDealProduct": isDealProduct,
      };
}

class ModifierGroupRules {
  List<String>? iDs;
  List<dynamic>? overrides;

  ModifierGroupRules({
    required this.iDs,
    required this.overrides,
  });

  factory ModifierGroupRules.fromJson(Map<String, dynamic> json) =>
      ModifierGroupRules(
        iDs: json["IDs"] == null
            ? []
            : List<String>.from(json["IDs"]!.map((x) => x)),
        overrides: json["Overrides"] == null
            ? []
            : List<dynamic>.from(json["Overrides"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IDs": iDs == null ? [] : List<dynamic>.from(iDs!.map((x) => x)),
        "Overrides": overrides == null
            ? []
            : List<dynamic>.from(overrides!.map((x) => x)),
      };
}

class NutrientData {
  Calories calories;
  Calories kilojules;
  NetQuantity servingSize;
  int numberofServings;
  NumberofServingIntervals numberofServingIntervals;
  NetQuantity netQuantity;
  Calories caloriesperServing;
  Calories kilojulesperServing;
  Carbohydrates fat;
  Carbohydrates saturatedFattyAcids;
  Carbohydrates carbohydrates;
  Carbohydrates sugar;
  Carbohydrates protein;
  Carbohydrates salt;

  NutrientData({
    required this.calories,
    required this.kilojules,
    required this.servingSize,
    required this.numberofServings,
    required this.numberofServingIntervals,
    required this.netQuantity,
    required this.caloriesperServing,
    required this.kilojulesperServing,
    required this.fat,
    required this.saturatedFattyAcids,
    required this.carbohydrates,
    required this.sugar,
    required this.protein,
    required this.salt,
  });

  factory NutrientData.fromJson(Map<String, dynamic> json) => NutrientData(
        calories: Calories.fromJson(json["Calories"]),
        kilojules: Calories.fromJson(json["Kilojules"]),
        servingSize: NetQuantity.fromJson(json["ServingSize"]),
        numberofServings: json["NumberofServings"],
        numberofServingIntervals:
            NumberofServingIntervals.fromJson(json["NumberofServingIntervals"]),
        netQuantity: NetQuantity.fromJson(json["NetQuantity"]),
        caloriesperServing: Calories.fromJson(json["CaloriesperServing"]),
        kilojulesperServing: Calories.fromJson(json["KilojulesperServing"]),
        fat: Carbohydrates.fromJson(json["Fat"]),
        saturatedFattyAcids:
            Carbohydrates.fromJson(json["SaturatedFattyAcids"]),
        carbohydrates: Carbohydrates.fromJson(json["Carbohydrates"]),
        sugar: Carbohydrates.fromJson(json["Sugar"]),
        protein: Carbohydrates.fromJson(json["Protein"]),
        salt: Carbohydrates.fromJson(json["Salt"]),
      );

  Map<String, dynamic> toJson() => {
        "Calories": calories.toJson(),
        "Kilojules": kilojules.toJson(),
        "ServingSize": servingSize.toJson(),
        "NumberofServings": numberofServings,
        "NumberofServingIntervals": numberofServingIntervals.toJson(),
        "NetQuantity": netQuantity.toJson(),
        "CaloriesperServing": caloriesperServing.toJson(),
        "KilojulesperServing": kilojulesperServing.toJson(),
        "Fat": fat.toJson(),
        "SaturatedFattyAcids": saturatedFattyAcids.toJson(),
        "Carbohydrates": carbohydrates.toJson(),
        "Sugar": sugar.toJson(),
        "Protein": protein.toJson(),
        "Salt": salt.toJson(),
      };
}

class Calories {
  NumberofServingIntervals energyInterval;
  int displayType;

  Calories({
    required this.energyInterval,
    required this.displayType,
  });

  factory Calories.fromJson(Map<String, dynamic> json) => Calories(
        energyInterval:
            NumberofServingIntervals.fromJson(json["EnergyInterval"]),
        displayType: json["DisplayType"],
      );

  Map<String, dynamic> toJson() => {
        "EnergyInterval": energyInterval.toJson(),
        "DisplayType": displayType,
      };
}

class NumberofServingIntervals {
  int lower;
  int upper;

  NumberofServingIntervals({
    required this.lower,
    required this.upper,
  });

  factory NumberofServingIntervals.fromJson(Map<String, dynamic> json) =>
      NumberofServingIntervals(
        lower: json["Lower"],
        upper: json["Upper"],
      );

  Map<String, dynamic> toJson() => {
        "Lower": lower,
        "Upper": upper,
      };
}

class Carbohydrates {
  Amount amount;

  Carbohydrates({
    required this.amount,
  });

  factory Carbohydrates.fromJson(Map<String, dynamic> json) => Carbohydrates(
        amount: Amount.fromJson(json["Amount"]),
      );

  Map<String, dynamic> toJson() => {
        "Amount": amount.toJson(),
      };
}

class Amount {
  NumberofServingIntervals interval;
  Weight weight;

  Amount({
    required this.interval,
    required this.weight,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        interval: NumberofServingIntervals.fromJson(json["Interval"]),
        weight: Weight.fromJson(json["Weight"]),
      );

  Map<String, dynamic> toJson() => {
        "Interval": interval.toJson(),
        "Weight": weight.toJson(),
      };
}

class Weight {
  String unitType;

  Weight({
    required this.unitType,
  });

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "UnitType": unitType,
      };
}

class NetQuantity {
  String measurementType;
  Amount weightedInterval;
  VolumenInterval volumenInterval;
  CountInterval countInterval;

  NetQuantity({
    required this.measurementType,
    required this.weightedInterval,
    required this.volumenInterval,
    required this.countInterval,
  });

  factory NetQuantity.fromJson(Map<String, dynamic> json) => NetQuantity(
        measurementType: json["MeasurementType"],
        weightedInterval: Amount.fromJson(json["WeightedInterval"]),
        volumenInterval: VolumenInterval.fromJson(json["VolumenInterval"]),
        countInterval: CountInterval.fromJson(json["CountInterval"]),
      );

  Map<String, dynamic> toJson() => {
        "MeasurementType": measurementType,
        "WeightedInterval": weightedInterval.toJson(),
        "VolumenInterval": volumenInterval.toJson(),
        "CountInterval": countInterval.toJson(),
      };
}

class CountInterval {
  NumberofServingIntervals interval;
  Weight count;

  CountInterval({
    required this.interval,
    required this.count,
  });

  factory CountInterval.fromJson(Map<String, dynamic> json) => CountInterval(
        interval: NumberofServingIntervals.fromJson(json["Interval"]),
        count: Weight.fromJson(json["Count"]),
      );

  Map<String, dynamic> toJson() => {
        "Interval": interval.toJson(),
        "Count": count.toJson(),
      };
}

class VolumenInterval {
  NumberofServingIntervals interval;
  Weight volume;

  VolumenInterval({
    required this.interval,
    required this.volume,
  });

  factory VolumenInterval.fromJson(Map<String, dynamic> json) =>
      VolumenInterval(
        interval: NumberofServingIntervals.fromJson(json["Interval"]),
        volume: Weight.fromJson(json["Volume"]),
      );

  Map<String, dynamic> toJson() => {
        "Interval": interval.toJson(),
        "Volume": volume.toJson(),
      };
}

class PriceInfo {
  Price price;
  int corePrice;
  int containerDeposit;
  List<dynamic>? overrides;
  String pricebyUnit;

  PriceInfo({
    required this.price,
    required this.corePrice,
    required this.containerDeposit,
    required this.overrides,
    required this.pricebyUnit,
  });

  factory PriceInfo.fromJson(Map<String, dynamic> json) => PriceInfo(
        price: Price.fromJson(json["Price"]),
        corePrice: json["CorePrice"],
        containerDeposit: json["ContainerDeposit"],
        overrides: json["Overrides"] == null
            ? []
            : List<dynamic>.from(json["Overrides"]!.map((x) => x)),
        pricebyUnit: json["PricebyUnit"],
      );

  Map<String, dynamic> toJson() => {
        "Price": price.toJson(),
        "CorePrice": corePrice,
        "ContainerDeposit": containerDeposit,
        "Overrides": overrides == null
            ? []
            : List<dynamic>.from(overrides!.map((x) => x)),
        "PricebyUnit": pricebyUnit,
      };
}

class Price {
  int deliveryPrice;
  int pickupPrice;
  int tablePrice;

  Price({
    required this.deliveryPrice,
    required this.pickupPrice,
    required this.tablePrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        deliveryPrice: json["DeliveryPrice"],
        pickupPrice: json["PickupPrice"],
        tablePrice: json["TablePrice"],
      );

  Map<String, dynamic> toJson() => {
        "DeliveryPrice": deliveryPrice,
        "PickupPrice": pickupPrice,
        "TablePrice": tablePrice,
      };
}

class ProductInfo {
  int targetMarket;
  String gtin;
  String plu;
  String merchantId;
  String productType;
  dynamic productTraits;
  dynamic countriesofOrigin;

  ProductInfo({
    required this.targetMarket,
    required this.gtin,
    required this.plu,
    required this.merchantId,
    required this.productType,
    required this.productTraits,
    required this.countriesofOrigin,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) => ProductInfo(
        targetMarket: json["TargetMarket"],
        gtin: json["Gtin"],
        plu: json["Plu"],
        merchantId: json["MerchantID"],
        productType: json["ProductType"],
        productTraits: json["ProductTraits"],
        countriesofOrigin: json["CountriesofOrigin"],
      );

  Map<String, dynamic> toJson() => {
        "TargetMarket": targetMarket,
        "Gtin": gtin,
        "Plu": plu,
        "MerchantID": merchantId,
        "ProductType": productType,
        "ProductTraits": productTraits,
        "CountriesofOrigin": countriesofOrigin,
      };
}

class QuantityInfo {
  Quantity quantity;
  List<Override>? overrides;

  QuantityInfo({
    required this.quantity,
    required this.overrides,
  });

  factory QuantityInfo.fromJson(Map<String, dynamic> json) => QuantityInfo(
        quantity: Quantity.fromJson(json["Quantity"]),
        overrides: json["Overrides"] == null
            ? []
            : List<Override>.from(
                json["Overrides"]!.map((x) => Override.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Quantity": quantity.toJson(),
        "Overrides": overrides == null
            ? []
            : List<dynamic>.from(overrides!.map((x) => x.toJson())),
      };
}

class Override {
  String contextType;
  String contextValue;
  Quantity quantity;

  Override({
    required this.contextType,
    required this.contextValue,
    required this.quantity,
  });

  factory Override.fromJson(Map<String, dynamic> json) => Override(
        contextType: json["ContextType"],
        contextValue: json["ContextValue"],
        quantity: Quantity.fromJson(json["Quantity"]),
      );

  Map<String, dynamic> toJson() => {
        "ContextType": contextType,
        "ContextValue": contextValue,
        "Quantity": quantity.toJson(),
      };
}

// class Quantity {
//   int minPermitted;
//   int maxPermitted;
//   bool isMinPermittedOptional;
//   int chargeAbove;
//   int refundUnder;
//   int minPermittedUnique;
//   int maxPermittedUnique;

//   Quantity({
//     required this.minPermitted,
//     required this.maxPermitted,
//     required this.isMinPermittedOptional,
//     required this.chargeAbove,
//     required this.refundUnder,
//     required this.minPermittedUnique,
//     required this.maxPermittedUnique,
//   });

//   factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
//         minPermitted: json["MinPermitted"],
//         maxPermitted: json["MaxPermitted"],
//         isMinPermittedOptional: json["IsMinPermittedOptional"],
//         chargeAbove: json["ChargeAbove"],
//         refundUnder: json["RefundUnder"],
//         minPermittedUnique: json["MinPermittedUnique"],
//         maxPermittedUnique: json["MaxPermittedUnique"],
//       );

//   Map<String, dynamic> toJson() => {
//         "MinPermitted": minPermitted,
//         "MaxPermitted": maxPermitted,
//         "IsMinPermittedOptional": isMinPermittedOptional,
//         "ChargeAbove": chargeAbove,
//         "RefundUnder": refundUnder,
//         "MinPermittedUnique": minPermittedUnique,
//         "MaxPermittedUnique": maxPermittedUnique,
//       };
// }

class RewardGroupRules {
  Reward reward;
  dynamic overrides;

  RewardGroupRules({
    required this.reward,
    required this.overrides,
  });

  factory RewardGroupRules.fromJson(Map<String, dynamic> json) =>
      RewardGroupRules(
        reward: Reward.fromJson(json["Reward"]),
        overrides: json["Overrides"],
      );

  Map<String, dynamic> toJson() => {
        "Reward": reward.toJson(),
        "Overrides": overrides,
      };
}

class Reward {
  String type;
  int defaultValue;
  int multiplierValue;
  int customValue;
  bool isMutiplierRequired;

  Reward({
    required this.type,
    required this.defaultValue,
    required this.multiplierValue,
    required this.customValue,
    required this.isMutiplierRequired,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        type: json["Type"],
        defaultValue: json["DefaultValue"],
        multiplierValue: json["MultiplierValue"],
        customValue: json["CustomValue"],
        isMutiplierRequired: json["IsMutiplierRequired"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "DefaultValue": defaultValue,
        "MultiplierValue": multiplierValue,
        "CustomValue": customValue,
        "IsMutiplierRequired": isMutiplierRequired,
      };
}

class SuspensionRules {
  Suspension suspension;
  dynamic suspensionOverride;

  SuspensionRules({
    required this.suspension,
    required this.suspensionOverride,
  });

  factory SuspensionRules.fromJson(Map<String, dynamic> json) =>
      SuspensionRules(
        suspension: Suspension.fromJson(json["Suspension"]),
        suspensionOverride: json["SuspensionOverride"],
      );

  Map<String, dynamic> toJson() => {
        "Suspension": suspension.toJson(),
        "SuspensionOverride": suspensionOverride,
      };
}

class Suspension {
  int suspendedUntil;
  bool isSuspended;
  String reason;

  Suspension({
    required this.suspendedUntil,
    required this.isSuspended,
    required this.reason,
  });

  factory Suspension.fromJson(Map<String, dynamic> json) => Suspension(
        suspendedUntil: json["SuspendedUntil"],
        isSuspended: json["IsSuspended"],
        reason: json["Reason"],
      );

  Map<String, dynamic> toJson() => {
        "SuspendedUntil": suspendedUntil,
        "IsSuspended": isSuspended,
        "Reason": reason,
      };
}

class TaxInfo {
  int taxrate;
  int vatRateInPercentage;

  TaxInfo({
    required this.taxrate,
    required this.vatRateInPercentage,
  });

  factory TaxInfo.fromJson(Map<String, dynamic> json) => TaxInfo(
        taxrate: json["Taxrate"],
        vatRateInPercentage: json["VATRateInPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "Taxrate": taxrate,
        "VATRateInPercentage": vatRateInPercentage,
      };
}

class VisibilityInfo {
  VisibilityHours visibilityHours;

  VisibilityInfo({
    required this.visibilityHours,
  });

  factory VisibilityInfo.fromJson(Map<String, dynamic> json) => VisibilityInfo(
        visibilityHours: VisibilityHours.fromJson(json["VisibilityHours"]),
      );

  Map<String, dynamic> toJson() => {
        "VisibilityHours": visibilityHours.toJson(),
      };
}

class VisibilityHours {
  String startDate;
  String endDate;
  dynamic hoursofWeek;

  VisibilityHours({
    required this.startDate,
    required this.endDate,
    required this.hoursofWeek,
  });

  factory VisibilityHours.fromJson(Map<String, dynamic> json) =>
      VisibilityHours(
        startDate: json["StartDate"],
        endDate: json["EndDate"],
        hoursofWeek: json["HoursofWeek"],
      );

  Map<String, dynamic> toJson() => {
        "StartDate": startDate,
        "EndDate": endDate,
        "HoursofWeek": hoursofWeek,
      };
}
