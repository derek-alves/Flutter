import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class InfoDataCountryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBar(
          backgroundColor: Color(0xC52D77EF),
          automaticallyImplyLeading: true,
          title: Center(
            child: Flag('BR', height: 70, width: 50),
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              height: 230,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: 20),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0x993474E0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.health_and_safety_sharp,
                                size: 40,
                              ),
                              Text(
                                "245454545",
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Histórico de vacinação",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x96D6E6FF),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: ListTile(
                      trailing: Icon(
                        Icons.health_and_safety,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: Text(
                        "120000000",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        "21/06/1998",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

// Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Icon(
//                                 Icons.add_circle_sharp,
//                                 color: Colors.black,
//                                 size: 24,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                                 child: Text(
//                                   'Hello World',
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         'Hello World',
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         'Ativos',
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         'Hello World',
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Text(
//                                         'Ativos',
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
