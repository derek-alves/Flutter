import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:get/get.dart';

class HomePageCotroller extends GetxController with StateMixin {
  final IDataCovidCountryRepository _countryRepository;

  HomePageCotroller(this._countryRepository);

  @override
  void onInit() {
    findDataCovidCountry("Brazil");
    super.onInit();
  }

  Future<void> findDataCovidCountry(String coutryName) async {
    change(null, status: RxStatus.loading());
    try {
      final dados =
          await _countryRepository.getDataCovidCountryFromName(coutryName);
      print(dados);
      change(dados, status: RxStatus.success());
    } catch (e) {
      print("error");
      print(e);
      change(null, status: RxStatus.error());
    }
  }
}
