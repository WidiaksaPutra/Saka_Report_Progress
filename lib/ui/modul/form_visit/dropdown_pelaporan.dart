// // ignore_for_file: invalid_use_of_protected_member, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, use_build_context_synchronously, await_only_futures, unused_element, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sales_progress_report/riverpod/core_control/riverpod/connection_basic/connection_basic.dart';
// import 'package:sales_progress_report/riverpod/core_control/riverpod/connection_basic/connection_basic_state.dart';
// import 'package:sales_progress_report/shared/theme_hive.dart';
// import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_dropdown_form_2_1.dart';
// import 'package:sales_progress_report/ui/modul/form_visit/body_form_visit.dart';

// class DropdownPelaporan extends HookConsumerWidget {
//   late String jenisDropdown;
//   late bool enableSearch;
//   DropdownPelaporan({super.key, required this.enableSearch, required this.jenisDropdown});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _jenisPelaporan = useState<List<String>>([]);
//     final _itemPelaporan = useState<List<String>>([]);
//     final _connection = useState<bool>(false);
//     final _latency = useState<int>(1000);
//     final _loading = useState<bool>(true);
  
//     final _pelaporan = ref.watch(jenisPelaporan.select((state) => state));
//     final _item = ref.watch(jenisItem.select((state) => state));

//     useEffect(() {
//       final _sub = ref.listenManual<ConnectionBasicState>(
//         connectionBasicRiverpod,
//         (prev, next) {
//           _loading.value = next.loading;
//           if(_loading.value == false){
//             _connection.value = next.connection;
//             _latency.value = next.latency;
//           }
//         },
//       );
//       return () => _sub.close();
//     }, []);
    
//     useEffect((){
//       WidgetsBinding.instance.addPostFrameCallback((_) async{
//         final List _dropdownProgressReport = (await dropdownProgressReportBox).values.toList();
//         if(_dropdownProgressReport.isNotEmpty){
//           if(_jenisPelaporan.value.isNotEmpty && jenisDropdown == 'jenis_pelaporan'){
//             _jenisPelaporan.value = [];
//             _itemPelaporan.value = [];
//           }
          
//           for(var data in _dropdownProgressReport){
//             if(jenisDropdown == 'jenis_pelaporan'){
//               _jenisPelaporan.value = [
//                 ..._jenisPelaporan.value,
//                 "0_ ${data.submissionNo}",
//               ];
//             }else if(jenisDropdown == 'jenis_item'){
//               if(_pelaporan.toString().trim() == data.submissionNo.trim()){
//                 _itemPelaporan.value = [];
//                 for(var data2 in data.submissionDetails){
//                   _itemPelaporan.value = [
//                     ..._itemPelaporan.value,
//                     "${data2.id}_ ${data2.jobDescription}",
//                   ];
//                 }
//                 break;
//               }
//             }
//           } 
//         }
//       });
//       return null;
//     },[_pelaporan, _item]);

//     final searchOnTap = useCallback(({
//       required String value,
//     }) async{
//       List _data = value.split("_");
//       if(jenisDropdown == 'jenis_pelaporan'){
//         ref.read(jenisPelaporan.notifier).state = null;
//         ref.read(jenisItem.notifier).state = null;
//         ref.read(idItem.notifier).state = null;
//         _jenisPelaporan.value = [];
//         _itemPelaporan.value = [];
//         ref.read(jenisPelaporan.notifier).state = _data[1];
//       }else if(jenisDropdown == 'jenis_item'){
//         ref.read(jenisPelaporan.notifier).state = null;
//         _jenisPelaporan.value = [];
//         _itemPelaporan.value = [];
//         ref.read(jenisItem.notifier).state = _data[1];
//         ref.read(idItem.notifier).state = _data[0];
//       }
//     },[]);

//     return ComponenDropdownForm2_1(
//       jenisDropdown: jenisDropdown,
//       enabled: enableSearch,
//       onSelected: (String value) async{
//         await searchOnTap(value: value);
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       listStore: (jenisDropdown == 'jenis_pelaporan')
//       ? _jenisPelaporan.value
//       : _itemPelaporan.value,
//       labelText: (jenisDropdown == 'jenis_pelaporan')
//       ? 'Pilih Jenis Pelaporan'
//       : 'Pilih Item Pelaporan',
//       valueEmpty: (jenisDropdown == 'jenis_pelaporan')
//       ? 'Harap pilih jenis pelaporan'
//       : 'Harap pilih item pelaporan',
//       hintText: (jenisDropdown == 'jenis_pelaporan')
//       ? 'Pilih Jenis Pelaporan'
//       : 'Pilih Item Pelaporan', 
//     );
//   }
// }