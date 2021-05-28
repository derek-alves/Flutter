import 'package:covidados/core/get_client/get_client_http.dart';
import 'package:covidados/features/data/datasource/data_covid_all_countries_datasource_implemetation.dart';
import 'package:covidados/features/data/models/data_covid_country_model.dart';
import 'package:covidados/features/data/repositories/data_covid_all_countries_repository_implementation.dart';
import 'package:covidados/features/presenter/dataPage/data_page_controller.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataPage extends GetView<DataPageController> {
  final GetClientHttp client = Get.put(GetClientHttp());
  final datasource =
      Get.put(DataCovidAllCountriesDatasourceImplemetation(Get.find()));
  final respository =
      Get.put(DataCovidAllCountriesRepositoryImplementation(Get.find()));
  final controller = Get.put(DataPageController(Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x002D77EF),
        automaticallyImplyLeading: false,
        title: Text(
          'Dados',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xC52D77EF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFF5F5F5),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: controller.obx((state) {
                  return ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (_, index) {
                        final DataCovidCountryModel item = state[index];
                        return Card(
                          child: ListTile(
                            hoverColor: Color(0xFFF5F5F5),
                            leading: Image.network(
                              item.countryInfo.flag,
                              height: 80,
                              width: 50,
                            ),
                            title: Text("${item.country}"),
                            subtitle: Text("Casos: ${item.cases}"),
                            trailing: Icon(Icons.arrow_back_ios_new_sharp),
                          ),
                        );
                      });
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
