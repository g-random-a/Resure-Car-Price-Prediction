import 'package:flutter/material.dart';
import 'package:frontend/core/images.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    final scaffoldState = GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormState>();
    final Map<String, dynamic> _register = {};
    return Stack(
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
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, right: 28, top: 38, bottom: 10),
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
                                      _register["child_name"] = value;
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
                                      _register["fuel_type"] = value;
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
                                      _register["symboling"] = value;
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
                                      _register["wheelbase"] = value;
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
                                      _register["carlength"] = value;
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
                                      _register["carwidth"] = value;
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
                                      _register["carheight"] = value;
                                    });
                                  }),
                            ),
                            const SizedBox(
                              height: 22.0,
                            ),
                            Text(
                              'cur bweight',
                              style: styles(),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Material(
                              child: TextFormField(
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
                                      _register["curbweight"] = value;
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
                                      _register["enginesize"] = value;
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
                                      _register["stroke"] = value;
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
                                      _register["compressionratio"] = value;
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
                                      _register["horsepower"] = value;
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
                                      _register["peakrpm"] = value;
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
                                      _register["city mpg"] = value;
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
                                      _register["highwaympg"] = value;
                                    });
                                  }),
                            ),

                            // TextFormField(
                            //     validator: (value) {
                            //       if (value != null && value.isEmpty) {
                            //         return 'please enter gender';
                            //       }
                            //       var check = value.toString();
                            //       if ((check.compareTo("male") == 0) ||
                            //           (check.compareTo("female") == 0)) {
                            //         return null;
                            //       }
                            //       return 'gender must be "male" or "female"';
                            //     },
                            //     textAlign: TextAlign.center,
                            //     decoration: kTextFileDecoration.copyWith(
                            //       hintText: 'enter gender',
                            //     ),
                            //     onSaved: (value) {
                            //       setState(() {
                            //         _register["gender"] = value;
                            //       });
                            //     }),
                            // SizedBox(
                            //   height: 24.0,
                            // ),
                            // TextFormField(
                            //     keyboardType: TextInputType.number,
                            //     validator: (value) {
                            //       if (value != null && value.isEmpty) {
                            //         return 'enter age';
                            //       }
                            //       if (double.tryParse(value!) == null) {
                            //         return 'The input is not a numeric string';
                            //       }
                            //       return null;
                            //     },
                            //     textAlign: TextAlign.center,
                            //     decoration: kTextFileDecoration.copyWith(
                            //       hintText: 'age',
                            //     ),
                            //     onSaved: (value) {
                            //       setState(() {
                            //         _register["age"] = int.parse(value!);
                            //       });
                            //     }),
                            // SizedBox(
                            //   height: 24.0,
                            // ),
                            // TextFormField(
                            //     keyboardType: TextInputType.multiline,
                            //     maxLines: null,
                            //     validator: (value) {
                            //       if (value != null && value.isEmpty) {
                            //         return 'enter description';
                            //       }
                            //       final validdescription = value!.length > 20;
                            //       return validdescription
                            //           ? null
                            //           : "Desctiption length must be > 20";
                            //     },
                            //     textAlign: TextAlign.center,
                            //     decoration: kTextFileDecoration.copyWith(
                            //       hintText: 'enter description',
                            //     ),
                            //     onSaved: (value) {
                            //       setState(() {
                            //         _register["description"] = value;
                            //       });
                            //     }),
                            // SizedBox(
                            //   height: 24.0,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: const Color.fromARGB(255, 156, 153, 153)
                        .withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        onPressed: () {},
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
