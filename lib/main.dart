import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './named_routing/router.dart' as router;
import './named_routing/config.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: "84817c810115c69866956281b1f115b9",
    javaScriptAppKey: "8f33d86bf354750433909a35ff18ff19",
  );


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
        designSize: const Size(447,965),
        builder: (ctx,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeViewRoute,
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
