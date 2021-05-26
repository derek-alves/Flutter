import 'package:auto_size_text/auto_size_text.dart';
import 'package:covidados/features/presenter/virusPage/widgets/button_virus_widget.dart';
import 'package:flutter/material.dart';

class PreventionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Align(
            alignment: Alignment(-0.35, -0.4),
            child: Stack(
              children: [
                PreferredSize(
                  preferredSize:
                      Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
                  child: AppBar(
                    backgroundColor: Color(0xff392045),
                    automaticallyImplyLeading: true,
                    flexibleSpace: Align(
                      alignment: Alignment(0, -0.95),
                      child: Text(
                        'Prevenção',
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: constraints.maxHeight * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 30, 20, 0),
                                  child: Column(
                                    children: [
                                      AutoSizeText(
                                        "Projeta a si mesmo e as pessoas ao seu redor conhecendo os fatos e tomando as precauções apropriadas",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.03),
                                              Container(
                                                height: 80,
                                                width:
                                                    constraints.maxWidth * 0.9,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(55),
                                                    bottomRight:
                                                        Radius.circular(55),
                                                  ),
                                                  color: Color(0xffD2D7EE),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Image.asset(
                                                        "assets/preven-1.png",
                                                        width: constraints
                                                                .maxWidth *
                                                            0.37,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      width:
                                                          constraints.maxWidth *
                                                              0.4,
                                                      child: Text(
                                                        "Sempre use álcool em gel antes de sair",
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.039),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.05),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                height: 80,
                                                width:
                                                    constraints.maxWidth * 0.9,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(55),
                                                    bottomRight:
                                                        Radius.circular(55),
                                                  ),
                                                  color: Color(0xffD2D7EE),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          constraints.maxWidth *
                                                              0.5,
                                                      child: Text(
                                                        "Deve permanecer com a máscara o tempo todo quando sair de casa",
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.039),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                        "assets/preven-2.png"),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.05),
                                              Container(
                                                height: 80,
                                                width:
                                                    constraints.maxWidth * 0.9,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(55),
                                                    bottomRight:
                                                        Radius.circular(55),
                                                  ),
                                                  color: Color(0xffD2D7EE),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(
                                                        "assets/preven-3.png"),
                                                    // SizedBox(
                                                    //   width: 5,
                                                    // ),
                                                    Container(
                                                      width:
                                                          constraints.maxWidth *
                                                              0.37,
                                                      child: Text(
                                                        "Fique atento com a temperatura acima de 37C",
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.039),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.05),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                height: 80,
                                                width:
                                                    constraints.maxWidth * 0.9,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(55),
                                                    bottomRight:
                                                        Radius.circular(55),
                                                  ),
                                                  color: Color(0xffD2D7EE),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 30),
                                                      width:
                                                          constraints.maxWidth *
                                                              0.48,
                                                      child: Text(
                                                        "Realizar pagamentos apenas com cartão pessoal",
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.039),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Image.asset(
                                                        "assets/preven-4.png",
                                                        width: constraints
                                                                .maxWidth *
                                                            0.35,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.05),
                                              Container(
                                                height: 80,
                                                width:
                                                    constraints.maxWidth * 0.9,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(55),
                                                    bottomRight:
                                                        Radius.circular(55),
                                                  ),
                                                  color: Color(0xffD2D7EE),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/preven-5.1.png"),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width:
                                                          constraints.maxWidth *
                                                              0.4,
                                                      child: Text(
                                                        "Manter uma distância minima de 3 metros",
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.039),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                        "assets/preven-5.2.png"),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
