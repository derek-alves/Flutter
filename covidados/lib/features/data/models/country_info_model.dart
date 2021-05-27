import 'package:covidados/features/domain/entities/country_info_entity.dart';

class CountryInfoModel extends CountryInfo {
  CountryInfoModel({
    required String iso2,
    required String flag,
    required int lat,
    required int long,
  }) : super(
          iso2: iso2,
          flag: flag,
          lat: lat,
          long: long,
        );

  factory CountryInfoModel.fromMap(Map<String, dynamic> map) {
    return CountryInfoModel(
      iso2: map['iso2'],
      lat: map['lat'],
      long: map['long'],
      flag: map['flag'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'iso2': iso2,
      'lat': lat,
      'long': long,
      'flag': flag,
    };
  }
}
