import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/Cubit.dart';
import '../cubit/states.dart';
import '../presentation/splash/splash_screen.dart';
import '../presentation/utils/app_routes.dart';
import '../presentation/utils/theme_manager.dart';

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  MyApp._internal();
  // bool fabIsClicked = true; //shared over application
  //to call it write
  // int x=0;
  static final MyApp _instance=MyApp._internal(); //singleton
  factory MyApp ()=>_instance;
  // {
  //   return instance;
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..readQuranJson(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return  MaterialApp(
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme:themeData(),
            home:const Splash(),
          );
        },
      ),
    );

  }
}
