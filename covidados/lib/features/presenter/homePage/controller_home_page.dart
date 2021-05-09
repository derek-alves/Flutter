import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:get/get.dart';

class HomePageCotroller extends GetxController with StateMixin {
  final IDataCovidCountryRepository _countryRepository;

  HomePageCotroller(this._countryRepository);

  @override
  void onInit() {
    super.onInit();
    findDataCovidCountry("Brazil");
  }

  Future<void> findDataCovidCountry(String coutryName) async {
    change([], status: RxStatus.loading());
    try {
      final dados =
          await _countryRepository.getDataCovidCountryFromName(coutryName);
      change(dados, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }
}
