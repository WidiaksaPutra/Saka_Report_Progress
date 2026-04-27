// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_progress_report/routes/route_name.dart';
import 'package:sales_progress_report/shared/theme_color.dart';
import 'package:sales_progress_report/shared/theme_hive.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/dialog/componen_dialog_form.dart';

class FormHapusFormDialog extends HookWidget {
  FormHapusFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _statusBack = useState<int>(0);
    return ComponenDialogForm(
      onTapConfirm: () async{
        if(_statusBack.value == 2){
          Navigator.of(context).popUntil((route) => route.isFirst);
          context.go(RouteName.menuPageConnect, extra: {'select': 1});
        }else if(_statusBack.value == 0){
          _statusBack.value = 1;
        }else{
          _statusBack.value = 3;
          
          await (await listGambarFormLaporanBox).clear();
          await (await textFormLaporanBox).clear();
          _statusBack.value = 2;
        }
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
      reportText: "masih terdapat data laporan yang belum selesai dikirim, apakah data tersebut akan dihapus atau lanjutkan proses pengiriman laporan...?",
      checkText: 'berhasil melakukan penghapusan, kembali ke menu report...',
      textYes: 'Hapus',
      textNo: 'Cancel',
      primaryColorYes: kPrimaryColor,
      primaryColorNo: kGreenColor,
    );
  }
}