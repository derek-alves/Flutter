import 'package:covidados/features/data/repositories/data_covid_all_countries_repository_implementation.dart';
import 'package:get/get.dart';

class DataPageController extends GetxController with StateMixin {
  final DataCovidAllCountriesRepositoryImplementation _countryRepository;

  DataPageController(this._countryRepository);

  @override
  void onInit() {
    super.onInit();
    findDataCovidAllCountry();
  }

  Future<void> findDataCovidAllCountry() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _countryRepository.getAllcountries();
      print(dados);
      change(dados, status: RxStatus.success());
    } catch (e) {
      print("error");
      print(e);
      change([], status: RxStatus.error());
    }
  }
}
