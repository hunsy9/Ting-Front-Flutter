import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/screens/home/home.dart';
import 'package:ting_flutter/screens/myprofile/myprofile.dart';
import 'package:ting_flutter/screens/navigatorBarScaffold/tab.dart';
import 'package:ting_flutter/screens/recommendedPlace/recommendedPlace.dart';
import './indicator.dart';

class NavigatorBarScaffold extends StatefulWidget {
  const NavigatorBarScaffold({Key? key}) : super(key: key);

  @override
  _NavigatorBarScaffoldState createState() => _NavigatorBarScaffoldState();
}

class _NavigatorBarScaffoldState extends State<NavigatorBarScaffold>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<bool> _trigger = [false, true, false];
  int lastIndex = 1;
  late int tabindex;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3, initialIndex: 1)
      ..addListener(() {
        setState(() {
          tabindex = _tabController.index;
        });
        if (lastIndex != tabindex) {
          _trigger[lastIndex] = !_trigger[lastIndex];
          _trigger[tabindex] = !_trigger[tabindex];
          lastIndex = tabindex;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: TabBar(
            controller: _tabController,
            onTap: (index) => {
              setState(() {
                // if (lastIndex != index) {
                //   _trigger[lastIndex] = !_trigger[lastIndex];
                //   _trigger[index] = !_trigger[index];
                //   lastIndex = index;
                // }
              })
            },
            indicator: CircleTabIndicator(color: Color(0xffe1def4), radius: 3),
            indicatorPadding: EdgeInsetsDirectional.only(bottom: 30.h),
            tabs: [
              TabContainer(_trigger[0], 'assets/images/recommendedPlace.png',
                  'assets/images/recommendPlace_after.png'),
              TabContainer(_trigger[1], 'assets/images/myhome.png',
                  'assets/images/myhome_after.png'),
              TabContainer(_trigger[2], 'assets/images/myprofile.png',
                  'assets/images/myprofile_after.png')
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            RecommendedPlaceScreen(),
            Home(),
            MyProfileScreen()
          ],
        ));
  }
}
