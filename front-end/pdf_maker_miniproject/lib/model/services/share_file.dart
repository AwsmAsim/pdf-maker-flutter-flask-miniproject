import 'package:share/share.dart';

class ShareFile{
  Future<void> shareFile(filePath) async {
    List<String> path = [filePath];
    await Share.shareFiles(path);
  }
}