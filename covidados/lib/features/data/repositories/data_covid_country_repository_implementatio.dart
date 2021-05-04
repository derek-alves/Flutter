import 'package:covidados/features/data/datasource/data_covid_country_datasource.dart';
import 'package:covidados/features/domain/entities/data_covid_country_entity.dart';
import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:covidados/usecase/errors/serverFailure.dart';

class DataCovidCountryImplemetation implements IDataCovidCountryRepository {
  final IDataCovidCountrtyDatasource datasource;

  DataCovidCountryImplemetation(this.datasource);

  @override
  Future<Either<ServerFailure, CoutryCovidDataEntity>>
      getDataCovidCountryFromName(String coutryName) {
    // TODO: implement getDataCovidCountryFromName
    throw UnimplementedError();
  }
}
