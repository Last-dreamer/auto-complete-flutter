
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:untitled1/dropdownfield.dart';

void main() async {
  runApp(const MaterialApp(title: 'MyApp', home: ExampleForm()));
}

class ExampleForm extends StatefulWidget {
  const ExampleForm();

  @override
  _ExampleFormState createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic>? formData;
  List<String> cities = [
    'Islamabad',
    'Peshawer',
    'Karachi',
    'Swat',
    'Lahore',
    'Barikot',
  ];

      _ExampleFormState() {
    formData = {
      'City': 'Peshawar',

    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buildFutures(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            default:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                if (snapshot.data != null) {
                  return Scaffold(
                      appBar: AppBar(
                        titleSpacing: 5.0,
                        title: const Text(
                          'Custom Dropdown Fields Example',
                          style: TextStyle(fontSize: 15.0),
                        ),

                      ),
                      body: Container(
                        color: Colors.white,
                        constraints: const BoxConstraints.expand(),
                        child: Form(
                            autovalidateMode: AutovalidateMode.disabled, key: _formKey,
                            child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Divider(
                                        height: 10.0,
                                        color: Theme.of(context).primaryColor),
                                    DropDownField(
                                        value: formData!['City'],
                                        icon: const Icon(Icons.location_city),
                                        required: true,
                                        hintText: 'Choose a city',
                                        labelText: 'City *',
                                        items: cities,
                                        strict: false,
                                        setter: (dynamic newValue) {
                                          formData!['City'] = newValue;
                                        }),

                                  ],
                                ))),
                      ));
                } else {
                  return const LinearProgressIndicator();
                }
              }
          }
        });
  }

  Future<bool> buildFutures() async {
    return true;
  }
}
