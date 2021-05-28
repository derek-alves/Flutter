import 'package:equatable/equatable.dart';

import 'country_info_entity.dart';

abstract class CountryCovidDataEntity extends Equatable {
  final String country;
  final CountryInfo countryInfo;
  final dynamic cases;
  final dynamic deaths;
  final dynamic recovered;
  final dynamic active;
  final dynamic casesPerOneMillion;
  final dynamic deathsPerOneMillion;
  final dynamic tests;
  final dynamic testsPerOneMillion;
  final dynamic population;
  final dynamic oneCasePerPeople;
  final dynamic oneDeathPerPeople;
  final dynamic oneTestPerPeople;
  final dynamic activePerOneMillion;
  final dynamic recoveredPerOneMillion;
  final dynamic criticalPerOneMillion;

  CountryCovidDataEntity({
    required this.country,
    required this.countryInfo,
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
        countryInfo,
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
