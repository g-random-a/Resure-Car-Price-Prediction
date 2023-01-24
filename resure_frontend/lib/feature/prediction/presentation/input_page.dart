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
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _isLoaderVisible = false;
  @override
  Widget build(BuildContext context) {
    final scaffoldState = GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormState>();
    final Map<String, dynamic> _register = {};
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: SpinKitWanderingCubes(
        color: Colors.white,
        size: 50.0,
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
          Positioned(
              left: 10,
              top: 10,
              child: Container(
                child: Material(
                  child: InkWell(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
              )),
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
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08,
                    right: MediaQuery.of(context).size.width * 0.08,
                    top: MediaQuery.of(context).size.height * 0.07,
                    bottom: 0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'car name',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'alfa-romerogiulia',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter car name',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["CarName"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'fuel type',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'gas',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter fuel type',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["fueltype"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'aspiration',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'std',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter aspiration',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["aspiration"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'door number',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'two',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter door number',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["doornumber"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'car body',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'convertible',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter car body',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["carbody"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'drive wheel',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'rwd',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter drive wheel',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["drivewheel"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'engine location',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'front',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter engine location',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["enginelocation"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'cylinder number',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'four',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter cylinder number',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["cylindernumber"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'fuel system',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'mpfi',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter fuel system',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["fuelsystem"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'symboling',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '3',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter symboling',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["symboling"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'wheel base',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '88',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter wheel base',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["wheelbase"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'car length',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '174',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter car length',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["carlength"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'car width',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '65',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter car width',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["carwidth"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'car height',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '53',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter car height',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["carheight"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'curb weight',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '2555',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
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
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'engine size',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '130',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter engine size',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["enginesize"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'stroke',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '3',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter stroke',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["stroke"] = int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'compression ratio',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '9',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter compression ratio',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["compressionratio"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'horse power',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '111',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter horse power',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["horsepower"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'peak rpm',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '5000',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter peak rpm',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["peakrpm"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'city mpg',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '21',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter city mpg',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["citympg"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'high way mpg',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '27',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter high way mpg',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["highwaympg"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'bore ratio',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: '3',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter bore ratio',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["boreratio"] =
                                            int.parse(value!);
                                      });
                                    }),
                              ),
                              const SizedBox(
                                height: 22.0,
                              ),
                              Text(
                                'engine type',
                                style: styles(),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Material(
                                child: TextFormField(
                                    initialValue: 'one',
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter engine type',
                                    ),
                                    onSaved: (value) {
                                      setState(() {
                                        _register["enginetype"] = value;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.5,
                      color: const Color.fromARGB(255, 156, 153, 153)
                          .withOpacity(0.1),
                    ),
                    BlocBuilder<PredictionBloc, PredictionState>(
                        builder: (context, state) {
                      if (state is PredictionLoading) {
                        context.loaderOverlay.show();
                      }

                      if (!(state is PredictionLoading)) {
                        context.loaderOverlay.hide();
                        print("faaaiiiiled");
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
                          top: MediaQuery.of(context).size.height * 0.05),
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
                                enginelocation: _register["enginelocation"],
                                enginetype: _register["enginetype"],
                                cylindernumber: _register["cylindernumber"],
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
                                compressionratio: _register["compressionratio"],
                                horsepower: _register["horsepower"],
                                peakrpm: _register["peakrpm"],
                                citympg: _register["citympg"],
                                highwaympg: _register["highwaympg"],
                              ));
                              BlocProvider.of<PredictionBloc>(context)
                                  .add(event);
                            }
                          },
                          minWidth: 200.0,
                          height: 60.0,
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
          ),
        ],
      ),
    );
  }

  TextStyle styles() {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontSize: 14,
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
