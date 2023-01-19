import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/images.dart';

class Starter1 extends StatelessWidget {
  const Starter1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    
                    children: [Image.asset(RessureImages.logoImage, color: Color.fromRGBO(24, 169, 153, 1),),
                    SizedBox(width: 15,),
                  Text("Resure"),],),
                  
                  GestureDetector(onTap: () {
                    
                  },
                    child: Text("Skip"),)
                ],
              ), 
              SizedBox(height: 40,),
              Text("Welcome To Resure"),
              SizedBox(height: 10,),
              Text("Resure is AI based car price predition mobile app that will predict your old car current market price with the highest accurency"),
              SizedBox(height:20),
              ElevatedButton(onPressed: (){} ,child: Text("Next")),


            ],
          ),
        ),
      ),
    );
  }
}