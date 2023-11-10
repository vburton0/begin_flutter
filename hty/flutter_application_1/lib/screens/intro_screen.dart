import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text('Groupp')),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/corail.jpg'),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white70,
                ),
              child: Text(
                  'Groupp est une application \npermettant de lié les gens entre eux.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey,
                      )
                    ]
                  ))
            )),
          )
          );
  }
} 