import 'package:flutter/material.dart';

class DrugCardModel {
  final String drugName;
  final String drugConstituent;
  final String drugType;
  final ImageProvider drugImage;
  final int drugPrice;
  final String companyName;
  final String packSize;
  final String productId;
  final String dispenseMethod;

  DrugCardModel({
    @required this.drugName,
    @required this.drugConstituent,
    @required this.drugType,
    @required this.drugImage,
    @required this.drugPrice,
    @required this.companyName,
    @required this.packSize,
    @required this.productId,
    @required this.dispenseMethod,
  });

  factory DrugCardModel.fromJson(Map<String, dynamic> json) {
    return DrugCardModel(
      drugName: json['drugName'],
      drugConstituent: json['drugConstituent'],
      drugType: json['drugType'],
      drugImage: json['drugImage'],
      drugPrice: json['drugPrice'],
      companyName: json['companyName'],
      packSize: json['packSize'],
      productId: json['productId'],
      dispenseMethod: json['dispenseMethod'],
    );
  }
}
