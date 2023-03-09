class AssetEntity {
  final DateTime date;
  final double value;
  final double? variationFromLastDay;
  final double? variationFromDayOne;

  AssetEntity({
    required this.date,
    required this.value,
    this.variationFromLastDay,
    this.variationFromDayOne,
  });
}
