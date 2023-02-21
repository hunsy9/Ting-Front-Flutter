
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/components/myAppBar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ting_flutter/components/notificationBox.dart';


class InvitationNotificationScreen extends StatefulWidget {
  const InvitationNotificationScreen({Key? key}) : super(key: key);

  @override
  _InvitationNotificationScreenState createState() => _InvitationNotificationScreenState();
}

class _InvitationNotificationScreenState extends State<InvitationNotificationScreen> {

  RefreshController _refreshController = RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: baseAppBar("알림"),
      body: SmartRefresher(enablePullDown: true, enablePullUp: false, header: WaterDropHeader(),controller: _refreshController,onRefresh: _onRefresh,
      child: Column( //LISTVIEW로 바꿔야함
        children: [
          SizedBox(height: 16.h,),
          myNotificationBox(context,"한재안어디가","2023-01-20"),
          myNotificationBox(context,"주누주누","2023-01-19"),
          myNotificationBox(context,"창민창민","2023-01-18"),

        ],
      ),)
    );
  }
}