import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './named_routing/router.dart' as router;
import './named_routing/config.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key:key);
  @override
  State<MyApp> createState()=> _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
        designSize: const Size(445,965),
        builder: (ctx,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashViewRoute,
          onGenerateRoute: router.generateRoute,
          builder: (context, widget){
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        );
        });
  }
}
