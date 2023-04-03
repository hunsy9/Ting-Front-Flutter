import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final Function()? onTap;
  final String? btnText;
  final Color? firstColor;
  final Color? secondColor;

  const CustomGradientButton({
    Key? key,
    required this.onTap,
    this.btnText = 'Gradient Button',
    this.firstColor = Colors.green,
    this.secondColor = Colors.greenAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.0),
        splashColor: Colors.blue.withOpacity(0.4),
        child: Ink(
          height: 50.0,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [
                firstColor!,
                secondColor!,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Center(
            child: Text(
              btnText!,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}