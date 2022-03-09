import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/login.dart';
import 'package:markets/signup.dart';
import 'package:markets/Compents/widgetsUI.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    print(MediaQuery.of(context).padding.top);
    return Scaffold(
      body: Stack(
        children: [
          WidgetsUi().ContainerBack(),
          Transform.translate(
              offset: Offset(
                size.width * -0.41382,
                (size.height) * 0.14627,
              ),
              child: Container(
                // width: size.width*0.95,
                height: (size.height) * 0.44051,
                child: WidgetsUi().imagesvg(
                  image: 'assets/images/shape0.svg',
                ),
              )),
          Transform.translate(
            offset: Offset(
              size.width * 0.14632,
              -(size.height) * 0.01408,
            ),
            child: Container(
              // width: size.width*0.95,
              height: (size.height) * 0.466,
              child: WidgetsUi().imagesvg(
                image: 'assets/images/shape.svg',
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
              size.width * 0.0694,
              -(size.height) * 0,
            ),
            child: Container(
              // width: size.width*0.786,
              height: (size.height) * 0.5347,
              child: WidgetsUi().imagesvg(
                image: 'assets/images/big image.svg',
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: (size.height) * 0.0493,
                  child: Center(
                    child: Text(
                      'Foda',
                      style: GoogleFonts.arimaMadurai(
                          fontWeight: FontWeight.w700,
                          textStyle: Theme.of(context).textTheme.headline1),
                    ),
                  ),
                ),
                WidgetsUi().SpaceUi(height: (size.height) * 0.005),
                Container(
                  height: (size.height) * 0.1232,
                  child: Center(
                    child: Text(
                      '\t Welcome to\nFood Delivery',
                      style: GoogleFonts.arimaMadurai(
                          fontWeight: FontWeight.w700,
                          height: 0.9,
                          textStyle: Theme.of(context).textTheme.headline1,
                          color: Color(0XFFFFBD69)),
                    ),
                  ),
                ),
                WidgetsUi().SpaceUi(
                  height: (size.height) * 0.00087,
                ),
                WidgetsUi().FlatWidget(
                  text: 'Sign In',
                  function: () {
                    WidgetsUi().NavgetTo(
                      context: context,
                      back: true,
                      route: Login(),
                    );
                  },
                  textStyle: GoogleFonts.arimaMadurai(
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                    textStyle: Theme.of(context).textTheme.headline1,
                  ),
                  width: size.width * 0.6085,
                  height: (size.height) * 0.0616,
                  gradient: LinearGradient(
                    colors: [
                      Color(0XFFFF6363),
                      Color(0XFF543864),
                    ],
                    stops: [
                      0.05,
                      0.7,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  context: context,
                ),
                WidgetsUi().SpaceUi(height: (size.height) * 0.0247),
                WidgetsUi().FlatWidget(
                  text: 'Sign Up',
                  textStyle: GoogleFonts.arimaMadurai(
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                    textStyle: Theme.of(context).textTheme.headline1,
                  ),
                  width: size.width * 0.6085,
                  height: (size.height) * 0.0616,
                  colorcontainer: Color(0XFF202040),
                  function: () {
                    WidgetsUi().NavgetTo(context: context,back: true, route: SignUp());
                  },
                  context: context,
                ),
                WidgetsUi().SpaceUi(height: (size.height) * 0.085)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
