import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:covidados/usecase/errors/failures.dart';
import 'package:covidados/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetDataCovidCoutryUsecase
    implements Usecase<CountryDataEntity, NoParams> {
  final IDataCovidCountryRepository repository;

  GetDataCovidCoutryUsecase(this.repository);

  @override
  Future<Either<Failure, CountryDataEntity>> call(NoParams params) async {
    return await repository.getDataCovidCountryFromName();
  }
}