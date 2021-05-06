import 'package:covidados/core/errors/failures.dart';
import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:covidados/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetDataCovidCoutryUsecase
    implements Usecase<CoutryCovidDataEntity, String> {
  final IDataCovidCountryRepository repository;

  GetDataCovidCoutryUsecase(this.repository);

  @override
  Future<Either<Failure, CoutryCovidDataEntity>> call(
      String countryName) async {
    return await repository.getDataCovidCountryFromName(countryName);
  }
}
