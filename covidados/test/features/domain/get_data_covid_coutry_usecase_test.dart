import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:covidados/features/domain/usecases/get_data_covid_country_usecase.dart';
import 'package:covidados/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataCovidCoutryRepository extends Mock
    implements IDataCovidCountryRepository {}

void main() {
  late GetDataCovidCoutryUsecase usecase;
  late IDataCovidCountryRepository repository;

  final tDataCovidCountry = CountryDataEntity(
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

  final tNoParams = NoParams();

  setUp(() {
    repository = MockDataCovidCoutryRepository();
    usecase = GetDataCovidCoutryUsecase(repository);
  });

  test("should get covid data entity from the repository", () {
    when(() => repository.getDataCovidCountryFromName())
        .thenAnswer((_) async => Right(tDataCovidCountry));

    final result = usecase(tNoParams);
    expect(result, Right(tDataCovidCountry));
  });
}
