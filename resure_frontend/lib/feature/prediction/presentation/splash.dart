import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color.fromRGBO(0, 128, 128, 1),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image.asset(RessureImages.logoImage),
            SizedBox(height: 10,),
            Text("Resure", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
            SizedBox(height: 10,),
            Text("Car price prediction system", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45)),
          ]
            
            
          
        ),
      ),
    );
  }
}