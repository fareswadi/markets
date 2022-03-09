import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/accountTab/payment_Tab.dart';
import 'package:markets/shareWidget.dart';
import 'package:markets/accountTab/tabAccount.dart';
class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account>with SingleTickerProviderStateMixin {
  @override
  var tabcontroller;
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this, initialIndex: 0);
    tabcontroller.addListener(() {});
  }
  void dispose() {
    tabcontroller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context).size;


    return Scaffold(
     
      body: Stack(
        children: [
        Share().bordercontainer(media,
        child: Column(
          children: [
           WidgetsUi().SpaceUi(height: media.height*0.1),
              Stack(
                children: [

                  WidgetsUi().ContainerImagenetwork(
                      image: 'https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png'
                      ,heightContainer: media.height*0.159,
                      widthContainer: media.width*0.344,
                    color: Color(0XFF543864),
                   border: Border.all(color: Colors.white,
                   width: 0.5)

                  ),
                  Transform.translate(
                    offset: Offset(media.width*0.25,media.height*0.09),
                    child: Container(
                      height: media.height*0.0432,
                        width: media.width*0.0934,
                       child: Icon(Icons.camera_alt,color: Colors.white,size: 22,),
                       decoration: BoxDecoration(
                         color: Color(0XFF202040),
                         shape: BoxShape.circle,
                       ),
                    ),
                  )
                ],
              ),
            Text('Jontherry',style: GoogleFonts.arimaMadurai(
              fontSize: 31.7,
              color: Color(0XFFFFBD69),
              fontWeight: FontWeight.w700,
            ),),
            Text('cuonght@gmail.com',style: GoogleFonts.openSans(
              fontSize: 14,
              color: Color(0XFF636363),
              fontWeight: FontWeight.w400,
            ),),
            WidgetsUi().SpaceUi(height: media.height*0.021),
            Container(
            // color: Colors.pink,
             // margin: EdgeInsets.only(bottom: 20),
              height: media.height*0.037,
              width: media.width*0.81,
              child: TabBar(

                  controller: tabcontroller,
                  labelStyle: GoogleFonts.openSans(
                  fontSize: 15,
                  color: Colors.white,

                  fontWeight: FontWeight.w600,
                ),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 0),
                  indicatorColor:Color(0XFFFFBD69),

                  tabs: [
                    Text('Account'),
                    Text('Payment'),
                    Text('History')
                  ],
                ),

            ),
            Expanded(
              child: TabBarView(
                  controller: tabcontroller,
                  children: [
                AccountTab(),
               PaymentTab(),
                Container(
                  height: 100,width: 200,
                  color: Colors.green,
                ),
              ]),
            ),
          ],
        ),
        ),
          Share().RowAppbar(context, media,title: 'My Account',istitle: true),
        ],
      ),
    );
  }
}
