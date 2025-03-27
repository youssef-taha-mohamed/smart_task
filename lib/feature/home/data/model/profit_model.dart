import 'package:smart/core/resources/svg_assets.dart';

class ProfitModel {
  final String title;
  final String amount;
  final String count;
  final String image;

  ProfitModel({
    required this.title,
    required this.amount,
    required this.count,
    required this.image,
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
    image: SvgAssets.barChart,
  ),
  ProfitModel(
    title: 'مبيعات اليوم',
    amount: '1,000,000 دينار عراقي',
    count: '25 فاتورة',
    image: SvgAssets.barChart,
  ),
  ProfitModel(
    title: 'مشتريات اليوم',
    amount: '1,000,000 دينار عراقي',
    count: '0 فاتورة',
    image: SvgAssets.barChart,
  ),
];
