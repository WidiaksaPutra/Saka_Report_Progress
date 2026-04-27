// ignore_for_file: unused_element, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/theme_color.dart';

class AnimatedIcons extends StatelessWidget {
  final int selectedIndex;
  const AnimatedIcons({required this.selectedIndex});
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: context.findAncestorStateOfType<NavigatorState>()?.widget as AnimationController,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(
            (context.findAncestorStateOfType<NavigatorState>()?.widget as AnimationController).value * 0.1 * 3.14,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.ac_unit, // Ganti dengan ikon sesuai kebutuhan
                color: (selectedIndex == 4) ? kPrimaryColor : kGreyColor,
                size: 24.w,
              ),
              Text(
                'Click Me',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: (selectedIndex == 4) ? kPrimaryColor : kGreyColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}