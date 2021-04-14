import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dados",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: screenHeight / 28,
                ),
              ),
              Text(
                "CORONAVIRUS",
                style: TextStyle(
                  fontSize: screenHeight / 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: LayoutBuilder(builder: (ctx, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                  0,
                  constraints.maxHeight * 0.01,
                  0,
                  constraints.maxHeight * 0.01,
                ),
                width: double.infinity,
                child: Text(
                  "Fique atento aos dados atualizados de diferentes países",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight / 40,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image(
                    image: AssetImage("assets/image-1.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      "Descubra como se proteger contra a",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: constraints.maxHeight * 0.02,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "Covid-19",
                    style: TextStyle(
                        fontSize: constraints.maxHeight * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Começar Agora",
                      style: TextStyle(
                          fontSize: constraints.maxHeight * 0.03,
                          fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      primary: Color(0xff47A98C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.09,
              ),
            ],
          ),
        );
      }),
    );
  }
}
// ButtonStyle(
//                 backgroundColor: Cor,
//                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18))),
//               ),
