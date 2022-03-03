import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 13.h,
      height: 13.h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          primary: Colors.white,
          backgroundColor: const Color.fromRGBO(69, 165, 39, 1),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
