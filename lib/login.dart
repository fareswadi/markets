import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/bloc/cubitsAuth.dart';
import 'package:markets/bloc/stateCubitsAuth.dart';
import 'package:markets/ConfirmLogin.dart';
import 'package:markets/homepage.dart';

import 'package:markets/Compents/widgetsUI.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login> {
  @override
  // TextEditingController idController;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();


  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var cubitvar = CubitdoAuth.getAuth(context);
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
                      offset:
                          Offset(-size.width * 0.2347, -size.height * 0.07269),
                      child: Container(
                        // width: size.width*0.95,
                        height: (size.height) * 0.5666,
                        child: WidgetsUi().imagesvg(
                          image: 'assets/images/login0.svg',
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset:
                          Offset(size.width * 0.1707, -size.height * 0.1515),
                      child: Container(
                        // color: Colors.red,
                        height: size.height * 0.52525,

                        child: WidgetsUi().imagesvg(
                          image: 'assets/images/your image here.svg',
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Sign In',
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
                                function: (){
                                  cubitvar.loginWithGoogle().then((value) {
                                    WidgetsUi().NavgetTo(
                                      context:context ,
                                      back: false,
                                      route: HomePage()

                                    );
                                  });
                                },
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
                                text: 'Sign in with Google',
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
                                  funcation: () {
                                    cubitvar.loginWithFacebook().then((value) =>
                                        WidgetsUi().NavgetTo(
                                            context: context,
                                            back: false,
                                            route: ConfirmLogin()));
                                  }),
                              stackIcon(
                                  icon: FontAwesomeIcons.twitter,
                                  funcation: () {

                                    },
                              )],
                          ),
                        ),
                        WidgetsUi().SpaceUi(
                          height: size.height * 0.037,
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
                          key: loginKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: WidgetsUi().TextFormUi(
                                  emailController,
                                  label: 'Your Email',
                                  height: (size.height) * 0.0616,
                                  context: context,
                                  validator: 'please enter the email field',
                                ),
                              ),
                              WidgetsUi().SpaceUi(height: size.height * 0.0185),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: WidgetsUi().TextFormUi(
                                        passwordController,
                                        hint: '. . . . . . . . ',
                                        height: (size.height) * 0.0616,
                                        context: context,
                                        validator:
                                            'please enter the password field'),
                                  ),
                                  Transform.translate(
                                    offset: Offset(size.width * 0.7307,
                                        size.height * 0.018),
                                    child: InkWell(
                                      onTap: () {
                                        print('dff');
                                      },
                                      child: Text(
                                        'Forget?',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0XFF636363),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              WidgetsUi().SpaceUi(height: size.height * 0.037),
                            ],
                          ),
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (BuildContext context) =>
                              state is! LoadingLogin,
                          widgetBuilder: (BuildContext context) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: WidgetsUi().FlatWidget(
                              text: 'Sign In',
                              function: () {
                                if (loginKey.currentState.validate()) {

                                  cubitvar.login(
                                      email: emailController.text,
                                      password: passwordController.text).then((value){
                                        WidgetsUi().NavgetTo(context: context,
                                            back:false ,
                                            route: ConfirmLogin(),);
                                        return value;
                                  });
                                  Future.delayed(
                                    Duration(seconds: 2),
                                      (){
                                        if(cubitvar.errortext != null && cubitvar.errortext.isNotEmpty )
                                        {
                                          WidgetsUi().showToast(
                                            message: cubitvar.errortext,
                                            colorText: Colors.white,
                                          );
                                        }
                                      }
                                  );

                                }else{

                                }
                              },
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

                              context: context,
                            ),
                          ),
                          fallbackBuilder: (BuildContext context) => Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0XFFFF6363),
                              ),
                            ),
                          ),
                        ),

                        WidgetsUi().SpaceUi(height: size.height * 0.0826)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Stack stackIcon({IconData icon, Function funcation}) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.1334,
          height: MediaQuery.of(context).size.height * 0.0616,
          decoration: BoxDecoration(
            color: Color(0XFF202040),
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: funcation,
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
        ),
      ],
    );
  }
}
