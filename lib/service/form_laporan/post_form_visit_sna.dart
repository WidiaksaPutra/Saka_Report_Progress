// ignore_for_file: await_only_futures, depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'package:http_parser/http_parser.dart';
import 'package:sales_progress_report/model/service/util/model_meta.dart';
import 'package:sales_progress_report/service/form_laporan/interface_post_form_laporan.dart';
import 'package:sales_progress_report/service/konstanta.dart';
import 'package:sales_progress_report/service/util/safe_mime.dart';
import 'package:http/http.dart' as http;

class PostFormLaporanApi implements InterfacePostFormLaporan{
  
  @override
  String urlPostFormLaporan = "/progress-reports/";

  @override
  String code = "";

  @override
  String message = "";
  
  @override
  String status = "";

  @override
  Future postFormLaporan({
    required String id, 
    required String reportDescription, 
    required List<String?> reportImages,
    required String type,
    required String title,
    required String projectInputType,
    required String token,
  }) async{
    try {
      print("testing project 2 $id");
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Connection': 'keep-alive',
      };
       
      final formLaporanPost = http.MultipartRequest('POST', Uri.parse('${BASICAPI.baseURL}$urlPostFormLaporan'));
      
      if(reportImages.isNotEmpty){
        for(String? reportImg in reportImages){
          if(reportImg != null){
            final minesTypeData = await safeMime(reportImg);
            if(minesTypeData != null){
              formLaporanPost.files.add(await http.MultipartFile.fromPath('report_images[]', reportImg, contentType: MediaType(minesTypeData.split('/')[0], minesTypeData.split('/')[1])));
            }
          }
        }
      }

      if(projectInputType == "select"){
        formLaporanPost.fields['id'] = id;
      }
      formLaporanPost.fields['report_description'] = reportDescription;
      formLaporanPost.fields['type'] = type;
      if(projectInputType == "text"){
        formLaporanPost.fields['title'] = title;
      }

      formLaporanPost.headers.addAll(headers);
      final streamRespons = await formLaporanPost.send().timeout(const Duration(minutes: 6));
      final respons = await http.Response.fromStream(streamRespons).timeout(const Duration(minutes: 6));
      final _jsonData = respons.body;
      final _postLaporanRespons = modelMetaFromJson(_jsonData);

      final _meta = _postLaporanRespons.meta;

      print("testing data ${_meta!.code} ${_meta.message}");
      return {
        'code' : _meta.code,
        'status' : 'catch',
        'message' : _meta.message,
      };
    } catch (e) {
      print("testing project 4");
      return {
        'code' : '999',
        'status' : 'catch',
        'message' : e.toString(),
      };
    }
  }
}