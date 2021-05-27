import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';

import 'country_info_model.dart';

class DataCovidCountryModel extends CountryCovidDataEntity {
  DataCovidCountryModel({
    required String country,
    required CountryInfoModel countryInfo,
    required int cases,
    required int deaths,
    required int recovered,
    required int active,
    required int casesPerOneMillion,
    required int deathsPerOneMillion,
    required int tests,
    required int testsPerOneMillion,
    required int population,
    required int oneCasePerPeople,
    required int oneDeathPerPeople,
    required int oneTestPerPeople,
    required double activePerOneMillion,
    required double recoveredPerOneMillion,
    required double criticalPerOneMillion,
  }) : super(
          country: country,
          countryInfo: countryInfo,
          cases: cases,
          deaths: deaths,
          recovered: recovered,
          active: active,
          casesPerOneMillion: casesPerOneMillion,
          deathsPerOneMillion: deathsPerOneMillion,
          tests: tests,
          testsPerOneMillion: testsPerOneMillion,
          population: population,
          oneCasePerPeople: oneCasePerPeople,
          oneDeathPerPeople: oneDeathPerPeople,
          oneTestPerPeople: oneTestPerPeople,
          activePerOneMillion: activePerOneMillion,
          recoveredPerOneMillion: recoveredPerOneMillion,
          criticalPerOneMillion: criticalPerOneMillion,
        );

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'countryInfo': countryInfo.toMap(),
      'cases': cases,
      'deaths': deaths,
      'recovered': recovered,
      'active': active,
      'casesPerOneMillion': casesPerOneMillion,
      'deathsPerOneMillion': deathsPerOneMillion,
      'tests': tests,
      'testsPerOneMillion': testsPerOneMillion,
      'population': population,
      'oneCasePerPeople': oneCasePerPeople,
      'oneDeathPerPeople': oneDeathPerPeople,
      'oneTestPerPeople': oneTestPerPeople,
      'activePerOneMillion': activePerOneMillion,
      'recoveredPerOneMillion': recoveredPerOneMillion,
      'criticalPerOneMillion': criticalPerOneMillion,
    };
  }

  factory DataCovidCountryModel.fromMap(Map<String, dynamic> map) {
    return DataCovidCountryModel(
      country: map['country'],
      countryInfo: CountryInfoModel.fromMap(map['countryInfo']),
      cases: map['cases'],
      deaths: map['deaths'],
      recovered: map['recovered'],
      active: map['active'],
      casesPerOneMillion: map['casesPerOneMillion'],
      deathsPerOneMillion: map['deathsPerOneMillion'],
      tests: map['tests'],
      testsPerOneMillion: map['testsPerOneMillion'],
      population: map['population'],
      oneCasePerPeople: map['oneCasePerPeople'],
      oneDeathPerPeople: map['oneDeathPerPeople'],
      oneTestPerPeople: map['oneTestPerPeople'],
      activePerOneMillion: map['activePerOneMillion'],
      recoveredPerOneMillion: map['recoveredPerOneMillion'],
      criticalPerOneMillion: map['criticalPerOneMillion'],
    );
  }
}

// factory DataCovidCountryModel.fromJson(Map<String, dynamic> json) =>
//     DataCovidCountryModel(
//       country: json['country'],
//       // countryInfo: json['countryInfo'],
//       cases: json['cases'],
//       deaths: json['deaths'],
//       recovered: json['recovered'],
//       active: json[' active'],
//       casesPerOneMillion: json['casesPerOneMillion'],
//       deathsPerOneMillion: json['deathsPerOneMillion'],
//       tests: json['tests'],
//       testsPerOneMillion: json['testsPerOneMillion'],
//       population: json['population'],
//       oneCasePerPeople: json['oneCasePerPeople'],
//       oneDeathPerPeople: json['oneDeathPerPeople'],
//       oneTestPerPeople: json['oneTestPerPeople'],
//       activePerOneMillion: json['activePerOneMillion'],
//       recoveredPerOneMillion: json['recoveredPerOneMillion'],
//       criticalPerOneMillion: json['criticalPerOneMillion'],
//     );

// Map<String, dynamic> toJson() => {
//       'country': country,
//       // 'countryInfo': countryInfo,
//       'cases': cases,
//       'deaths': deaths,
//       'recovered': recovered,
//       'active': active,
//       'casesPerOneMillion': casesPerOneMillion,
//       'deathsPerOneMillion': deathsPerOneMillion,
//       'tests': tests,
//       'testsPerOneMillion': testsPerOneMillion,
//       'population': population,
//       'oneCasePerPeople': oneCasePerPeople,
//       'oneDeathPerPeople': oneDeathPerPeople,
//       'oneTestPerPeople': oneTestPerPeople,
//       'activePerOneMillion': activePerOneMillion,
//       'recoveredPerOneMillion': recoveredPerOneMillion,
//       'criticalPerOneMillion': criticalPerOneMillion,
// };
