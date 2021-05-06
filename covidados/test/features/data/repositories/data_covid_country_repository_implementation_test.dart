import 'package:covidados/features/data/datasource/data_covid_country_datasource.dart';
import 'package:covidados/features/data/models/data_covid_country_model.dart';
import 'package:covidados/features/data/repositories/data_covid_country_repository_implementation.dart';
import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataCovidCountrtyDatasource extends Mock
    implements IDataCovidCountrtyDatasource {}

void main() {
  late DataCovidCountryImplemetation repository;
  late IDataCovidCountrtyDatasource datasource;

  setUp(() {
    datasource = MockDataCovidCountrtyDatasource();
    repository = DataCovidCountryImplemetation(datasource);
  });

  final coutryName = "Brazil";

  final tDataCovidCountryModel = DataCovidCountryModel(
    active: 1033750,
    cases: 14523807,
    countryInfo: CoutryInfo(
        flag: "https://disease.sh/assets/img/flags/br.png",
        iso2: "BR",
        lat: -10,
        long: -55),
    activePerOneMillion: 4835.06,
    casesPerOneMillion: 67931,
    country: "Brazil",
    criticalPerOneMillion: 38.9,
    deaths: 398343,
    deathsPerOneMillion: 1863,
    oneCasePerPeople: 15,
    oneDeathPerPeople: 537,
    oneTestPerPeople: 5,
    population: 213803022,
    recovered: 13091714,
    recoveredPerOneMillion: 61232.6,
    tests: 43538104,
    testsPerOneMillion: 203637,
  );

  test('should return data covid country media model when calls the datasource',
      () async {
    when(() => datasource.getDataCovidCountryFromName(coutryName))
        .thenAnswer((_) async => tDataCovidCountryModel);

    final result = await repository.getDataCovidCountryFromName(coutryName);

    expect(result, Right(tDataCovidCountryModel));
  });
}
