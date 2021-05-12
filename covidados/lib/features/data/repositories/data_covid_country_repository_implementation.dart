import 'package:covidados/core/errors/exceptions.dart';
import 'package:covidados/core/errors/failures.dart';
import 'package:covidados/features/data/datasource/data_covid_country_datasource.dart';
import 'package:covidados/features/data/datasource/data_covid_coutry_datasource_implementation.dart';
import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:dartz/dartz.dart';

class DataCovidCountryRepositoryImplemetation
    implements IDataCovidCountryRepository {
  final DatacovidCountryDataSourceImplementation datasource;

  DataCovidCountryRepositoryImplemetation(this.datasource);

  @override
  Future<Either<Failure, CoutryCovidDataEntity>> getDataCovidCountryFromName(
      String coutryName) async {
    try {
      final result = await datasource.getDataCovidCountryFromName(coutryName);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
