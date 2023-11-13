import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/menu_bottom.dart';
import 'package:flutter_application_1/shared/menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      bottomNavigationBar: BottomMenu(),
      drawer: MenuDrawer(),
      body: Center(child: FlutterLogo()),
    );
  }
}