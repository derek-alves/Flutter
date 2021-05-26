import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ContagionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
              child: AppBar(
                backgroundColor: Color(0xFF24A577),
                automaticallyImplyLeading: true,
                flexibleSpace: Align(
                  alignment: Alignment(0.05, -0.95),
                  child: AutoSizeText(
                    'Contágio',
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
            Align(
              alignment: Alignment(0, 1.05),
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
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                        child: Text(
                          'As investigações sobre as formas de transmissão do coronavírus ainda estão em andamento, mas a disseminação de pessoa para pessoa, ou seja, a contaminação por gotículas respiratórias ou contato, está ocorrendo.\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: Container(
                                      width: 140,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF24A577),
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                            ),
                                            child: Image.asset(
                                              'assets/Group 19.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          AutoSizeText(
                                            'Saliva',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 140,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF24A577),
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                            ),
                                            child: Image.asset(
                                              'assets/path1701-2.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          AutoSizeText(
                                            'Contato Direto',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF24A577),
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: Image.asset(
                                          'assets/Group 20.png',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: AutoSizeText(
                                          'Objetos Contaminados',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF24A577),
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: Image.asset(
                                          'assets/Group 23.png',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: AutoSizeText(
                                          'Contato com as mucosas',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
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
    );
  }
}
