import 'package:covidados/core/usecase/usecase.dart';
import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/features/domain/repositories/data_covid_all_countries_repository.dart';

class GetDataCovidAllCountriesUsecase
    implements Usecase<List<CountryCovidDataEntity>, NoParams> {
  final DataCovidAllCountriesRepository repository;

  GetDataCovidAllCountriesUsecase(this.repository);

  @override
  Future<List<CountryCovidDataEntity>> call(NoParams) async {
    return await repository.getAllcountries();
  }
}
