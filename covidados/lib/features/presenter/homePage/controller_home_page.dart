import 'package:covidados/features/data/models/data_covid_country_model.dart';
import 'package:covidados/features/data/repositories/data_covid_country_repository_implementation.dart';

import 'package:get/get.dart';

class HomePageCotroller extends GetxController with StateMixin {
  final DataCovidCountryRepositoryImplemetation _countryRepository;
  final _selectedScreenIndex = 0.obs;

  HomePageCotroller(this._countryRepository);

  @override
  void onInit() {
    findDataCovidCountry("Brazil");
    super.onInit();
  }

  Future<void> findDataCovidCountry(String coutryName) async {
    change(null, status: RxStatus.loading());
    try {
      final DataCovidCountryModel dados =
          await _countryRepository.getDataCovidCountryFromName(coutryName);

      change(dados, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
