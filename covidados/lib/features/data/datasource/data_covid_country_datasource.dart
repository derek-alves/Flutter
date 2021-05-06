import 'package:covidados/features/data/models/data_covid_country_model.dart';

abstract class IDataCovidCountrtyDatasource {
  Future<DataCovidCountryModel> getDataCovidCountryFromName(String coutryName);
}
