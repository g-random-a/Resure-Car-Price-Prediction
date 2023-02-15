import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/core/images.dart';
import 'package:frontend/feature/prediction/domain/bloc/prediction_bloc.dart';
import 'package:frontend/feature/prediction/domain/bloc/prediction_event.dart';
import 'package:frontend/feature/prediction/domain/bloc/prediction_state.dart';
import 'package:frontend/feature/prediction/model/prediction.dart';
import 'package:frontend/feature/prediction/presentation/pop_up_page.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../domain/bloc/RatingBloc/rating_bloc.dart';
import '../domain/bloc/RatingBloc/rating_event.dart';
import '../domain/bloc/RatingBloc/rating_state.dart';

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoaderVisible = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final scaffoldState = GlobalKey<ScaffoldState>();
    final Map<String, dynamic> _register = {};
    return SafeArea(
      child: Material(
        child: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: SpinKitWanderingCubes(
            color: Colors.white,
            size: max(size.height / 14, size.width / 27.2),
          ),
          // Center(
          //   child: SpinKitCubeGrid(
          //     color: Colors.red,
          //     size: 50.0,
          //   ),
          // ),
          overlayColor: Colors.teal,
          overlayOpacity: 0.8,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(RessureImages.carImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.6),
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(RessureImages.logoImage,
                                color: Color.fromARGB(255, 18, 125, 175),
                                height: size.height / 25,
                                width: size.width / 6,
                                fit: BoxFit.fill),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            Text(
                              "Resure",
                              style: TextStyle(
                                  fontSize:
                                      min(size.height / 20, size.width / 19),
                                  fontFamily: 'Raleway',
                                  color: Color.fromARGB(255, 18, 125, 175),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.75,
                        child: Divider(
                          height: size.height / 35,
                          thickness: 5,
                          color: Colors.teal,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.05,
                            right: size.width * 0.05,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                // padding:  EdgeInsets.all(8),
                                child: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Name',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'alfa-romerogiulia',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car name',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["CarName"] = value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Fuel Type',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'gas',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter fuel type',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["fueltype"] = value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Aspiration',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'std',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter aspiration',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["aspiration"] =
                                                      value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Door Number',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'two',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter door number',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["doornumber"] =
                                                      value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Body',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'convertible',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car body',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["carbody"] = value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Drive Wheel',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'rwd',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter drive wheel',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["drivewheel"] =
                                                      value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Engine Location',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'front',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText:
                                                    'Enter engine location',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["enginelocation"] =
                                                      value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Cylinder Number',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'four',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText:
                                                    'Enter cylinder number',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["cylindernumber"] =
                                                      value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Fuel System',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'mpfi',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter fuel system',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["fuelsystem"] =
                                                      value;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Symboling',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '3',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter symboling',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["symboling"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Wheel Base',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '88',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter wheel base',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["wheelbase"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Length',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '174',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car length',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["carlength"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Width',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '65',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car width',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["carwidth"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Height',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '53',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car height',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["carheight"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Curb Weight',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '2555',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter curb weight',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["curbweight"] =
                                                      int.parse(value!);
                                                  ;
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Engine Size',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '130',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter engine size',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["enginesize"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Stroke',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '3',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter stroke',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["stroke"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Compression Ratio',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '9',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText:
                                                    'Enter compression ratio',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register[
                                                          "compressionratio"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Horse Power',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '111',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter horse power',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["horsepower"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Peak Rpm',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '5000',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter peak rpm',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["peakrpm"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'City Mpg',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '21',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter city mpg',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["citympg"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'High Way Mpg',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '27',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter high way mpg',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["highwaympg"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Bore Ratio',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '3',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter bore ratio',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["boreratio"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Engine Type',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'one',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter engine type',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["enginetype"] =
                                                      value;
                                                });
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // height: MediaQuery.of(context).size.height * 0.5,
                                // color:  Color.fromARGB(255, 156, 153, 153)
                                //     .withOpacity(0.1),
                              ),
                              BlocBuilder<PredictionBloc, PredictionState>(
                                  builder: (context, state) {
                                if (state is PredictionLoading) {
                                  context.loaderOverlay.show();
                                }

                                if (!(state is PredictionLoading)) {
                                  context.loaderOverlay.hide();
                                  // print("faaaiiiiled");
                                }

                                return SizedBox();
                              }),
                              BlocListener<PredictionBloc, PredictionState>(
                                  child: SizedBox(),
                                  listener: (context, state) {
                                    if (state is PredictionOperationSucess) {
                                      BlocProvider.of<RatingBloc>(context)
                                          .add(RatingNormal());
                                      modal(context);
                                    }
                                    if (state is PredictionOperationFailure) {
                                      BlocProvider.of<RatingBloc>(context)
                                          .add(RatingNormal());
                                      modal(context);
                                    }
                                  })
                              // BlocConsumer<PredictionBloc, PredictionState>(
                              //   listener: (context, state) {
                              //     if (state is PredictionOperationSucess) {
                              //       print("object");
                              //     }
                              //   },
                              //   builder: (context, state) {
                              //     if (state is PredictionOperationSucess) {
                              //       print(state.price);
                              //       return Text('');
                              //     }
                              //     return Text('');
                              //   },
                              // ),
                              ,
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.02),
                                child: Material(
                                  elevation: 5.0,
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      // context.loaderOverlay.show();
                                      // setState(() {
                                      //   _isLoaderVisible = context.loaderOverlay.visible;
                                      // });
                                      // await Future.delayed(Duration(seconds: 2));
                                      // if (_isLoaderVisible) {
                                      //   context.loaderOverlay.hide();
                                      // }
                                      // setState(() {
                                      //   _isLoaderVisible = context.loaderOverlay.visible;
                                      // });
                                      final form = _formKey.currentState;
                                      if (form != null && form.validate()) {
                                        form.save();
                                        final PredictionEvent event =
                                            PredictionCreate(Prediction(
                                          CarName: _register["CarName"],
                                          fueltype: _register["fueltype"],
                                          aspiration: _register["aspiration"],
                                          doornumber: _register["doornumber"],
                                          carbody: _register["carbody"],
                                          drivewheel: _register["drivewheel"],
                                          enginelocation:
                                              _register["enginelocation"],
                                          enginetype: _register["enginetype"],
                                          cylindernumber:
                                              _register["cylindernumber"],
                                          fuelsystem: _register["fuelsystem"],
                                          symboling: _register["symboling"],
                                          wheelbase: _register["wheelbase"],
                                          carlength: _register["carlength"],
                                          carwidth: _register["carwidth"],
                                          carheight: _register["carheight"],
                                          curbweight: _register["curbweight"],
                                          enginesize: _register["enginesize"],
                                          boreratio: _register["boreratio"],
                                          stroke: _register["stroke"],
                                          compressionratio:
                                              _register["compressionratio"],
                                          horsepower: _register["horsepower"],
                                          peakrpm: _register["peakrpm"],
                                          citympg: _register["citympg"],
                                          highwaympg: _register["highwaympg"],
                                        ));
                                        BlocProvider.of<PredictionBloc>(context)
                                            .add(event);
                                      }
                                    },
                                    minWidth: size.width / 1.9,
                                    height: size.height / 11.7,
                                    child: Text(
                                      'GUESS PRICE',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 0,
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      IconButton(
                          // style: ButtonStyle(
                          //     backgroundColor: MaterialStateColor.resolveWith(
                          //         (states) => Colors.transparent)),
                          // highlightColor: Colors.transparent,
                          // splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        "Expert",
                        style: TextStyle(
                            fontSize: min(size.height / 20, size.width / 19),
                            fontFamily: 'Raleway',
                            color: Color.fromARGB(255, 18, 125, 175),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle styles(size) {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontSize: 14,
    );
  }
}

class InputPagef extends StatefulWidget {
  const InputPagef({super.key});

  @override
  State<InputPagef> createState() => _InputPageStatef();
}

class _InputPageStatef extends State<InputPagef> {
  final _formKey = GlobalKey<FormState>();

  /**/
  bool _isLoaderVisible = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final scaffoldState = GlobalKey<ScaffoldState>();
    final Map<String, dynamic> _register = {};
    return SafeArea(
      child: Material(
        child: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: SpinKitWanderingCubes(
            color: Colors.white,
            size: max(size.height / 14, size.width / 27.2),
          ),
          // Center(
          //   child: SpinKitCubeGrid(
          //     color: Colors.red,
          //     size: 50.0,
          //   ),
          // ),
          overlayColor: Colors.teal,
          overlayOpacity: 0.8,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(RessureImages.carImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.6),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(RessureImages.logoImage,
                                color: Color.fromARGB(255, 18, 125, 175),
                                height: size.height / 25,
                                width: size.width / 6,
                                fit: BoxFit.fill),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            Text(
                              "Resure",
                              style: TextStyle(
                                  fontSize:
                                      min(size.height / 20, size.width / 19),
                                  fontFamily: 'Raleway',
                                  color: Color.fromARGB(255, 18, 125, 175),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.75,
                        child: Divider(
                          height: size.height / 35,
                          thickness: 5,
                          color: Colors.teal,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                // padding: const EdgeInsets.all(8),
                                child: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Name',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'alfa-romerogiulia',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car name',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["CarName"] = value;
                                                });
                                              }),
                                        ),

                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Fuel Type',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'gas',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter fuel type',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["fueltype"] = value;
                                                });
                                              }),
                                        ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Aspiration',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: 'std',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter aspiration',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["aspiration"] = value;
                                        //         });
                                        //       }),
                                        // ),

                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Door Number',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'two',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter door number',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["doornumber"] =
                                                      value;
                                                });
                                              }),
                                        ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Car Body',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: 'convertible',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter car body',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["carbody"] = value;
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Drive Wheel',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: 'rwd',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter drive wheel',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["drivewheel"] = value;
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Engine Location',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: 'front',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter engine location',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["enginelocation"] =
                                        //               value;
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Cylinder Number',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: 'four',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter cylinder number',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["cylindernumber"] =
                                        //               value;
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Fuel System',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: 'mpfi',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter fuel system',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["fuelsystem"] = value;
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Symboling',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '3',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter symboling',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["symboling"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Wheel Base',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '88',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter wheel base',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["wheelbase"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),

                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Length',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '174',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car length',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["carlength"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Width',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '65',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car width',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["carwidth"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),
                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Car Height',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '53',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter car height',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["carheight"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Curb Weight',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '2555',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter curb weight',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["curbweight"] =
                                        //               int.parse(value!);
                                        //           ;
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Engine Size',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '130',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter engine size',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["enginesize"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Stroke',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '3',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter stroke',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["stroke"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Compression Ratio',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '9',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter compression ratio',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["compressionratio"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),

                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Horse Power',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: '111',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter horse power',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["horsepower"] =
                                                      int.parse(value!);
                                                });
                                              }),
                                        ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Peak Rpm',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '5000',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter peak rpm',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["peakrpm"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'City Mpg',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '21',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter city mpg',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["citympg"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),
                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'High Way Mpg',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '27',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter high way mpg',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["highwaympg"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),

                                        // const SizedBox(
                                        //   height: 22.0,
                                        // ),
                                        // Text(
                                        //   'Bore Ratio',
                                        //   style: styles(size),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // Material(
                                        //   child: TextFormField(
                                        //       initialValue: '3',
                                        //       validator: (value) {
                                        //         if (value != null &&
                                        //             value.isEmpty) {
                                        //           return '';
                                        //         }
                                        //         return null;
                                        //       },
                                        //       textAlign: TextAlign.center,
                                        //       decoration:
                                        //           kTextFileDecoration.copyWith(
                                        //         hintText: 'Enter bore ratio',
                                        //       ),
                                        //       onSaved: (value) {
                                        //         setState(() {
                                        //           _register["boreratio"] =
                                        //               int.parse(value!);
                                        //         });
                                        //       }),
                                        // ),

                                        SizedBox(
                                          height: size.height / 31.82,
                                        ),
                                        Text(
                                          'Engine Type',
                                          style: styles(size),
                                        ),
                                        SizedBox(
                                          height: size.height / 87.5,
                                        ),
                                        Material(
                                          child: TextFormField(
                                              initialValue: 'one',
                                              validator: (value) {
                                                if (value != null &&
                                                    value.isEmpty) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                              textAlign: TextAlign.center,
                                              decoration:
                                                  kTextFileDecoration.copyWith(
                                                hintText: 'Enter engine type',
                                              ),
                                              onSaved: (value) {
                                                setState(() {
                                                  _register["enginetype"] =
                                                      value;
                                                });
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // height: MediaQuery.of(context).size.height * 0.58,
                                // color: const Color.fromARGB(255, 156, 153, 153)
                                //     .withOpacity(0.1),
                              ),
                              BlocBuilder<PredictionBloc, PredictionState>(
                                  builder: (context, state) {
                                if (state is PredictionLoading) {
                                  context.loaderOverlay.show();
                                }

                                if (!(state is PredictionLoading)) {
                                  context.loaderOverlay.hide();
                                  // print("faaaiiiiled");
                                }

                                return SizedBox();
                              }),
                              BlocListener<PredictionBloc, PredictionState>(
                                  child: SizedBox(),
                                  listener: (context, state) {
                                    if (state is PredictionOperationSucess) {
                                      BlocProvider.of<RatingBloc>(context)
                                          .add(RatingNormal());
                                      modal(context);
                                    }
                                    if (state is PredictionOperationFailure) {
                                      BlocProvider.of<RatingBloc>(context)
                                          .add(RatingNormal());
                                      modal(context);
                                    }
                                  })
                              // BlocConsumer<PredictionBloc, PredictionState>(
                              //   listener: (context, state) {
                              //     if (state is PredictionOperationSucess) {
                              //       print("object");
                              //     }
                              //   },
                              //   builder: (context, state) {
                              //     if (state is PredictionOperationSucess) {
                              //       print(state.price);
                              //       return Text('');
                              //     }
                              //     return Text('');
                              //   },
                              // ),
                              ,
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.05),
                                child: Material(
                                  elevation: 5.0,
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      // context.loaderOverlay.show();
                                      // setState(() {
                                      //   _isLoaderVisible = context.loaderOverlay.visible;
                                      // });
                                      // await Future.delayed(Duration(seconds: 2));
                                      // if (_isLoaderVisible) {
                                      //   context.loaderOverlay.hide();
                                      // }
                                      // setState(() {
                                      //   _isLoaderVisible = context.loaderOverlay.visible;
                                      // });
                                      final form = _formKey.currentState;
                                      if (form != null && form.validate()) {
                                        form.save();
                                        print('hello');
                                        final PredictionEvent event =
                                            PredictionCreate(Prediction(
                                          CarName: _register["CarName"],
                                          fueltype: _register["fueltype"],
                                          aspiration: "std",
                                          doornumber: _register["doornumber"],
                                          carbody: "convertible",
                                          drivewheel: "rwd",
                                          enginelocation: "front",
                                          enginetype: _register["enginetype"],
                                          cylindernumber: "four",
                                          fuelsystem: "mpfi",
                                          symboling: 3,
                                          wheelbase: 88,
                                          carlength: _register["carlength"],
                                          carwidth: _register["carwidth"],
                                          carheight: _register["carheight"],
                                          curbweight: 2555,
                                          enginesize: 130,
                                          boreratio: 3,
                                          stroke: 3,
                                          compressionratio: 9,
                                          horsepower: _register["horsepower"],
                                          peakrpm: 5000,
                                          citympg: 21,
                                          highwaympg: 27,
                                        ));
                                        BlocProvider.of<PredictionBloc>(context)
                                            .add(event);
                                      }
                                    },
                                    minWidth: size.width / 1.9,
                                    height: size.height / 11.7,
                                    child: const Text(
                                      'GUESS PRICE',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 5,
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      IconButton(

                          // style: ButtonStyle(
                          //     backgroundColor: MaterialStateColor.resolveWith(
                          //         (states) => Colors.transparent)),
                          // highlightColor: Colors.transparent,
                          // splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        "Amature",
                        style: TextStyle(
                            fontSize: min(size.height / 20, size.width / 19),
                            fontFamily: 'Raleway',
                            color: Colors.teal,
                            // color: Color.fromARGB(255, 18, 125, 175),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle styles(size) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontSize: size.height / 50,
    );
  }
}

const kTextFileDecoration = InputDecoration(
  hintText: '',
  filled: true,
  fillColor: Color.fromARGB(255, 207, 217, 238),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Color.fromARGB(255, 202, 209, 223), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.5),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ),
);
