import 'package:flutter/material.dart';

class BagContentModel {
  final String drugName;
  final String drugType;
  final ImageProvider drugImage;
  final int drugPrice;
  final int quantity;

  BagContentModel({
    @required this.drugName,
    @required this.quantity,
    @required this.drugType,
    @required this.drugImage,
    @required this.drugPrice,
  });

  factory BagContentModel.fromJson(Map<String, dynamic> json) {
    return BagContentModel(
      drugName: json['drugName'],
      drugType: json['drugType'],
      drugImage: json['drugImage'],
      drugPrice: json['drugPrice'],
      quantity: json['quantityBought'],
    );
  }
}
