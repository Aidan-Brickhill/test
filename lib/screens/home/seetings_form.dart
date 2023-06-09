import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/models/user.dart';
import 'package:test/services/database.dart';
import 'package:test/shared/const.dart';
import 'package:test/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
  ];

  // form values
  late String? _currentName = '';
  late String? _currentSugars = '0';
  late int? _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ourUser?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user?.uid).userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your brew settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData!.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: userData.sugars ?? _currentSugars,
                    decoration: textInputDecoration,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val!),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: userData.strength ?? _currentStrength,
                    decoration: textInputDecoration,
                    items: strengths.map((strength) {
                      return DropdownMenuItem(
                        value: strength,
                        child: Text('$strength strengths'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentStrength = val!),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await DatabaseService(uid: user!.uid).updateUserData(
                              _currentSugars!,
                              _currentName!,
                              _currentStrength!);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
