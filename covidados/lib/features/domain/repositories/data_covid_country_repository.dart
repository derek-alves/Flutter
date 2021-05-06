import 'package:covidados/core/errors/failures.dart';
import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IDataCovidCountryRepository {
  Future<Either<Failure, CoutryCovidDataEntity>> getDataCovidCountryFromName(
      String coutryName);
}
