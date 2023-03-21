// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/models/brew.dart';
import 'package:test/screens/home/seetings_form.dart';
import 'package:test/services/auth.dart';
import 'package:test/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  late String name;
  late String sugar;
  late int Strength;
  @override
  Widget build(BuildContext context) {
    _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('TEST'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('logout')),
            ElevatedButton.icon(
                onPressed: () {
                  _showSettingsPanel();
                },
                icon: Icon(Icons.settings),
                label: Text('edit'))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
