import 'package:covidados/core/errors/exceptions.dart';
import 'package:covidados/core/errors/failures.dart';
import 'package:covidados/features/data/datasource/data_covid_country_datasource.dart';
import 'package:covidados/features/data/datasource/data_covid_coutry_datasource_implementation.dart';
import 'package:covidados/features/data/models/data_covid_country_model.dart';
import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';

class DataCovidCountryRepositoryImplemetation
    implements IDataCovidCountryRepository {
  final DatacovidCountryDataSourceImplementation datasource;

  DataCovidCountryRepositoryImplemetation(this.datasource);

  @override
  Future<DataCovidCountryModel> getDataCovidCountryFromName(
      String coutryName) async {
    try {
      final DataCovidCountryModel result =
          await datasource.getDataCovidCountryFromName(coutryName);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
