import 'package:flutter/material.dart';
import 'package:flutter_map_proj/constant/dimens.dart';
import 'package:flutter_map_proj/screens/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter o_s_m',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 58,)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.medium))),
              elevation: const MaterialStatePropertyAll(0),
             backgroundColor: MaterialStateProperty.resolveWith((states){
               if(states.contains(MaterialState.pressed)){
                 return const Color.fromARGB(255, 13, 220, 141);
               }
               return const Color.fromARGB(255, 2, 207, 36);
             })
          ),
        ),
      ),
      home: const MapScreen(),
    );
  }
}

