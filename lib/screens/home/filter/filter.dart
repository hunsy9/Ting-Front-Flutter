// ignore_for_file: camel_case_types, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ting_flutter/components/appBar/myAppBar.dart';
import 'package:ting_flutter/components/myText.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static List<int> states = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1];
  static List<Widget> allOpts = [
    MyOption('', 0, 0, 0),
    MyOption('', 0, 0, 0),
    MyOption('', 0, 0, 0),
    MyOption('경영ㆍ경제', 80.w, 26.h, 3),
    MyOption('인문ㆍ사회', 80.w, 26.h, 4),
    MyOption('공학', 80.w, 26.h, 5),
    MyOption('자연과학', 80.w, 26.h, 6),
    MyOption('교육', 80.w, 26.h, 7),
    MyOption('의료', 80.w, 26.h, 8),
    MyOption('예체능', 80.w, 26.h, 9),
    MyOption('기타', 80.w, 26.h, 10),
  ];
  static List<Widget> selectedOpts = [];

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isChecked = false;
  static bool isWarned = false;

  static void setIsWarned(bool warning) {
    isWarned = warning;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: baseAppBar("필터"),
      body: Column(children: [
        Flexible(
          flex: 7,
          child: Container(
            width: 447.w,
            height: 7.h,
            color: Color(0xffd9d9d9),
          ),
        ),

        Spacer(
          flex: 31,
        ),

        Flexible(
          flex: 20,
          child: Row(
            children: [
              Spacer(
                flex: 30,
              ),
              Flexible(flex: 417, child: basicText('자대/타대', 15)),
            ],
          ),
        ),

        Spacer(
          flex: 21,
        ),

        // 대학 선택 옵션버튼
        Flexible(
          flex: 51,
          child: Row(children: [
            Spacer(flex: 30),
            Flexible(
                flex: 120, child: FilterContainer('우리 학교만', 15, 120, 51, 0)),
            Spacer(flex: 13),
            Flexible(
                flex: 120, child: FilterContainer('다른 대학만', 15, 120, 51, 1)),
            Spacer(flex: 13),
            Flexible(flex: 120, child: FilterContainer('상관없음', 15, 120, 51, 2)),
            Spacer(flex: 30),
          ]),
        ),

        Spacer(
          flex: 41,
        ),

        Flexible(
          flex: 7,
          child: Container(
            width: 447.w,
            height: 7.h,
            color: Color(0xffd9d9d9),
          ),
        ),

        Spacer(
          flex: 22,
        ),

        // 선호 계열 라인
        Flexible(
          flex: 40,
          child: Center(
            child: Row(
              children: [
                Spacer(flex: 30),
                Flexible(flex: 70, child: basicText('선호 계열', 15)),
                Spacer(
                  flex: 4,
                ),
                Flexible(
                  flex: 15,
                  child: Image.asset('assets/images/filter/help.png'),
                ),
                Spacer(
                  flex: 11,
                ),
                Flexible(
                    flex: 251,
                    child: Row(
                      children: getResults(FilterScreen.selectedOpts),
                    )),
              ],
            ),
          ),
        ),

        Spacer(
          flex: 16,
        ),

        // 본인 계열 피하기
        Flexible(
          flex: 35,
          child: Row(
            children: [
              Spacer(
                flex: 34,
              ),
              Flexible(
                flex: 20,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = true;
                        });
                      },
                      child: Container(
                        width: 20.w,
                        height: 20.w,
                        color: Color(0xffefefef),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = false;
                        });
                      },
                      child: Visibility(
                          visible: isChecked,
                          child: Image.asset('assets/images/filter/check.png')),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 8,
              ),
              Flexible(flex: 120, child: basicText('본인 계열 피하기', 15)),
              Spacer(
                flex: 270,
              ),
            ],
          ),
        ),

        Spacer(
          flex: 24,
        ),

        // 계열 선택 ROW #1
        Flexible(
          flex: 51,
          child: Row(
            children: [
              Spacer(
                flex: 30,
              ),
              Flexible(
                flex: 189,
                child: FilterContainer('경영ㆍ경제', 15, 189, 51, 3),
              ),
              Spacer(
                flex: 8,
              ),
              Flexible(
                  flex: 189, child: FilterContainer('인문ㆍ사회', 15, 189, 51, 4)),
              Spacer(
                flex: 30,
              ),
            ],
          ),
        ),

        Spacer(
          flex: 8,
        ),

        // 계열 선택 ROW #2
        Flexible(
          flex: 51,
          child: Row(
            children: [
              Spacer(
                flex: 30,
              ),
              Flexible(
                flex: 189,
                child: FilterContainer('공학', 15, 189, 51, 5),
              ),
              Spacer(
                flex: 8,
              ),
              Flexible(
                  flex: 189, child: FilterContainer('자연과학', 15, 189, 51, 6)),
              Spacer(
                flex: 30,
              ),
            ],
          ),
        ),

        Spacer(
          flex: 8,
        ),
        // 계열 선택 ROW #3
        Flexible(
          flex: 51,
          child: Row(
            children: [
              Spacer(
                flex: 30,
              ),
              Flexible(
                flex: 189,
                child: FilterContainer('교육육', 15, 189, 51, 7),
              ),
              Spacer(
                flex: 8,
              ),
              Flexible(flex: 189, child: FilterContainer('의료', 15, 189, 51, 8)),
              Spacer(
                flex: 30,
              ),
            ],
          ),
        ),

        Spacer(
          flex: 8,
        ),
        // 계열 선택 ROW #4
        Flexible(
          flex: 51,
          child: Row(
            children: [
              Spacer(
                flex: 30,
              ),
              Flexible(
                flex: 189,
                child: FilterContainer('예체능', 15, 189, 51, 9),
              ),
              Spacer(
                flex: 8,
              ),
              Flexible(
                  flex: 189, child: FilterContainer('기타', 15, 189, 51, 10)),
              Spacer(
                flex: 30,
              ),
            ],
          ),
        ),

        Spacer(
          flex: 8,
        ),

        Flexible(
          flex: 51,
          child: FilterContainer('상관없음', 15, 386, 51, 11),
        ),

        Spacer(
          flex: 10,
        ),

        Flexible(
          flex: 20,
          child: Center(
            child: Visibility(
              visible: isWarned,
              child: Icon(Icons.warning),
            ),
          ),
        ),

        Spacer(
          flex: 115,
        ),

        Flexible(
          flex: 126,
          child: ButtonTheme(
            child: TextButton(
              onPressed: () {},
              child: basicText('필터 적용하기', 15),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff6b42c5)),
                fixedSize: MaterialStateProperty.all(Size(397.w, 72.h)),
                foregroundColor: MaterialStateProperty.all(Color(0xffffffff)),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),

        Spacer(
          flex: 54,
        ),
      ]),
    );
  }
}

