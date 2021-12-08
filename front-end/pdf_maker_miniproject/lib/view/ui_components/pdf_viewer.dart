import 'package:flutter/material.dart';
import 'package:pdf_maker_miniproject/constants.dart';
import 'package:pdf_maker_miniproject/model/services/download_pdf.dart';
import 'package:pdf_maker_miniproject/model/services/share_file.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final fileDetails;

  const PdfViewerPage(this.fileDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Preview',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.download_rounded,
            color: Colors.white,
            ),
            onPressed: (){
              DownloadPdf(fileDetails['file']);
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0,),
            child: IconButton(
              icon: Icon(Icons.share,
              color: Colors.white,
              ),
              onPressed: (){
                ShareFile().shareFile(fileDetails['path']);
              },
            ),
          )
        ],
      ),
      body: Container(
        child: SfPdfViewer.file(fileDetails['file']),
      ),
    );
  }
}
