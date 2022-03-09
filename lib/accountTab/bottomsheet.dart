import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
class BottomPage extends StatefulWidget {


  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  TextEditingController nameAcc=TextEditingController();
  @override

  Widget build(BuildContext context) {
    var media=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Add new card',style: GoogleFonts.arimaMadurai(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Color(0XFFFFBD69),
              ),),
            ),
            Text('CARD HOLDER NAME',style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Color(0XFF636363)
            ),),
            WidgetsUi().TextFormUi(nameAcc,
                height:media.height*0.07 ,
                suffixIcon:Icon(Icons.check, color: Color(0XFF636363),),
            context: context,
              show: false
            )
          ],
        ),
      ),
    );
  }
}
