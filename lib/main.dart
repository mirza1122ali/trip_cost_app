import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  _FuelFormState createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String result = '';
  final _currencies = ['dollar', 'pounds', 'euros'];
  String _currency = 'dollar';
  final double _formdistance = 20.0;
  TextEditingController distancecontroller = TextEditingController();
  TextEditingController avgcontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Cost Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: _formdistance, bottom: _formdistance),
              child: TextField(
                controller: distancecontroller,
                decoration: InputDecoration(
                    hintText: 'e.g 12',
                    labelStyle: textStyle,
                    labelText: 'Distance',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: _formdistance, bottom: _formdistance),
              child: TextField(
                controller: avgcontroller,
                decoration: InputDecoration(
                    hintText: 'e.g 123',
                    labelStyle: textStyle,
                    labelText: 'Distance per unit',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: _formdistance, bottom: _formdistance),
              child: TextField(
                
                controller: pricecontroller,
                decoration: InputDecoration(
                    hintText: 'e.g Rs 123',
                    labelStyle: textStyle,
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
              ),
            ),
            DropdownButton<String>(
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: _currency,
              onChanged: (String value) {
                _ondropdownchanged(value);
              },
            ),
            RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                onPressed: () {
                  setState(() {
                    result = _calculate();
                  });
                },
                child: Text(
                  'submit',
                  textScaleFactor: 1.5,
                )),
            Text(result),
          ],
        ),
      ),
    );
  }

  _ondropdownchanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distancecontroller.text);
    double _fuelcost = double.parse(pricecontroller.text);
    double _consumption = double.parse(avgcontroller.text);
    double _total = _distance / _consumption + _fuelcost;
    String _result = 'the total cost of trip is ' +
        _total.toStringAsFixed(2) +
        '' +
        _currency;
    return _result;
  }
}
