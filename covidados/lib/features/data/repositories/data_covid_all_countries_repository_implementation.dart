import 'package:covidados/features/data/datasource/data_covid_all_countries_datasource_implemetation.dart';
import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/features/domain/repositories/data_covid_all_countries_repository.dart';

class DataCovidAllCountriesRepositoryImplementation
    implements DataCovidAllCountriesRepository {
  final DataCovidAllCountriesDatasourceImplemetation datasource;

  DataCovidAllCountriesRepositoryImplementation(this.datasource);

  @override
  Future<List<CountryCovidDataEntity>> getAllcountries() async {
    try {
      final List<CountryCovidDataEntity> result =
          await datasource.getDataCovidAllCountries();
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