class FilterContainer extends StatefulWidget {
  FilterContainer(String this.text, double this.fontSize, double this.width,
      double this.height, int this.myNumber) {}
  String text;
  double fontSize;
  double width;
  double height;
  int myNumber;

  int getMyState() {
    return FilterScreen.states[myNumber];
  }

  Color getMyColor() {
    if (FilterScreen.states[myNumber] == 0) {
      return Color(0xffd9d9d9);
    }
    return Color(0xff000000);
  }

  void changeStates(int number) {
    print(myNumber);
    print(FilterScreen.states);
    if (number <= 2) {
      // 대학 선택버튼
      for (int i = 0; i <= 2; i++) {
        if (i == myNumber) {
          if (FilterScreen.states[myNumber] == 0) {
            FilterScreen.states[myNumber] = 1;
          } else {
            FilterScreen.states[myNumber] = 0;
          }
        } else {
          FilterScreen.states[i] = 0;
        }
      }
    } else if (number == 11) {
      // 상관없음 버튼
      FilterScreen.states[11] = 1;
      FilterScreen.states.setRange(3, 11, [0, 0, 0, 0, 0, 0, 0, 0]);
      FilterScreen.selectedOpts = [];
    } else {
      FilterScreen.states[11] = 0;
      if (FilterScreen.states[myNumber] == 1) {
        FilterScreen.states[myNumber] = 0;
        FilterScreen.selectedOpts.remove(FilterScreen.allOpts[myNumber]);
      } else {
        if (FilterScreen.selectedOpts.length != 3) {
          FilterScreen.states[myNumber] = 1;
          FilterScreen.selectedOpts.add(FilterScreen.allOpts[myNumber]);
        }
        else {
          _FilterScreenState.isWarned = true;
        }
      }
    }

    if (FilterScreen.selectedOpts.length != 3) {
      _FilterScreenState.isWarned = false;
    }
  }

  @override
  _FilterContainerState createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _FilterScreenState? state =
        context.findAncestorStateOfType<_FilterScreenState>();
    return GestureDetector(
      onTap: () {
        state?.setState(() {
          widget.changeStates(widget.myNumber);
        });
      },
      child: Container(
        width: widget.width.w,
        height: widget.height.h,
        child: Center(child: basicText(widget.text, widget.fontSize)),
        decoration: BoxDecoration(
          border: Border.all(color: widget.getMyColor()),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class MyOption extends StatefulWidget {
  MyOption(String this.text, double this.width, double this.height,
      int this.myNumber) {}

  String text;
  double width;
  double height;
  int myNumber;

  int getMyNumber() {
    return myNumber;
  }

  @override
  State<StatefulWidget> createState() => _MyOptionState();
}

class _MyOptionState extends State<MyOption> {
  @override
  Widget build(BuildContext context) {
    _FilterScreenState? state =
        context.findAncestorStateOfType<_FilterScreenState>();
    return GestureDetector(
      onTap: () {
        state?.setState(() {
          FilterScreen.states[widget.myNumber] = 0;
          FilterScreen.selectedOpts
              .remove(FilterScreen.allOpts[widget.myNumber]);
        });
      },
      child: Container(
        child: Row(children: [
          Spacer(
            flex: 9,
          ),
          Flexible(flex: 40, child: Center(child: basicText(widget.text, 9))),
          Spacer(
            flex: 3,
          ),
          Flexible(
            flex: 18,
            child: Image.asset(
              'assets/images/filter/close.png',
              width: 20.w,
              height: 20.h,
            ),
          ),
        ]),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

List<Widget> getResults(List<Widget> selectedOpts) {
  List<Widget> results = [MyOption('', 0, 0, 0)];
  for (int i = 0; i < selectedOpts.length; i++) {
    results.add(Flexible(flex: 50, child: selectedOpts[i]));
    results.add(SizedBox(
      width: 13.w,
    ));
  }

  return results;
}
