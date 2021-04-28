import 'package:covidados/src/core/usecase/errors/failures.dart';
import 'package:covidados/src/core/usecase/usecase.dart';
import 'package:covidados/src/features/domain/entities/brazil_data_covid_entity.dart';
import 'package:dartz/dartz.dart';

class GetDataBrazilCovidUsecase implements Usecase<BrazilDataEntity, NoParams> {
  @override
  Future<Either<Failure, BrazilDataEntity>> call(NoParams params) {
    throw UnimplementedError();
  }
}
