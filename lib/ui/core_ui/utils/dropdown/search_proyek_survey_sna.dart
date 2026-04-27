// ignore_for_file: invalid_use_of_protected_member, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, unused_element, use_build_context_synchronously, await_only_futures, unused_local_variable, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sales_progress_report/ui/core_ui/componen/basic/componen_dropdown_form_3.dart';

class SearchProyekSurveySna extends HookConsumerWidget {
  final bool enableSearch;
  final String namaInduk;
  const SearchProyekSurveySna({super.key, required this.enableSearch, required this.namaInduk});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _listProyekSna = useState<List<String>>([]);
    final _listNamaProyekSna = useState<List<String>>([]);  
    final _statusConnection = useState<String>("null");
    final _connection = useState<bool>(false);
    final _connect = useState<bool>(false);
    final _latency = useState<int>(1000);
    final _loading = useState<bool>(true);
    
    // useEffect(() {
    //   final sub = ref.listenManual<ConnectionBasicState>(
    //     connectionBasicRiverpod,
    //     (prev, next) {
    //       _loading.value = next.loading;
    //       if(_loading.value == false){
    //         _connect.value = next.connection;
    //         _latency.value = next.latency;
    //       }
    //     },
    //   );
    //   return sub.close;
    // }, []);
   

    // Future.delayed(const Duration(milliseconds: 3000),() async {
    //    _connection.value = (await modeOnlineBox).get('mode_online')!;
    //   if(_connection.value == true && (await accessTokenBox).get('access_token') == null){
    //     // await accessTokenBox.clear();
    //     await (await tipeKunjunganBox).clear();
    //     Future.delayed(Duration(milliseconds: 3000),(){
    //       context.go(RouteName.auth, extra: {"login": true});
    //     });
    //   }
    // });

    // Future.delayed(const Duration(milliseconds: 1000) ,() async{
    //   List _dataListMap = (await identitasProyekSurveyBox).values.map((buildMenuItems) {
    //     return buildMenuItems;
    //   }).toList();

    //   _listProyekSna.value.clear();
    //   _listNamaProyekSna.value.clear();

    //   for(int i = 0; i < _dataListMap.length; i++){
    //     if(namaInduk.contains(_dataListMap[i].namaToko) && !_listNamaProyekSna.value.contains(_dataListMap[i].namaProject)){
    //       _listNamaProyekSna.value.add(_dataListMap[i].namaProject);
    //       _listProyekSna.value.add("${_dataListMap[i].latitude}_${_dataListMap[i].ledgerToko}_${_dataListMap[i].namaToko}_${_dataListMap[i].namaProject}_${_dataListMap[i].alamatProyek}_${_dataListMap[i].totalSurvey}_${_dataListMap[i].ledgerToko}_${_dataListMap[i].id}_${_dataListMap[i].namaToko}_${_dataListMap[i].alamatToko}_${_dataListMap[i].longitude}");
    //     }
    //   }
    // });

    Future<void> dropDownClickConnectProyekSna({
      required dynamic value,
    }) async{
      // List<String> _dataProyek = value.split("_");
      // List _dataListMap = (await identitasProyekSurveyBox).values.map((buildMenuItems) {
      //   return buildMenuItems;
      // }).toList();
      
      // for(var data in _dataListMap){
      //   if(_dataProyek[3].contains(data.namaProject)){
      //     ref.read(dataProyekSurveyConnectSna.notifier).state = {
      //       "id": data.id.toString(),
      //       "nama_toko": data.namaToko.toString(),
      //       "alamat_toko": data.alamatToko.toString(),
      //       "nama_project": data.namaProject.toString(),
      //       "alamat_proyek": data.alamatProyek.toString(),
      //       "latitude": data.latitude.toString(),
      //       "longitude": data.longitude.toString(),
      //       "total_survey": data.totalSurvey.toString(),
      //       "radius": data.radius.toString(),
      //       "ledger": data.ledgerToko.toString(),
      //     };
      //     break;
      //   }
      // }
    }
    
    Future<void> dropDownClickDisconnectProyekSna({
      required dynamic value,
    }) async{
      List<String> _dataProyek = value.split("_");
      
      // ref.read(namaTokoSurveyProyekDisconnectSna.notifier).state = _dataProyek[8];
      // ref.read(namaProyekSurveyProyekDisconnectSna.notifier).state = _dataProyek[3];
      // ref.read(alamatProyekSurveyProyekDisconnectSna.notifier).state = _dataProyek[4];
      // ref.read(totalSurveyProyekDisconnectSna.notifier).state = _dataProyek[5];
      // ref.read(ledgerSurveyProyekDisconnectSna.notifier).state = _dataProyek[6];
      // ref.read(idSurveyProyekDisconnectSna.notifier).state = _dataProyek[7];
      // ref.read(alamatTokoSurveyProyekDisconnectSna.notifier).state = _dataProyek[9];
      // ref.read(alamatLatitudeSurveyProyekDisconnectSna.notifier).state = _dataProyek[0];
      // ref.read(alamatLongitudeSurveyProyekDisconnectSna.notifier).state = _dataProyek[10];
    }

    return ComponenDropdownForm3(
      enabled: enableSearch,
      onSelect: (String value) async{
        // (_connection.value == false)
        // ? await dropDownClickDisconnectProyekSna(value: value)
        await dropDownClickConnectProyekSna(value: value);
      },
      listStore: _listProyekSna.value,
      labelText: 'Pilih Proyek',
      valueEmpty: 'Harap pilih proyek',
      hintText: 'Pilih Proyek',
    );
  }
}