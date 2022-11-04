import 'package:flutter/material.dart';
import 'package:grid_game/controller/alphabet_controller.dart';
import 'package:grid_game/controller/home_controller.dart';
import 'package:grid_game/controller/initial_controller.dart';
import 'package:grid_game/screens/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider<InitialScreenProvider>(create: (context) => InitialScreenProvider(),),
       ChangeNotifierProvider<AlaphabetProvider>(create: (context) => AlaphabetProvider(),),
       ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const SplashScreen() ,
      ),
    );
  }
}

