import 'dart:math';

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
    var size = MediaQuery.of(context).size;
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
                        height: size.height / 1.75,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Predicted Price",
                                style: TextStyle(
                                  fontSize:
                                      min(size.height / 20, size.width / 10.9),
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(height: size.height / 23.33),
                              Container(
                                  width: size.width / 1.9,
                                  height: size.height / 14,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(201, 214, 227, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    '25,000 ETB',
                                    style: TextStyle(
                                      fontSize: min(
                                          size.height / 28, size.width / 15.2),
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  )),
                              SizedBox(height: size.height / 14),
                              Text(
                                "Rate Prediction",
                                style: TextStyle(
                                  fontSize:
                                      min(size.height / 28, size.width / 15.2),
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(height: size.height / 70),
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35))),
        builder: (BuildContext context) {
          var size = MediaQuery.of(context).size;
          return SizedBox(
            height: size.height / 1.75,
            child: BlocBuilder<PredictionBloc, PredictionState>(
                builder: (context, pstate) {
              if (pstate is PredictionOperationSucess) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Predicted Price",
                        style: TextStyle(
                          fontSize: min(size.height / 20, size.width / 10.9),
                          fontWeight: FontWeight.w900,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: size.height / 23.3),
                      Container(
                          width: size.width / 1.9,
                          height: size.height / 14,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(201, 214, 227, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Text(
                            pstate.price.toString() + " BIRR",
                            style: TextStyle(
                              fontSize:
                                  min(size.height / 28, size.width / 15.2),
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          )),
                      SizedBox(height: size.height / 14),
                      BlocBuilder<RatingBloc, RatingState>(
                          builder: (context, state) {
                        int? id = null;
                        if (state is RatingLoading) {
                          return SpinKitThreeBounce(
                            color: Colors.teal,
                            size: 50.0,
                          );
                        }
                        // if (state is RatingOperationSucess) {
                        //   return Center(
                        //       child: Text("thankyou for ur feedback."));
                        // }
                        return Column(
                          children: [
                            state is RatingOperationFailure
                                ? Text("Error, Please try again!",
                                    style: TextStyle(
                                      fontSize: min(
                                          size.height / 28, size.width / 15.2),
                                      fontWeight: FontWeight.w900,
                                      color: Colors.red,
                                      decoration: TextDecoration.none,
                                    ))
                                : state is RatingOperationSucess
                                    ? Text(
                                        "thankyou for ur feedback.",
                                        style: TextStyle(
                                          fontSize: min(size.height / 28,
                                              size.width / 15.2),
                                          fontWeight: FontWeight.w900,
                                          color: Colors.blue,
                                          decoration: TextDecoration.none,
                                        ),
                                      )
                                    : Text(
                                        "Rate Prediction",
                                        style: TextStyle(
                                          fontSize: min(size.height / 28,
                                              size.width / 15.2),
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                            SizedBox(height: size.height / 70),
                            RatingBar.builder(
                              initialRating: state is RatingOperationSucess
                                  ? state.rating.rate
                                  : 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: size.height / 35,
                              ),
                              onRatingUpdate: (rating) async {
                                await Future.delayed(Duration(seconds: 1));
                                Rating rate = Rating(id: id ?? 1, rate: rating);
                                BlocProvider.of<RatingBloc>(context)
                                    .add(RatingCreate(rate));
                                if (state is RatingOperationSucess) {
                                  id = state.rating.id;
                                }
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