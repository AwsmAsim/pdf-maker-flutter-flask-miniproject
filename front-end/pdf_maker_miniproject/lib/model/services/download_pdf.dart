import 'package:folder_file_saver/folder_file_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
class DownloadPdf{
  final File filePath;
  DownloadPdf(this.filePath) {
    download_file();
  }


  void download_file() async{
    bool perm = await permission();
    if(perm){
      // If permission is true, download file.
      print('permission granted');
      _doSave(this.filePath);
    }else{

    }
  }

  Future<bool> permission() async{
    final resultPermission = await FolderFileSaver.requestPermission();
    if(resultPermission==0) return true;
    else return false;
  }

  Future<void> _doSave(File file) async {
    final dir = await getTemporaryDirectory();
    var file_name = '/' + file.path.split('/').last;
    var filePath = dir.path + file_name;
    //    progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
    final result = await FolderFileSaver.saveFileToFolderExt(file.path);
    print('File saved.');
    print(result);
  }
}