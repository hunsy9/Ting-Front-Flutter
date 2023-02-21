import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/basic_components/basictext.dart';

AppBar statusBarColor(SystemUiOverlayStyle colors) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    systemOverlayStyle: colors,
  );
}

AppBar chatRoomAppBar(String title, BuildContext context) {
  return AppBar(
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    title: Text(
      title,
      style: const TextStyle(
          color: Color(0xff414141),
          fontFamily: 'nanumsquareround',
          fontSize: 18,
          fontWeight: FontWeight.w700),
    ),
    automaticallyImplyLeading: true,
    actions: [
      IconButton(
        icon: Icon(Icons.edit_calendar),
        onPressed: () {
          print("팅 달력");
        },
      ),
      IconButton(
        icon: Icon(Icons.logout_rounded),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                    // backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                        // width: 500.w,
                        height: 375.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/exitChatRoomEmoji.png'),
                            SizedBox(
                              height: 25.h,
                            ),
                            basicText(
                              text: "지금 매칭을 취소하시면",
                              fontSize: 17,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            basicText(
                              text: "7일간 페널티를 받아요",
                              fontSize: 17,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () => {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      backgroundColor: const Color(0xffffa0a0),
                                      minimumSize: Size(171.w, 51.h),
                                      elevation: 0),
                                  child: const Text(
                                    '그래도 취소하기',
                                    style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontFamily: 'nanumsquareround',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    backgroundColor: const Color(0xfff4f2fb),
                                    minimumSize: Size(171.w, 51.h),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    '대타 구하기',
                                    style: TextStyle(
                                        color: Color(0xff414141),
                                        fontFamily: 'nanumsquareround',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )));
              });
        },
      ),
    ],
    backgroundColor: Colors.white,
    elevation: 0.2,
  );
}
