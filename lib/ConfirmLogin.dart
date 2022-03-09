import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/homepage.dart';

import 'bloc/cubitsAuth.dart';
import 'bloc/stateCubitsAuth.dart';
import 'package:markets/Compents/widgetsUI.dart';

class ConfirmLogin extends StatefulWidget {
  @override
  _ConfirmLoginState createState() => _ConfirmLoginState();
}

class _ConfirmLoginState extends State<ConfirmLogin> {
  @override
  TextEditingController touchidController;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubitvar = CubitdoAuth.getAuth(context);
    var idtoken=FirebaseAuth.instance.currentUser.uid;
    return BlocConsumer<CubitdoAuth, FoodAuthstate>(
    listener: (context, state) {},
    builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Stack(
              children: [
                WidgetsUi().ContainerBack(),
                Transform.translate(
                  offset: Offset(
                      0, //- size.width*0.1867,
                      -size.height * 0.069),
                  child: Container(

                    height: size.height * 0.57885,

                    child: WidgetsUi().imagesvg(
                      image: 'assets/images/con0.svg',
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      size.width * 0.03432, //- size.width*0.1867,
                      -size.height * 0.04363),
                  child: Container(

                    height: size.height * 0.4656,

                    child: WidgetsUi().imagesvg(
                      image: 'assets/images/shape.svg',
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: size.width * 0.344,
                            height: size.height * 0.159,
                            child: WidgetsUi().ContainerImageasset(
                                image: 'assets/images/clip.png'
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFF543864)
                            ),
                          ),

                        ],
                      ),
                    ),
                    WidgetsUi().SpaceUi(
                      height: size.height * 0.0432,
                    ),
                    Container(
                      height: size.height * 0.1601,
                      child: Column(
                        children: [
                          Text('Welcome Back',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),),
                          Text('Jontherry'
                            , style: GoogleFonts.arimaMadurai(
                              fontWeight: FontWeight.w700,
                              fontSize: 31.7,
                              color: Color(0XFFFFBD69),
                            ),
                          ),
                        ],
                      ),
                    ),
                    WidgetsUi().SpaceUi(
                      height: size.height * 0.021,
                    ),
                    Text('Sign in with Touch ID',
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF636363),
                      ),
                    ),
                    WidgetsUi().SpaceUi(height: size.height * 0.03203),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.fingerprint),
                      onPressed:(){
                        cubitvar.fingerTouch();
                        print(cubitvar.istouch);

                        cubitvar.istouch?print(idtoken) : print('');
                          }
                    , iconSize: 45,),
                    WidgetsUi().SpaceUi(
                      height: size.height*0.03695,
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: WidgetsUi().TextFormUi(
                            cubitvar.istouch?TextEditingController(text: idtoken):TextEditingController(text: '')
                            , hint: '. . . . . . . . . . . . . . ',
                            height: (size.height) * 0.0616,
                            show: cubitvar.Showpassword,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              size.width * 0.815, size.height * 0.018),
                          child: InkWell(
                              onTap: () {
                                cubitvar.changeShowPassword();
                                print('dff');
                              },
                              child: cubitvar.icon,
                          ),
                        )
                      ],
                    ),
                    WidgetsUi().SpaceUi(
                      height: size.height*0.03695,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,),
                      child:  WidgetsUi().FlatWidget(
                        text: 'Sign In',
                        function: (){
                          WidgetsUi().NavgetTo(context: context,route:HomePage() );
                        },

                        textStyle: GoogleFonts.arimaMadurai(
                          fontWeight: FontWeight.w600,
                          height: 0.9,
                          textStyle: Theme
                              .of(context)
                              .textTheme
                              .headline2,
                        ),
                        //width: size.width * 0.6085,
                        height: (size.height) *
                            0.0616,
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
                    ),

                    WidgetsUi().SpaceUi(
                        height: size.height * 0.175,
                    )
                  ],
                )
              ]
              ,
            ),
          ),
        )
        ,
      );
    }
    );

    }
  }


