import 'package:flutter/material.dart';
import 'package:pdf_maker_miniproject/controller/list_provider.dart';
import 'package:pdf_maker_miniproject/view/options_page.dart';
import 'package:pdf_maker_miniproject/view/select_files_page.dart';
import 'package:provider/provider.dart';

import 'view/home_page.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListProvider>(
            create: (context)=>ListProvider()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          MyHomePage.id :(context)=>MyHomePage(),
          SelectFilesPage.imageSelectionId: (context) => SelectFilesPage(),
          SelectFilesPage.otherFilesSelectionId: (context) => SelectFilesPage(imageSelection: false,),
          OptionsPage.id: (context)=> OptionsPage(),
        },
        initialRoute: MyHomePage.id,
      ),
    );
  }
}



