import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/core/images.dart';

class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(RessureImages.logoImage,
              color: Color.fromRGBO(255, 255, 255, 1),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 4,
              fit: BoxFit.fill),
        ),
        // const SizedBox(
        //   height: 30,
        // ),
        Text(
          "Resure",
          style: TextStyle(
              fontSize: 50,
              fontFamily: 'Raleway',
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
