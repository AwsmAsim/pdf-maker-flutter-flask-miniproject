import 'dart:io';
import 'package:gx_file_picker/gx_file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_maker_miniproject/controller/list_provider.dart';

class FileSelection{
  Future<List<File>> getFiles() async{
    List<File> files = await FilePicker.getMultiFile(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    return files;
  }

}