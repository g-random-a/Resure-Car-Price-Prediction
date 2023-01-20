import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text("Bottom Sheet"),
        ),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 400,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Predicted Price",
                                style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                  width: 200,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(201, 214, 227, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: const Text(
                                    '25,000 ETB',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  )),
                              const SizedBox(height: 50),
                              const Text(
                                "Rate Prediction",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 10),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  return null;
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Text("sheet"))),
    );
  }
}
