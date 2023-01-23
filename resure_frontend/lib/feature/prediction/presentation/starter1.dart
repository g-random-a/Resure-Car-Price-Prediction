import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Starter1 extends StatefulWidget {
  const Starter1({super.key});

  @override
  State<Starter1> createState() => _Starter1State();
}

class _Starter1State extends State<Starter1> {
  int active_index = 0;
  List<String> images = [RessureImages.welcome, RessureImages.welcome2, RessureImages.welcome3];
  List<String> title = ["Welcome To Resure", "Get Car Price Easly", "Car Features"];
  List<String> discription = ["Resure is AI based car price predition mobile app that will predict your old car current market price with the highest accurency", 
  "Get the best price prediction for your car  just from your phone", 
  "Entering all features in the features form will increase the chance of getting exact prediction for your car price"];

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
                    
                    children: [Image.asset(RessureImages.logoImage, color: Color.fromARGB(255, 18, 125, 175),),
                    SizedBox(width: 15,),
                  Text("Resure", style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono'),),],),
                  
                  
                ],
              ), 
              Expanded(
                child: Column(children: [
                  SizedBox(height: 40,),
                  // Image.asset(RessureImages.welcome, color: Color.fromRGBO(24, 169, 153, 1),),
                  CarouselSlider(
                    options: CarouselOptions(height: 650.0,
                    viewportFraction: 1,
              enableInfiniteScroll: false,
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: ((index, reason) {
                setState(() {
                  active_index = index;
                });
                // print(index);
              }),
              aspectRatio: 0.5,),
                    items: [0,1,2].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            // decoration: BoxDecoration(
                            //   color: Colors.amber
                            // ),
                            child: Column(
                              children: [
                                Image.asset(images[i], width: 350, height: 450,),
                                SizedBox(height: 50,),
                                Text(title[i], style: TextStyle(fontSize: 30, fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),),
                                SizedBox(height: 30,),
                                Text(discription[i], style: TextStyle(fontSize: 14, fontFamily: 'RobotoMono'),),
                                SizedBox(height:20),

                              ],
                            )
                                );
                              },
                            );
                          }).toList(),
                          ),

           Center(
            child: AnimatedSmoothIndicator(
              activeIndex: active_index,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotColor: Color.fromARGB(255, 138, 130, 130),
                activeDotColor: Colors.blue,
                dotWidth: 8,
                dotHeight: 10,
              ),
            ),),


                
                ],),
              ),
              
              ElevatedButton(onPressed: (){} ,child: Text("Get Started")),
              SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
}