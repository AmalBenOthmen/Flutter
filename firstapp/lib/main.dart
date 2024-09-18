

import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFirstAppHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyFirstAppHome extends StatefulWidget {
  @override

  _MyFirstAppHomeState createState() => _MyFirstAppHomeState();
}

class _MyFirstAppHomeState extends State<MyFirstAppHome> {
  String _convertedVar = "EuroToDinar";
  TextEditingController _textController = TextEditingController();
  double _result = 0.0;

  void _convertir() {
    setState(() {
      double montant = double.tryParse(_textController.text) ?? 0;
      if (_convertedVar == "EuroToDinar") {
        _result = montant * 3.4; 
      } else {
        _result = montant / 3.4; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TP1 App"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Montant",
                ),
              ),
              SizedBox(height: 20),
              RadioListTile(
                title: Text("Dinar ➡ Euro"),
                value: "DinarToEuro",
                groupValue: _convertedVar,
                onChanged: (value) {
                  setState(() {
                    _convertedVar = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Euro ➡ Dinar"),
                value: "EuroToDinar",
                groupValue: _convertedVar,
                onChanged: (value) {
                  setState(() {
                    _convertedVar = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                "Le résultat est ${_result.toStringAsFixed(3)}  dinars !",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertir,
                child: Text("CONVERTIR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 206, 148, 216),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
