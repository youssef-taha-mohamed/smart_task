class StatisticModel {
  final String? title;
  final String quantity;
  final String category;

  StatisticModel({
    this.title,
    required this.quantity,
    required this.category,
  });
}

List<StatisticModel> bestSellerList = [
  StatisticModel(
    title: 'دزبل',
    quantity: '5',
    category: 'طابعة',
  ),
  StatisticModel(
    title: 'قطعة',
    quantity: '250',
    category: 'طابعة',
  ),
  StatisticModel(
    title: 'كارتون',
    quantity: '100',
    category: 'طابعة',
  ),
];

List<StatisticModel> lastFatouraList = [
  StatisticModel(
    quantity: '32 د.ع',
    category: 'حازم لؤي الشيخ سعيد',
  ),
  StatisticModel(
    quantity: '32 د.ع',
    category: 'محمد سبحاني',
  ),
  StatisticModel(
    quantity: '32 د.ع',
    category: 'علي سليمان',
  ),
];

