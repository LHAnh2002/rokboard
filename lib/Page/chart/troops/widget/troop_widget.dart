import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TroopWidget extends StatelessWidget {
  final kill, color;
  const TroopWidget({Key? key, this.kill, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          kill,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 5.w, height: 0.0),
        Container(
          height: 14.h,
          width: 30,
          color: color,
        )
      ],
    );
  }
}
