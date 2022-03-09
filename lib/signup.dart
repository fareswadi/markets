import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/ConfirmLogin.dart';
import 'package:markets/bloc/cubitsAuth.dart';
import 'package:markets/bloc/stateCubitsAuth.dart';
import 'package:markets/signupGoogle.dart';

import 'package:markets/Compents/widgetsUI.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController passwordController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController usernamecontroller= TextEditingController();
  GlobalKey<FormState> SignUpkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
    // usernamecontroller = TextEditingController();
    var size = MediaQuery.of(context).size;

    var cubitvar = CubitdoAuth.getAuth(context);
    return BlocConsumer<CubitdoAuth, FoodAuthstate>(listener: (context, state) {
      if (state is LoadingSignUp) {
        print('looooding');
        return CircularProgressIndicator();
      }
    }, builder: (context, state) {
      return Scaffold(

        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Stack(
              children: [
                WidgetsUi().ContainerBack(),
                Transform.translate(
                  offset: Offset(-size.width * 0.2347, -size.height * 0.07269),
                  child: Container(
                    // width: size.width*0.95,
                    height: (size.height) * 0.5666,
                    child: WidgetsUi().imagesvg(
                      image: 'assets/images/login0.svg',
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(size.width * 0.33, -size.height * 0.2178),
                  //0.16962
                  child: Transform.rotate(
                    angle: -53,
                    child: Container(
                      // color: Colors.red,
                      height: size.height * 0.6738,

                      child: WidgetsUi().imagesvg(
                        image: 'assets/images/signup.svg',
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sign Up',
                      style: GoogleFonts.arimaMadurai(
                        fontWeight: FontWeight.w700,
                        color: Color(0XFFFFBD69),
                        fontSize: 36,
                      ),
                    ),
                    WidgetsUi().SpaceUi(
                      height: size.height * 0.0477,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WidgetsUi().FlatWidget(
                            context: context,
                            gradient: LinearGradient(
                              colors: [
                                Color(0XFFFF6363),
                                Color(0XFFFF9066),
                                Color(0XFFFFBD69),
                              ],
                              stops: [
                                0.1,
                                0.3,
                                0.6,
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            text: 'Sign Up with Google',
                            function: (){
                              WidgetsUi().NavgetTo(context: context,route: SignupGoogle());
                            },
                            textStyle: GoogleFonts.arimaMadurai(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            isicon: true,
                            icon: FontAwesomeIcons.google,
                            width: size.width * 0.52,
                            height: size.height * 0.0616,
                          ),
                          stackIcon(
                            icon: FontAwesomeIcons.facebook,
                          ),
                          stackIcon(
                            icon: FontAwesomeIcons.twitter,
                          ),
                        ],
                      ),
                    ),
                    WidgetsUi().SpaceUi(
                      height: size.height * 0.03202,
                    ),
                    Text(
                      'Or With Email',
                      style: GoogleFonts.arimaMadurai(
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF636363),
                        fontSize: 15,
                      ),
                    ),
                    WidgetsUi().SpaceUi(height: size.height * 0.0259),
                    Form(
                      key: SignUpkey,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: WidgetsUi().TextFormUi(
                                  usernamecontroller,
                                  hint: 'User name',
                                  validator: 'please enter the user name field',
                                  height: (size.height) * 0.0616,
                                  context: context,
                                  function: cubitvar.changecolor(usernamecontroller.text),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(
                                    size.width * 0.815, size.height * 0.018),
                                child: InkWell(
                                  onTap: () {
                                  },
                                  child: Icon(Icons.check,color: cubitvar.isgreen?Colors.green:Colors.white,),
                                ),
                              )
                            ],
                          ),
                          WidgetsUi().SpaceUi(height: size.height * 0.0185),
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: WidgetsUi().TextFormUi(
                                    emailController,
                                    hint: 'your Email',
                                    height: (size.height) * 0.0616,
                                    validator: 'please enter the email field',
                                  context: context,
                                  function: cubitvar.changecolor(emailController.text),


                                ),
                              ),
                              Transform.translate(
                                offset: Offset(
                                    size.width * 0.815, size.height * 0.018),
                                child: InkWell(
                                  onTap: () {

                                    print(cubitvar.isgreen);
                                  },
                                  child: Icon(Icons.check,color: cubitvar.isgreen?Colors.green:Colors.white,),
                                ),
                              )
                            ],
                          ),
                          WidgetsUi().SpaceUi(height: size.height * 0.0185),
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: WidgetsUi().TextFormUi(
                                  passwordController,
                                  hint: '. . . . . . . . ',
                                  validator: 'please enter the password field',
                                  height: (size.height) * 0.0616,
                                  show: cubitvar.Showpassword,
                                  context: context,
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(
                                    size.width * 0.81, size.height * 0.015),
                                child: InkWell(
                                  onTap: () {
                                    cubitvar.changeShowPassword();
                                  },
                                  child:cubitvar.icon,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    WidgetsUi().SpaceUi(height: size.height * 0.037),
                    Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) =>
                          state is! LoadingSignUp,
                      widgetBuilder: (BuildContext context) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: WidgetsUi().FlatWidget(
                          text: 'Sign Up',
                          textStyle: GoogleFonts.arimaMadurai(
                            fontWeight: FontWeight.w600,
                            height: 0.9,
                            textStyle: Theme.of(context).textTheme.headline2,
                          ),
                          //width: size.width * 0.6085,
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
                          function: () async {
                            if (SignUpkey.currentState.validate()) {
                              cubitvar.signUp(
                                username: usernamecontroller.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                              Future.delayed(
                                  Duration(seconds: 2),
                                      (){
                                    if(cubitvar.errortext != null && cubitvar.errortext.isNotEmpty )
                                    {
                                      //print(cubitvar.errortext.length);
                                      WidgetsUi().showToast(
                                        message: cubitvar.errortext,
                                        colorText: Colors.white,
                                      );
                                    }
                                  }
                              );
                            }
                          },
                          context: context,
                        ),
                      ),
                      fallbackBuilder: (BuildContext context) => Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFFF6363)),
                        ),
                      ),
                    ),
                    WidgetsUi().SpaceUi(height: size.height * 0.06158)
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Stack stackIcon({IconData icon}) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.1334,
          height: MediaQuery.of(context).size.height * 0.0616,
          decoration: BoxDecoration(
            color: Color(0XFF202040),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              child: Icon(
                icon,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
