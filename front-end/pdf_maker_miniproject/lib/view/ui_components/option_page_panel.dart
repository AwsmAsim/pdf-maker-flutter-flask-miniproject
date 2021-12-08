import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsPagePanel extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function onTap;

  const OptionsPagePanel({this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: 80.0,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.white,
                width: 5.0
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon,
              color: Colors.white,
              size: 30.0,
            ),
            SizedBox(
              width: 30.0,
            ),
            Text(title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}
