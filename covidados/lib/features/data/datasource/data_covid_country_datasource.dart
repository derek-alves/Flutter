import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/usecase/errors/serverFailure.dart';
import 'package:dartz/dartz.dart';

abstract class IDataCovidCountrtyDatasource {
  Future<Either<ServerFailure, CoutryCovidDataEntity>>
      getDataCovidCountryFromName(String coutryName);
}
