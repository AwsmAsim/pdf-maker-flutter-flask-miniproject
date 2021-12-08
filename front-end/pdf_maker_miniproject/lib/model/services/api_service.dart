import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:pdf_maker_miniproject/controller/list_provider.dart';
import 'package:provider/provider.dart';

class Api{
  Future uploadMultipleImage(List selectedFiles,String url) async {
    var uri = Uri.parse(url);
    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    // request.headers[''] = '';
    request.fields['file_name'] = 'pdfSampleFile';
    // request.fields['post_details'] = 'dfsfdsfsd';
    //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));
    List<http.MultipartFile> newList = new List<http.MultipartFile>();
    for (int i = 0; i < selectedFiles.length; i++) {
      File imageFile = File(selectedFiles[i].toString());
      var stream =
      new http.ByteStream(imageFile.openRead())..cast();

      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("imagefile", stream, length,
          filename: basename(imageFile.path));
      newList.add(multipartFile);
    }
    request.files.addAll(newList);
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) async{
      // print(value);
      print(value);
    });
    print('step 1');
    var data = await http.get(request.url);
    print('step 2');
    var dir = await getExternalStorageDirectory();
    print('step 3');
    File file = File(dir.path + '/data.pdf');
    print('step 4');
    file.writeAsBytes(data.bodyBytes, flush: true);
    print('step 5');
    print(file.path);
    var file_details = {
      "path": file.path,
      "file": file,
    };
    return file_details;

  }
}