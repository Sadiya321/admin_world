import 'package:admin_world/const/colors.dart';
import 'package:admin_world/const/strings.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String imagePath;
  final String title;
  final String title1;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.title1,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: AppColor.graphbg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      imagePath,
                      width: 30,
                      height: 30,
                      color: AppColor.textLight,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:  boldTextStyle,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      title1,
                      style: blacksmallTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
