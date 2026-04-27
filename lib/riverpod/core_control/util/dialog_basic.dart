// ignore_for_file: avoid_init_to_null, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_progress_report/shared/theme_color.dart';

class DialogBasic{
  void voidDialogBasic({
    bool navigationAfter = false,
    String routeNameGo = "",
    Object? extra = null,
    required BuildContext context,
    required Widget contentDialog,
    required bool barrierDismissible,
    required bool CloseIconStatus,
    required EdgeInsetsGeometry padding,
    required Color color,
    required BorderRadiusGeometry borderRadius,
    required bool autoClose,
  }){
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: ((BuildContext contextDialog){
        Future.delayed(const Duration(milliseconds: 3000), () {
          if(autoClose == true && Navigator.canPop(contextDialog)){            
            Navigator.of(contextDialog).pop();
            if(navigationAfter == true){
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(routeNameGo, extra: extra);
              });
            }
          }
        });
        return WillPopScope(
          onWillPop: () async => false, // cegah dismiss paksa
          child: Dialog(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadius,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(CloseIconStatus == true)...[
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(contextDialog).pop(),
                        child: const Icon(Icons.close, color: kPrimaryColor),
                      ),
                    ),
                  ],
                  Flexible(child: SingleChildScrollView(
                    child: Padding(
                      padding: padding,
                      child: contentDialog,
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      }
    ));
  }
}
