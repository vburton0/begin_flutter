import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/weather.dart';
import '../data/http_helper.dart';

class WheaterScreen extends StatefulWidget {
  const WheaterScreen({super.key});

  @override
  State<WheaterScreen> createState() => _WheaterScreenState();
}

class _WheaterScreenState extends State<WheaterScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Weather')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: txtPlace,
                  decoration: InputDecoration(
                      hintText: 'Enter city',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: getData,
                      )),
                )),
            weatherRow('Place : ', result.name), //weatherrow permet de ne pas redefinir le style a chaque fois
            weatherRow('Description : ', result.description),
            weatherRow('Temperature : ', result.temperature.toStringAsFixed(2)),
            weatherRow('Percieved : ', result.perceived.toStringAsFixed(2)),
            weatherRow('Pressure : ', result.pressure.toString()),
            weatherRow('Humidity : ', result.humidity.toString()),
            ],
          ),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) { //defini le style des widgets
    Widget row = Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
              flex: 3, //divise l'espace en 7 ( 3 + 4 )
                child: Text(label,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).hintColor,
                    ))),
            Expanded(
              flex: 4, // donc la premiere vas etre dans un espace de 3 et la deuxieme dans une espace de 4
                child: Text(value,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    )))
          ],
        ));
        return row;
  }
}
