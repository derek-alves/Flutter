import 'package:equatable/equatable.dart';

class CoutryCovidDataEntity extends Equatable {
  final String country;
  // final Object countryInfo;
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;
  final int population;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;

  CoutryCovidDataEntity({
    required this.country,
    // required this.countryInfo,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });

  @override
  List<Object> get props => [
        country,
        // countryInfo,
        cases,
        deaths,
        recovered,
        active,
        casesPerOneMillion,
        deathsPerOneMillion,
        tests,
        testsPerOneMillion,
        population,
        oneCasePerPeople,
        oneDeathPerPeople,
        oneTestPerPeople,
        activePerOneMillion,
        recoveredPerOneMillion,
        criticalPerOneMillion,
      ];
}

// class CoutryInfo {
//   final String iso2;
//   final int lat;
//   final int long;
//   final String flag;

//   CoutryInfo({
//     required this.iso2,
//     required this.lat,
//     required this.long,
//     required this.flag,
//   });

//   List<Object> get props => [
//         iso2,
//         lat,
//         long,
//         flag,
//       ];
// }
