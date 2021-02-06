import 'package:clone_aiqfome/components/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const MaterialColor white = const MaterialColor(
      0xFFFFFFFF,
      const <int, Color>{
        50: const Color(0xFFFFFFFF),
        100: const Color(0xFFFFFFFF),
        200: const Color(0xFFFFFFFF),
        300: const Color(0xFFFFFFFF),
        400: const Color(0xFFFFFFFF),
        500: const Color(0xFFFFFFFF),
        600: const Color(0xFFFFFFFF),
        700: const Color(0xFFFFFFFF),
        800: const Color(0xFFFFFFFF),
        900: const Color(0xFFFFFFFF),
      },
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        // canvasColor: Colors.grey[100],
        accentColor: Colors.purple[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 65,
        titleSpacing: 5,
        leading: Builder(
          builder: (BuildContext context) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 40,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/img.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipOval(
                  child: FlatButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: null,
                  ),
                ),
              ),
            );
          },
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Cruzeiro",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search_outlined,
              size: 30,
              color: Theme.of(context).accentColor,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.message_outlined,
                size: 30,
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        ],
      ),

      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed  button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
