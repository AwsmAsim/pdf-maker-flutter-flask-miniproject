import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_maker_miniproject/constants.dart';
import 'package:pdf_maker_miniproject/controller/list_provider.dart';
import 'package:pdf_maker_miniproject/view/select_files_page.dart';
import 'package:pdf_maker_miniproject/view/ui_components/option_page_panel.dart';
import 'package:provider/provider.dart';

class OptionsPage extends StatelessWidget {

  static String id = 'options_page';

  @override
  Widget build(BuildContext context) {

    void removeAllFiles(){
      Provider.of<ListProvider>(context,listen: false).removeAllFiles();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                ),
                OptionsPagePanel(
                  title: 'PDF from Image',
                  icon: Icons.image,
                  onTap: (){
                    removeAllFiles();
                    Navigator.of(context).pushNamed(SelectFilesPage.imageSelectionId);
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                OptionsPagePanel(
                  title: 'PDF from Camera',
                  icon: Icons.camera_alt,
                  onTap: (){
                    removeAllFiles();
                    Navigator.pushNamed(context, SelectFilesPage.otherFilesSelectionId);
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                OptionsPagePanel(
                  title: 'PDF from Docs',
                  icon: Icons.file_copy_outlined,
                  onTap: (){
                    removeAllFiles();
                    Navigator.pushNamed(context, SelectFilesPage.otherFilesSelectionId);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
