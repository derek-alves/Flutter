import 'package:covidados/core/errors/failures.dart';
import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:covidados/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetDataCovidCountryUsecase
    implements Usecase<CountryCovidDataEntity, String> {
  final IDataCovidCountryRepository repository;

  GetDataCovidCountryUsecase(this.repository);

  @override
  Future<Either<Failure, CountryCovidDataEntity>> call(
      String countryName) async {
    return await repository.getDataCovidCountryFromName(countryName);
  }
}
