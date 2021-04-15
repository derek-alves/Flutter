import 'package:covidados/src/presentation/homePage/components/button_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Olá!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Seja Bem-Vindo(a)",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "CONFIRMADOS",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "007.256",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Image.network(
                          "https://www.countryflags.io/br/flat/64.png",
                          width: 40,
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "CURADOS",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "007.256",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        height: constraint.maxHeight * 0.62,
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                          crossAxisCount: 2,
                          children: <Widget>[
                            ButtonHome(
                              color: 0xff24A577,
                              image: "assets/b-1.png",
                              title: "Contágio",
                            ),
                            ButtonHome(
                              color: 0xff392045,
                              image: "assets/b-2.png",
                              title: "Prevenção",
                            ),
                            ButtonHome(
                              color: 0xffCF1845,
                              image: "assets/b-3.png",
                              title: "Vírus",
                            ),
                            ButtonHome(
                              color: 0xffF79339,
                              image: "assets/b-4.png",
                              title: "Sintomas",
                            ),
                          ],
                        )),
                  ],
                ),
                Positioned(
                    top: 188,
                    left: 50,
                    right: 50,
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(color: Colors.grey),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
