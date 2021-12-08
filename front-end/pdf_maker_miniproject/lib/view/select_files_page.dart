import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf_maker_miniproject/constants.dart';
import 'package:pdf_maker_miniproject/controller/list_provider.dart';
import 'package:pdf_maker_miniproject/model/repository/image_and_file_list.dart';
import 'package:pdf_maker_miniproject/model/services/api_service.dart';
import 'package:pdf_maker_miniproject/model/services/file_selection.dart';
import 'package:pdf_maker_miniproject/model/services/image_selection.dart';
import 'package:pdf_maker_miniproject/view/ui_components/pdf_viewer.dart';
import 'package:provider/provider.dart';

class SelectFilesPage extends StatelessWidget {
  static String imageSelectionId = 'selectImageFilesPage';
  static String otherFilesSelectionId = 'selectDocsAndPdfPage';
  final bool imageSelection;
  const SelectFilesPage({this.imageSelection = true});

  @override
  Widget build(BuildContext context) {
    String productionApi = r'https://pdf-maker-miniproject.herokuapp.com/api';
    var localHost = r'http://10.0.2.2:5000/api';
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          Consumer<ListProvider>(
            builder: (context, listProvider, _) {
              return listProvider.baseFileNames.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                      child: GestureDetector(
                        onTap: () async{
                          Api api = Api();
                          var receivedFile = await api.uploadMultipleImage(listProvider.baseFileNames,
                              r'https://pdf-maker-miniproject.herokuapp.com/api');
                          print(receivedFile['path']);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>PdfViewerPage(receivedFile)
                            )
                          );
                          listProvider.removeAllFiles();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: primaryColorShade,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Center(
                            child: Text(
                              'Send Files',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: primaryColor,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ListProvider>(
                builder: (context, list, _) {
                  // var listLength = list.baseFileNames.length;
                  return ImageAndFileList.filePaths.length < 1
                      ? Center(
                        child: Text(
                            'Please select file by pressing the button below.',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12.0),
                          ),
                      )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: list.baseFileNames.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (list.noFilesSelected) {
                              return Text(
                                'Please select file by pressing the button below.',
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 12.0),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    // to remove the tapped file
                                    list.removeFile(list.filesList[index]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      color: Colors.white,
                                    ),
                                    child: imageSelection
                                        ? Image.file(
                                            ImageAndFileList.files[index])
                                        : Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.file_copy,
                                                  color: primaryColor,
                                                  size: 50.0,
                                                ),
                                                //SizedBox(height: 15.0),
                                                Text(list.baseFileNames[index]
                                                    .split('/')
                                                    .last),
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                },
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (imageSelection) {
                  var selectedFile = await ImageSelection().getImage();
                  Provider.of<ListProvider>(context, listen: false)
                      .addFile(selectedFile);
                } else {
                  var selectedFiles = await FileSelection().getFiles();
                  print('files Selected : $selectedFiles');
                  Provider.of<ListProvider>(context, listen: false)
                      .addMultipleFiles(selectedFiles);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(color: primaryColor)),
                  child: Center(
                    child: Text(
                      'ADD',
                      style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
