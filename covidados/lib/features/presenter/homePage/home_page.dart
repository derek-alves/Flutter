import 'package:covidados/features/data/models/data_covid_country_model.dart';
import 'package:covidados/features/domain/entities/country_info_entity.dart';
import 'package:covidados/features/presenter/homePage/controller_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/button_home.dart';

class HomePage extends GetView<HomePageCotroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: LayoutBuilder(
        builder: (context, constraint) {
          var maxHeight = constraint.maxHeight;
          return SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  height: maxHeight * 0.30,
                  padding:
                      EdgeInsets.only(bottom: 12, left: 15, right: 15, top: 2),
                  child: controller.obx((state) {
                    final DataCovidCountryModel countryData = state;
                    final CountryInfo infoCountry = countryData.countryInfo;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Olá!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: maxHeight * 0.036,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Seja Bem-Vindo(a)",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: maxHeight * 0.03,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "CONFIRMADOS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: constraint.maxWidth * 0.03),
                                  ),
                                  Text(
                                    "${countryData.cases}",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: constraint.maxWidth * 0.05,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Image.network(
                              infoCountry.flag,
                              height: 50,
                              width: constraint.maxWidth * 0.12,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "CURADOS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: constraint.maxWidth * 0.03),
                                  ),
                                  Text(
                                    "${countryData.recovered}",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: constraint.maxWidth * 0.05,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: maxHeight * 0.65,
                      child: Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: constraint.maxHeight * 0.12,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ButtonHome(
                                      color: 0xff24A577,
                                      image: "assets/b-1.png",
                                      title: "Contágio",
                                      route: "/contagion",
                                    ),
                                    ButtonHome(
                                      color: 0xff392045,
                                      image: "assets/b-2.png",
                                      title: "Prevenção",
                                      route: "/prevent",
                                    ),
                                  ],
                                ),
                                SizedBox(height: constraint.maxHeight * 0.05),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ButtonHome(
                                      color: 0xffCF1845,
                                      image: "assets/b-3.png",
                                      title: "Vírus",
                                      route: "/virus",
                                    ),
                                    ButtonHome(
                                      color: 0xffF79339,
                                      image: "assets/b-4.png",
                                      title: "Sintomas",
                                      route: "/sympt",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: constraint.maxHeight * 0.23,
                  left: constraint.maxWidth * 0.1,
                  child: Container(
                    height: constraint.maxHeight * 0.15,
                    width: constraint.maxWidth * 0.8,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
