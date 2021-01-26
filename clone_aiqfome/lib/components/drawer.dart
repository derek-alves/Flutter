import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
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
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'oi Derek',
                            style: TextStyle(
                                fontSize: 28,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'fominha há 1 ano',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        Text(
                          '38 pedidos',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
