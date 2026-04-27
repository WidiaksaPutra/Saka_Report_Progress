// ignore_for_file: use_super_parameters, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class ComponenContentDialog extends StatelessWidget {
  final Widget widget;
  const ComponenContentDialog({Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: widget,
    );
  }
}