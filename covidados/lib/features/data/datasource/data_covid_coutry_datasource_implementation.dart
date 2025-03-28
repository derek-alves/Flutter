import 'package:covidados/core/get_client/get_client_http.dart';
import 'package:covidados/features/data/datasource/data_covid_country_datasource.dart';
import 'package:covidados/features/data/datasource/endpoints/novel_covid_endpoints.dart';
import 'package:covidados/features/data/models/data_covid_country_model.dart';

class DatacovidCountryDataSourceImplementation
    implements IDataCovidCountrtyDatasource {
  final GetClientHttp client;

  DatacovidCountryDataSourceImplementation(this.client);
  @override
  Future<DataCovidCountryModel> getDataCovidCountryFromName(
      String coutryName) async {
    try {
      final response =
          await client.get(NovelCovidEndpoints.covidCountry(coutryName));
      final dynamic data = response.body;
      final result = DataCovidCountryModel.fromMap(data);
      return result;
    } catch (e) {
      throw e;
    }
  }
}
