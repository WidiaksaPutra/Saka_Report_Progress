// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, avoid_renaming_method_parameters, use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/ui/core_ui/componen/customize/card_button.dart';
import 'package:sales_progress_report/ui/modul/form_visit/dialog_pelaporan.dart';

final loadingFormLaporan = StateProvider.autoDispose<bool>((ref) => false);
class SubmitLaporan extends HookConsumerWidget {
  final List<String> reportImages;
  final String id, textButton, projectInputType, type;
  final TextEditingController reportDescription, title;
  final BuildContext context;
  final VoidCallback otherFunction;

  const SubmitLaporan({super.key,
    required this.id,
    required this.context,
    required this.reportImages,
    required this.reportDescription,
    required this.projectInputType,
    required this.type,
    required this.textButton,
    required this.title,
    required this.otherFunction,
  });

  @override
  Widget build(BuildContext context2, WidgetRef ref) {
    final _loadingForm = ref.watch(loadingFormLaporan.select((state) => state));
    return CardButton(
      sizeFont: 20,  
      isLoading: _loadingForm,
      onClicked: (){
        otherFunction();
        if(_loadingForm == false){
          ref.read(loadingFormLaporan.notifier).state = true;
          dialogPelaporan(
            id: id,
            context: context,
            reportImages: reportImages,
            reportDescription: reportDescription.text,
            projectInputType: projectInputType,
            type: type,
            title: title.text,
          );
        }
      },
      textButton: textButton,
    );
  }
}