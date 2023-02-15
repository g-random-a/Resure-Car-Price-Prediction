import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/core/images.dart';
import 'package:frontend/feature/prediction/presentation/input_page.dart';

class ResurePage extends StatelessWidget {
  const ResurePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.6,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(RessureImages.carImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(RessureImages.logoImage),
                Text(
                  "Resure",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: min(size.height / 15, size.width / 8.14)),
                )
              ],
            ),
          ),
        ),
        // Positioned(
        //   child: Image.asset(RessureImages.logoImage),
        //   top: MediaQuery.of(context).size.height * 0.125,
        //   left: MediaQuery.of(context).size.width * 0.35,
        // ),
        // Positioned(
        //     top: MediaQuery.of(context).size.height * 0.225,
        //     left: MediaQuery.of(context).size.width * 0.4,
        //     child: Text(
        //       "Resure",
        //       style: TextStyle(
        //         fontWeight: FontWeight.w900,
        //         color: Colors.white,
        //         decoration: TextDecoration.none,
        //       ),
        //     )),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(246, 245, 245, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          MediaQuery.of(context).size.height * 0.07,
                          0,
                          MediaQuery.of(context).size.height * 0.045),
                      child: Text(
                        "  This is \n  Resure",
                        style: TextStyle(
                          fontFamily: 'Russo One',
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: min(size.height / 20, size.width / 10.9),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.07,
                          0,
                          MediaQuery.of(context).size.width * 0.07,
                          0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Get accurate car valuations instantly with our machine learning-powered Car Price Prediction app. Just input the required data and get reliable estimates based on factors such as make and model, mileage, age, condition, and location.",
                        style: styles(size),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            elevation: 5.0,
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                            child: MaterialButton(
                              onPressed: () {
                                onTap:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InputPage()),
                                );
                              },
                              minWidth:
                                  MediaQuery.of(context).size.width / 2 * 0.8,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Text(
                                'EXPERT',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Material(
                            elevation: 5.0,
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                            child: MaterialButton(
                              onPressed: () {
                                onTap:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InputPagef()),
                                );
                              },
                              minWidth:
                                  MediaQuery.of(context).size.width / 2 * 0.8,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Text(
                                'AMATEUR',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextStyle styles(size) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontSize: min(size.height / 50, size.height / 27.2),
    );
  }
}
