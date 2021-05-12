import 'package:covidados/core/get_client/get_client_http.dart';
import 'package:covidados/features/data/datasource/data_covid_coutry_datasource_implementation.dart';
import 'package:covidados/features/data/repositories/data_covid_country_repository_implementation.dart';
import 'package:covidados/features/domain/repositories/data_covid_country_repository.dart';
import 'package:covidados/features/presenter/homePage/controller_home_page.dart';
import 'package:get/get.dart';

class HomePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GetClientHttp(), tag: "client_http");
    Get.put(
        DatacovidCountryDataSourceImplementation(Get.find(tag: "client_http")),
        tag: "datasource");

    Get.put<IDataCovidCountryRepository>(
        DataCovidCountryRepositoryImplemetation(Get.find(tag: "datasource")),
        tag: "home_repository");
    Get.put(HomePageCotroller(Get.find(tag: "home_repository")));
  }
}
