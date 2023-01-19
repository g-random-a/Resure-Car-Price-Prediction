import 'package:flutter/material.dart';
import 'package:frontend/feature/prediction/presentation/input_page.dart';
import 'package:frontend/feature/prediction/presentation/pop_up_page.dart';
import 'package:frontend/feature/prediction/presentation/resure_page.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ResurePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/input_page',
          builder: (BuildContext context, GoRouterState state) {
            return const InputPage();
          },
        ),
      ],
    ),
  ],
);
