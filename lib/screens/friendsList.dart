import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:ting_flutter/components/myAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/getX/controller/userInfoController.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  int selection = 0; // 0: 홈 화면 앱바에서 눌렀을때, 1: 홈 플러스 버튼 눌렀을때,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: baseAppBar('친구 목록'),
        body: Column(
          children: [
            Expanded(child: GetX<UserController>(
              builder: (controller) {
                return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Color.fromRGBO(190, 190, 190, 0.3),
                        thickness: 1.0,
                        indent: 2,
                        endIndent: 2,
                      );
                    },
                    itemCount: controller.userModel.value.friends.value.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        contentPadding:
                            EdgeInsets.fromLTRB(18.w, 10.h, 27.w, 10.h),
                        leading: Container(
                          width: 45.h,
                          height: 45.h,
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(139, 156, 213, 1.0),
                              borderRadius: BorderRadius.circular(500),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 1,
                                    color: Color.fromRGBO(0, 5, 12, 0.25))
                              ]),
                          child: CircleAvatar(
                              radius: 20.h,
                              backgroundImage: AssetImage(
                                  'assets/profile/${controller.userModel.value.friends.value[index].image}.png')),
                        ),
                        title: Text(
                            '${controller.userModel.value.friends.value[index].nickname}'),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            trailingBtn('요청 보내기', false, 2, -1),
                            trailingBtn('정보', true, -3, -3),
                            SizedBox(width: 20.w),
                            trailingBtn('삭제', true, -3, -3),
                          ],
                        ),
                      );
                    }));
              },
            ))
          ],
        ));
  }
}

Widget trailingBtn(
    String title, bool activation, double horizontal, double vertical) {
  return Visibility(
    visible: activation,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        visualDensity:
            VisualDensity(horizontal: horizontal, vertical: vertical),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: const Color.fromRGBO(244, 242, 251, 1.0),
      ),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'nanumsquareround',
          fontSize: 13.h,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(152, 108, 191, 1.0),
        ),
      ),
    ),
  );
}
