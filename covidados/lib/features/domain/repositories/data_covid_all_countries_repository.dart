import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';

abstract class DataCovidAllCountriesRepository {
  Future<List<CountryCovidDataEntity>> getAllcountries();
}
