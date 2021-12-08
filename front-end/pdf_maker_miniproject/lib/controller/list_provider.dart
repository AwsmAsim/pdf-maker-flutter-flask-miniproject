import 'package:flutter/foundation.dart';
import 'package:pdf_maker_miniproject/model/repository/image_and_file_list.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class ListProvider extends ChangeNotifier{
  ImageAndFileList list = ImageAndFileList();
  bool _noFilesSelected = true;
  void addFile(File file){
    ImageAndFileList.filePaths.add(file.path);
    ImageAndFileList.files.add(file);
    _noFilesSelected = false;
    print(ImageAndFileList.filePaths);
    print('List provider');
    notifyListeners();
  }

  void addMultipleFiles(List<File> files){
    ImageAndFileList.files.addAll(files);
    for(var file in files){
      ImageAndFileList.filePaths.add(file.path);
    }
    _noFilesSelected = false;
    notifyListeners();
  }

  void removeAllFiles(){
    ImageAndFileList.filePaths=[];
    ImageAndFileList.files=[];
    _noFilesSelected = true;
    notifyListeners();
  }

  void removeFile(File file){
    ImageAndFileList.filePaths.remove(file.path);
    ImageAndFileList.files.remove(file);
    if(ImageAndFileList.filePaths.length<=0){
      _noFilesSelected=true;
    }
    notifyListeners();
  }

  List<File> get filesList{
    return ImageAndFileList.files;
  }
  List<String> get baseFileNames{
    return ImageAndFileList.filePaths;
  }
  get noFilesSelected{
    return _noFilesSelected;
  }
}