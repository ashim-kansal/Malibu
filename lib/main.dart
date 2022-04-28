import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Malibu/components/UndefinedView.dart';
import 'package:Malibu/presentation/bloc/weather_bloc.dart';
import 'package:Malibu/presentation/pages/home_page.dart';
import 'package:Malibu/presentation/pages/splash.dart';
import 'package:Malibu/services/navigation_service.dart';
import 'package:Malibu/navigation/router.dart' as router;

import 'injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  // static BuildContext myContext;

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // MyApp.myContext = context;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<WeatherBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: router.generateRoute,
        initialRoute: Splash.RouteName,
        navigatorKey: NavigationService.instance.navigationKey,
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => UndefinedView(
              name: "settings.name",
            )),
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'AvenirLTStd'
          )
        ),
      ),
    );
  }
}
