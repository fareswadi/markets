import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/accountTab/bottomsheet.dart';

class PaymentTab extends StatefulWidget {
  @override
  _PaymentTabState createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
  @override
  var scafkey=GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      key: scafkey,
      
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MY CARD',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      scafkey.currentState.showBottomSheet((context)  {

                        return BottomPage();
                      },

                      );
                    },
                    color: Color(0XFFFFBD69),
                  ),
                ],
              ),
            ),
            Container(
              height: media.height * 0.35,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildStack(media);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MY PAYPAL',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Cuonght@gmail.com',
                        style: GoogleFonts.openSans(
                          color: Color(0XFF636363),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.edit,color: Color(0XFFFFBD69),), onPressed: (){}),

              ],
            ),
            WidgetsUi().SpaceUi(height: media.height*0.06)
          ],
        ),
      ),
    );
  }

  Stack buildStack(Size media) {
    return Stack(
      children: [
        WidgetsUi().ContainerImageasset(
            image: 'assets/images/visa.png',
            widthContainer: media.width * 0.78,
            heightContainer: media.height * 0.37,
            circle: true),
        Transform.translate(
          offset: Offset(0, media.height * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  '2333  3444  2678',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              WidgetsUi().SpaceUi(height: media.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MONTH/ YEAR',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '04/05',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    WidgetsUi().SpaceUi(width: media.width * 0.18),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CARDHOLDER',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'TONY NGUYEN',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
