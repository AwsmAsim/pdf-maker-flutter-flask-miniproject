import 'package:image_picker/image_picker.dart';
import 'package:pdf_maker_miniproject/controller/list_provider.dart';
import 'dart:io';
import 'package:pdf_maker_miniproject/model/repository/image_and_file_list.dart';
import 'package:provider/provider.dart';

class ImageSelection{

  final picker = ImagePicker();
  File _image;
  ImageAndFileList list;
  ListProvider listProvider = ListProvider();
  Future<File> getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        list = ImageAndFileList();
        // listProvider.addFile(File(pickedFile.path));
          _image = File(pickedFile.path);
          return _image;
          // listProvider.addFile(_image);
          // ImageAndFileList.baseNameFiles.add(_image.path);
          // ImageAndFileList.files.add(_image);
        // print('List of images : ${list.baseNameFiles}');
        // print(pickedFile.path);
      } else {
        print('No image selected.');
      }
  }
}
