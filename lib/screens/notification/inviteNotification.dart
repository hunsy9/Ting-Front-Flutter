import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvitationNotificationScreen extends StatefulWidget {
  const InvitationNotificationScreen({Key? key}) : super(key: key);

  @override
  _InvitationNotificationScreenState createState() => _InvitationNotificationScreenState();
}

class _InvitationNotificationScreenState extends State<InvitationNotificationScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 200.h,),
                Center(
                    child: Image.asset('assets/images/Ting_Login_Logo.png',height: 180.h,)
                ),
                SizedBox(height: 200.h,),
                const Text("초대 알림 라우터")
              ],
            )
        ),
      ),
    );
  }
}