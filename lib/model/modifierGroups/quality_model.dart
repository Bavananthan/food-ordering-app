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
