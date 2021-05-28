import 'package:auto_size_text/auto_size_text.dart';
import 'package:covidados/core/utils/app_dialogs_text.dart';
import 'package:covidados/features/presenter/symptomsPage/widgets/button_sympt_widget.dart';
import 'package:flutter/material.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
                child: AppBar(
                  backgroundColor: Color(0xffF79339),
                  automaticallyImplyLeading: true,
                  flexibleSpace: Align(
                    alignment: Alignment(0.05, -0.95),
                    child: AutoSizeText(
                      'Sitomas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  actions: [],
                  elevation: 4,
                ),
              ),
              Positioned(
                top: 80,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: constraints.maxWidth * 0.8,
                          child: Text.rich(
                            TextSpan(
                              text: "Em média, os sintomas aparecem ",
                              children: [
                                TextSpan(
                                  text: "após 5 ou 6 dias ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      "depois de ser  infectados com o vírus. Porém, isso pode levar até ",
                                  children: [
                                    TextSpan(
                                        text: "14 dias.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: constraints.maxHeight * 0.028,
                                fontWeight: FontWeight.w400),
                            maxLines: 5,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: Image.asset(
                              "assets/img.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonSympt(
                                    img: "assets/febre.png",
                                    title: "Febre",
                                    text: DialogText.febre,
                                  ),
                                  ButtonSympt(
                                    img: "assets/tosse.png",
                                    title: "Tosse seca",
                                    text: DialogText.tosse,
                                  ),
                                  ButtonSympt(
                                    img: "assets/diarréia.png",
                                    title: "Diarréia",
                                    text: DialogText.diarreia,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonSympt(
                                    img: "assets/garganta.png",
                                    title: "Dor de garganta",
                                    text: DialogText.garganta,
                                  ),
                                  ButtonSympt(
                                    img: "assets/respiratorio.png",
                                    title: "Problemas respiratórios",
                                    text: DialogText.respiratorios,
                                  ),
                                  ButtonSympt(
                                    img: "assets/nasal.png",
                                    title: "Congestão nasal",
                                    text: DialogText.nasal,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
