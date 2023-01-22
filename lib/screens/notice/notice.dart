import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/components/myAppBar.dart';
import 'package:ting_flutter/components/noticeBox.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar("공지사항"),
      body: Center(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 16.h,),
                myNoticeBox(context,"2023-01-23","제 3자 개인 정보 동의 관련 공지"),
                myNoticeBox(context,"2023-01-22","정책변경 관련 공지"),
                myNoticeBox(context,"2023-01-21","프로필 관련 공지"),

              ],
            )
        ),
      ),
    );
  }
}