import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(101, 140, 187,1),
      body: Container(
        color:Color.fromRGBO(101, 140, 187,1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                                "Resure",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontFamily: 'Raleway',
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontWeight: FontWeight.bold),
                              ),
            ],
          ),
        ),
      ),
    );
  }
}
