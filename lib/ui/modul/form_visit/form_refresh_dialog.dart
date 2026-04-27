// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_progress_report/routes/route_name.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_dialog_form.dart';

class FormRefreshDialog extends HookWidget {
  const FormRefreshDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _statusBack = useState<int>(0);
    return ComponenDialogForm(
      onTapConfirm: () async{
        await (await listGambarFormLaporanBox).clear();
        await (await textFormLaporanBox).clear();
        Navigator.of(context).popUntil((route) => route.isFirst);
        context.pushReplacement(
          RouteName.menuPageConnect,
          extra: {
            'select': 1,
            'refresh': DateTime.now().millisecondsSinceEpoch,
          },
        );
      },
      onTapCancel: () {
        if(_statusBack.value == 0){
          Navigator.of(context).popUntil((route) => route.isFirst);
        }else{
          Navigator.of(context).popUntil((route) => route.isFirst);
          context.go(RouteName.menuPageConnect, extra: {'select': 1});
        }
      },
      statusBack: _statusBack.value,
      reportText: "halaman akan di refresh dan data didalam form akan dihapus, apakah anda yakin melakukan refresh halaman ini...?",
      checkText: 'berhasil melakukan refresh, kembali ke menu report...',
      textYes: 'Ya',
      textNo: 'Tidak',
      primaryColorYes: kOrangeColor,
      primaryColorNo: kGreenColor,
    );
  }
}