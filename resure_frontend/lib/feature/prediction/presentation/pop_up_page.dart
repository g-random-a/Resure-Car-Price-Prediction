import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../domain/bloc/RatingBloc/rating_bloc.dart';
import '../domain/bloc/RatingBloc/rating_event.dart';
import '../domain/bloc/RatingBloc/rating_state.dart';
import '../domain/bloc/prediction_bloc.dart';
import '../domain/bloc/prediction_state.dart';
import '../model/Rating.dart';

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

Future Function(dynamic context) modal = (
  context,
) =>
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35))),
        builder: (BuildContext context) {
          return SizedBox(
            height: 400,
            child: BlocBuilder<PredictionBloc, PredictionState>(
                builder: (context, state) {
              if (state is PredictionOperationSucess) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Predicted Price",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(201, 214, 227, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Text(
                            state.price.toString() + " BIRR",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          )),
                      const SizedBox(height: 50),
                      BlocBuilder<RatingBloc, RatingState>(
                          builder: (context, state) {
                        if (state is RatingLoading) {
                          return SpinKitWanderingCubes(
                            color: Colors.teal,
                            size: 50.0,
                          );
                        }
                        if (state is RatingOperationSucess) {
                          return Center(
                              child: Text("thankyou for ur feedback."));
                        }
                        return Column(
                          children: [
                            state is RatingOperationFailure
                                ? Text("Error, Please try again!",
                                    style: TextStyle(color: Colors.red))
                                : SizedBox(),
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
                              initialRating: 0,
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
                                Rating rate = Rating(id: 1, rate: 3);
                                BlocProvider.of<RatingBloc>(context)
                                    .add(RatingCreate(rate));
                              },
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                );
              }

              return Center(
                  child: Text(
                "Error, Please try again later!",
                style: TextStyle(color: Colors.red),
              ));
            }),
          );
        });


// final spinkit = 