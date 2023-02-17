import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/images.dart';

class Cars extends StatelessWidget {
  const Cars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  
                  children: [
                    Image.asset(RessureImages.carImage),
                    Text("Car name"),
                    Text("Car price"),

                  ],
                ),
              ),
            );
          }),
      ),
    );
  }
}