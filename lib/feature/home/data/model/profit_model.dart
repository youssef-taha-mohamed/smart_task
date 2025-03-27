import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart/core/resources/svg_assets.dart';

class ProfitModel {
  final String title;
  final String amount;
  final String count;
  final String? image;
  final IconData? icon;

  ProfitModel({
    required this.title,
    required this.amount,
    required this.count,
    this.image,
    this.icon,
  });
}

List<ProfitModel> profitList = [
  ProfitModel(
    title: 'أرباح اليوم',
    amount: '1.000.000 دينار عراقي',
    count: '25 فاتورة',
    image: SvgAssets.barChart,
  ),
  ProfitModel(
    title: 'أرباح الشهر',
    amount: '1,000,000 دينار عراقي',
    count: '25 فاتورة',
    icon: Icons.trending_up,
  ),
  ProfitModel(
    title: 'مبيعات اليوم',
    amount: '1,000,000 دينار عراقي',
    count: '25 فاتورة',
    icon: Icons.sell,
  ),
  ProfitModel(
    title: 'مشتريات اليوم',
    amount: '1,000,000 دينار عراقي',
    count: '0 فاتورة',
    icon: Icons.shopping_cart,
  ),
];
