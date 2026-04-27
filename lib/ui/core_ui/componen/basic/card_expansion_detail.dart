// ignore_for_file: use_super_parameters, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';
import 'componen_container_card_basic_white.dart';


class CardExpansionDetail extends StatelessWidget {
  late EdgeInsetsGeometry? padding;
  late Color colorBorder;
  late bool initiallyExpanded;
  late bool statusLabel;
  late Widget widgetLabel;
  late String label;
  late FontWeight fontWeight;
  late int fontSize;
  late BoolFunction onExpansionChanged;
  final List<Widget> children;
  final bool enabled;
  CardExpansionDetail({Key? key,
    this.padding,
    this.colorBorder = kTransparentColor,
    this.enabled = true,
    this.initiallyExpanded = false,
    this.statusLabel = false,
    this.widgetLabel = const SizedBox(),
    this.label = "Label",
    this.fontWeight = FontWeight.w600,
    this.fontSize = 14,
    this.onExpansionChanged,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponenContainerCardBasicWhite(
      padding: padding,
      borderRadius: BorderRadius.circular(10.r),
      content: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        onExpansionChanged: onExpansionChanged,
        enabled: enabled,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: (statusLabel == false)
        ? Text(
            label,
            style: TextStyle(
              color: kBlackColor,
              fontWeight: fontWeight,
              fontSize: fontSize.sp,
            ),
          )
        : widgetLabel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0.r),
          side: BorderSide(color: colorBorder, width: 1.w),
        ),
        iconColor: kPrimaryColor,
        collapsedIconColor: kPrimaryColor,
        children: children,
      ),
    );
  }
}