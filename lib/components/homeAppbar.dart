import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redis/redis.dart';


AppBar statusBarColor(SystemUiOverlayStyle colors){
  return AppBar(
    backgroundColor: Color(0xffbebebe),
    elevation: 0.0,
    systemOverlayStyle: colors,
  );
}

AppBar homeAppBar(String title,context){
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
          color: Color(0xff414141),
          fontFamily: 'nanumsquareround', fontSize: 20),
    ),
    backgroundColor: Colors.white,
    elevation: 0.2,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: Image.asset('assets/images/notification.png',width: 31.w,height: 27.h,),
        onPressed: () {
          Navigator.pushNamed(context, "/alarm");
        },
      ),
      IconButton(
        icon: Image.asset('assets/images/share.png',width: 27.w,height: 27.h,),
        onPressed: () {

          final conn = RedisConnection();

          conn.connect('3.38.165.2', 6379).then((Command command){
            command.send_object(["SET","key",345324]).then((var response){
              print(response);
              return command.send_object(["INCR","key"]);
            });
          });

        },
      ),
    ],
  );
}