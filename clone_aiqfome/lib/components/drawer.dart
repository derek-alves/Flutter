import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 85,
                    width: 85,
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
                    margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
                    height: 85,
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
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.access_alarm_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text('indique um amigo'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.access_alarm_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text('pedidos'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.access_alarm_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text('cupons'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.access_alarm_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text(
                    'pombo-correio',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.access_alarm_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text('minhas infos'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.access_alarm_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text('pagamento'),
                  trailing: Container(
                    alignment: Alignment.center,
                    width: 25,
                    height: 25,
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).accentColor,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'você está em:',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      'cruzeiro',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.swap_horiz_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
