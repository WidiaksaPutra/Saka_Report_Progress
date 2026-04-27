import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComponenRowIconTextIconArrow extends StatelessWidget {
  final IconData titleIcons;
  final Color iconsColor;
  final String labelTextIcon;
  final VoidCallback onTap;
  const ComponenRowIconTextIconArrow({super.key,
    required this.titleIcons, 
    required this.iconsColor, 
    required this.labelTextIcon,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                titleIcons,
                color: iconsColor,
                size: 25.h,
              ),
              Text(labelTextIcon, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.sp)),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: iconsColor,
            size: 25.h,
          ),
        ],
      ),
    );
  }
}