import 'package:covidados/features/domain/entities/country_info_entity.dart';

class CountryInfoModel extends CountryInfo {
  CountryInfoModel({
    required String flag,
  }) : super(
          flag: flag,
        );

  factory CountryInfoModel.fromMap(Map<String, dynamic> map) {
    return CountryInfoModel(
      flag: map['flag'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'flag': flag,
    };
  }
}
