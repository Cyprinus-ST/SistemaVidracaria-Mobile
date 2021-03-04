import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('New Glass'),
            accountEmail: Text('contato@newglass.com.br'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.red,
            ),
          ),
          ListTile(
            title: Text('Minha Conta'),
            trailing: Icon(Icons.email),
          ),
          ListTile(
            title: Text('Planos'),
            trailing: Icon(Icons.email),
          ),
          ListTile(
            title: Text('Orçaamentos'),
            trailing: Icon(Icons.email),
          ),
        ],
      ),
    );
  }
}
