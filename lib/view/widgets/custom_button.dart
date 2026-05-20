import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
    required this.bgColor,
    required this.forColor,
    this.width,
  });

  final String text;
  final void Function()? onpressed;
  final Color bgColor;
  final Color forColor;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,

      child: InkWell(
        onTap: () {},
        child: ElevatedButton(
          onPressed: onpressed,

          style: ElevatedButton.styleFrom(
            disabledForegroundColor: forColor,
            foregroundColor: forColor,
            backgroundColor: bgColor,
            disabledBackgroundColor: bgColor,

            // padding: EdgeInsets.symmetric(horizontal: width, vertical: 5),
            shape: RoundedRectangleBorder(),
          ),

          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: forColor,
            ),
          ),
        ),
      ),
    );
  }
}
