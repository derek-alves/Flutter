import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountryCovidDataEntity extends Equatable {
  final String country;
  final CountryInfo countryInfo;
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

  factory CountryCovidDataEntity.fromMap(Map<String, dynamic> map) {
    return CountryCovidDataEntity(
      country: map['country'],
      countryInfo: CountryInfo.fromMap(map['countryInfo']),
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

  String toJson() => json.encode(toMap());

  factory CountryCovidDataEntity.fromJson(String source) =>
      CountryCovidDataEntity.fromMap(json.decode(source));
}

class CountryInfo {
  final String iso2;
  final int lat;
  final int long;
  final String flag;

  CountryInfo({
    required this.iso2,
    required this.lat,
    required this.long,
    required this.flag,
  });

  List<Object> get props => [
        iso2,
        lat,
        long,
        flag,
      ];

  Map<String, dynamic> toMap() {
    return {
      'iso2': iso2,
      'lat': lat,
      'long': long,
      'flag': flag,
    };
  }

  factory CountryInfo.fromMap(Map<String, dynamic> map) {
    return CountryInfo(
      iso2: map['iso2'],
      lat: map['lat'],
      long: map['long'],
      flag: map['flag'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryInfo.fromJson(String source) =>
      CountryInfo.fromMap(json.decode(source));
}
