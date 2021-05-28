import 'package:covidados/features/data/models/data_covid_country_model.dart';

abstract class IDataCovidAllCountriesDatasource {
  Future<List<DataCovidCountryModel>> getDataCovidAllCountries();
}
