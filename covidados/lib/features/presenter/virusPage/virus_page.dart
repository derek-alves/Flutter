import 'package:auto_size_text/auto_size_text.dart';
import 'package:covidados/features/presenter/virusPage/widgets/button_virus_widget.dart';
import 'package:flutter/material.dart';

class VirusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment(-0.35, -0.4),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: PreferredSize(
                  preferredSize:
                      Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
                  child: AppBar(
                    backgroundColor: Color(0xFFCF1845),
                    automaticallyImplyLeading: true,
                    flexibleSpace: Align(
                      alignment: Alignment(0, -0.95),
                      child: Text(
                        'Vírus',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    actions: [],
                    elevation: 1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.99),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                            child: AutoSizeText(
                              'Os vírus são seres muito simples e pequenos, formados basicamente por uma cápsula proteica envolvendo o material genético, que, dependendo do tipo de vírus, pode ser o DNA, RNA ou os dois juntos.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 40),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  height: 210,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ButtonVirusWidget(
                                        title: 'Proteína S',
                                      ),
                                      ButtonVirusWidget(
                                        title: 'Proteína E',
                                      ),
                                      ButtonVirusWidget(
                                        title: 'Proteína N',
                                      ),
                                      ButtonVirusWidget(
                                        title: 'Membrana',
                                      ),
                                      ButtonVirusWidget(
                                        title: 'RNA',
                                      )
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  'assets/Group 18.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: Alignment(0, 0),
                                      child: Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF4B1963),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        alignment: Alignment(
                                            -0.050000000000000044,
                                            -0.050000000000000044),
                                        child: AutoSizeText(
                                          'Origem',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Text(
                                        'É muito provável que este vírus tenha tido origem em morcegos. O que não está completamente elucidado é como ele passou a infectar as pessoas na China. Entretanto, não é algo incomum que vírus que infectam animais, sofram mutações que os tornem capazes de infectar seres humanos.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
