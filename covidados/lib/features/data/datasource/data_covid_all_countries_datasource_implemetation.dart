import 'package:covidados/core/get_client/get_client_http.dart';
import 'package:covidados/features/data/datasource/data_covid_all_countries_datasource.dart';
import 'package:covidados/features/data/datasource/endpoints/novel_covid_endpoints.dart';
import 'package:covidados/features/data/models/data_covid_country_model.dart';

class DataCovidAllCountriesDatasourceImplemetation
    implements IDataCovidAllCountriesDatasource {
  final GetClientHttp client;

  DataCovidAllCountriesDatasourceImplemetation(this.client);

  @override
  Future<List<DataCovidCountryModel>> getDataCovidAllCountries() async {
    try {
      final response =
          await client.get(NovelCovidEndpoints.covidAllCountries());
      final List<dynamic> data = response.body;
      print("aqui");
      print(data);
      final value = data
          .map<DataCovidCountryModel>(
              (value) => DataCovidCountryModel.fromMap(value))
          .toList();
      print(value);
      return value;
    } catch (e) {
      rethrow;
    }
  }
}
