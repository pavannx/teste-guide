import 'package:test/features/home/domain/entities/asset_entity.dart';

class AssetModel extends AssetEntity {
  AssetModel({
    required super.date,
    required super.value,
    required super.variationFromLastDay,
    required super.variationFromDayOne,
  });

  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      date: map['date'],
      value: map['value'],
      variationFromLastDay: map['variationFromLastDay'],
      variationFromDayOne: map['variationFromDayOne'],
    );
  }
}
