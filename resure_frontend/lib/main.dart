import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/prediction/data/data_provider.dart/data_provider.dart';
import 'package:frontend/feature/prediction/data/repository/repository.dart';
import 'package:frontend/feature/prediction/domain/bloc/prediction_bloc.dart';
import 'package:frontend/feature/prediction/presentation/input_page.dart';
import 'package:frontend/feature/prediction/presentation/pop_up_page.dart';
import 'package:frontend/feature/prediction/presentation/resure_page.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatelessWidget {
  final PredictionRepository predictionRepository =
      PredictionRepository(PredictionDataProvider());
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PredictionBloc>(
            create: (context) =>
                PredictionBloc(predictionRepository: predictionRepository)),
      ],
      child: const MaterialApp(
        home: ResurePage(),
      ),
    );
  }
}
