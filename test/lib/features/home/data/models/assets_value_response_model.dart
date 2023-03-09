import 'package:test/features/home/data/models/asset_model.dart';
import 'package:test/features/home/domain/entities/asset_entity.dart';
import 'package:test/features/home/domain/entities/asset_value_response_entity.dart';

class AssetsValueResponseModel extends AssetValueResponseEntity {
  AssetsValueResponseModel({required super.assets});

  factory AssetsValueResponseModel.fromJson(Map<String, dynamic> json) {
    return AssetsValueResponseModel(
      assets: _getAssetsList(json['chart']['result'][0]),
    );
  }
}

List<AssetEntity> _getAssetsList(Map<String, dynamic> json) {
  List<Map<String, dynamic>> assets = [];

  for (var i = 0; i < json['timestamp'].length; i++) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(json['timestamp'][i] * 1000);
    double value = json['indicators']['quote'][0]['open'][i];

    if (i == 0) {
      assets.add({
        'date': date,
        'value': value,
      });

      continue;
    }

    double variationFromDayOne = _getValueVariation(
      json['indicators']['quote'][0]['open'][0],
      json['indicators']['quote'][0]['open'][i],
    );

    double variationFromLastDay = _getValueVariation(
      json['indicators']['quote'][0]['open'][i - 1],
      json['indicators']['quote'][0]['open'][i],
    );

    assets.add({
      'date': date,
      'value': value,
      'variationFromDayOne': variationFromDayOne,
      'variationFromLastDay': variationFromLastDay,
    });
  }

  return assets.map((e) => AssetModel.fromMap(e)).toList();
}

double _getValueVariation(double value1, double value2) {
  return ((100 * value2) / value1) - 100;
}
