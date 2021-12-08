import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'options_page.dart';
import 'package:path_provider/path_provider.dart' as pathp;
import 'dart:io';

class MyHomePage extends StatelessWidget {

  static String id = '/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(width: double.infinity,),
            
            // Pdf Maker Logo
            Container(
              child: Image.asset('images/mini_project_pdfm_logo.png'),
              width: MediaQuery.of(context).size.width/2.4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: primaryColorTint,
                      offset: Offset(-8,-8),
                      blurRadius: 15.0,
                      spreadRadius: 1.0
                  ),
                  BoxShadow(
                    color: primaryColorShade,
                    offset: Offset(10,10),
                    blurRadius: 10.0,
                    spreadRadius: 1.0
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            // Add Button
            Column(
              children: [
                // add button
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(OptionsPage.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width/3,
                      width: MediaQuery.of(context).size.width/3,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width*0.1,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffe40001),
                          Color(0xffff0001)
                          ]
                        ),
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width/3)),
                        // border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              color: primaryColorTint,
                              offset: Offset(-5,-5),
                              blurRadius: 20.0,
                              spreadRadius: 1.0
                          ),
                          BoxShadow(
                              color: primaryColorShade,
                              offset: Offset(10,10),
                              blurRadius: 10.0,
                              spreadRadius: 1.0
                          )
                        ],
                      ),

                    ),
                  ),
                ),
                // Make PDF label
                Container(
                  child: Text('MAKE PDF',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Container(
                  height: 30.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}