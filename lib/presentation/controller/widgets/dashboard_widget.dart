import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  void Function()? onTap;
  final String image;
  final String text;
  DashboardWidget(
      {super.key, this.onTap, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: SizedBox(
          // height: MediaQuery.of(context).size.height * 0.4,
          // width: MediaQuery.of(context).size.width * 0.4,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 12),
                Text(text),
              ],
            ),
          ),
        ));
  }
}
