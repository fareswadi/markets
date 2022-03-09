import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/bloc/cubitsAuth.dart';
import 'package:markets/login.dart';

class WidgetsUi {
  SpaceUi({double height, double width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  FlatWidget(
      {BuildContext context,
      bool isicon = false,
      IconData icon,
      String text,
      TextStyle textStyle,
      Color colorcontainer,
      Color colorborder,
      double height,
      double width,
      Function function,
      Gradient gradient}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: colorcontainer,
        gradient: gradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: FlatButton(
        onPressed: function,
        child: Row(
          mainAxisAlignment:
              isicon ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
          children: [
            isicon == true
                ? Icon(
                    icon,
                    size: 20,
                    color: Colors.white,
                  )
                : Container(),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }

  NavgetTo({BuildContext context, dynamic route,bool back}) {

   return  back ?Navigator.push(
       context,
       PageRouteBuilder(
           transitionDuration: Duration(seconds: 1),
           transitionsBuilder: (context ,animation,animationTime , child){
             animation= CurvedAnimation(
                 parent: animation,
                 curve: Curves.easeInOutCirc
             );
             return ScaleTransition(
               scale: animation,
               alignment: Alignment.center,
               child: child,
             );

           }

         ,  pageBuilder: (context , animation , animationTime){
       return route;
       }
      ),
    ):
   Navigator.pushReplacement(
     context,
     PageRouteBuilder(
         transitionDuration: Duration(milliseconds: 800),
         transitionsBuilder: (context ,animation,animationTime , child){
           animation= CurvedAnimation(
               parent: animation,
               curve: Curves.easeInOutCirc
           );
           return ScaleTransition(
             scale: animation,
             alignment: Alignment.center,
             child: child,
           );

         }

         ,  pageBuilder: (context , animation , animationTime){
       return route;
     }
     ),
   );
  }

  TextFormUi(
    @required TextEditingController controllertext, {
    String label,
    String prefix,
    String hint,
    double height,
    String validator,
    String intialword,
    BuildContext context,
       Widget suffixIcon,
        Function function,
    bool show = false,
        bool changestyle=false,
        TextStyle style,
  }) {
    return Container(
      height: height,
      child: TextFormField(
        onChanged:function,
       // initialValue: 'intial',
        validator: (val) {
          if (val.isEmpty) {
            return validator;
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
        obscureText: show,
        cursorColor: Colors.white,
        controller: controllertext,
        initialValue: intialword,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: suffixIcon,
          hintStyle: GoogleFonts.openSans(
            color: Color(0XFF636363),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),

          labelStyle: GoogleFonts.openSans(
            color: Color(0XFF636363),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          prefixText: prefix,
          fillColor: Color(0XFF181818),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),

          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: BorderSide(
          //     color: Colors.red,
          //     width: 2.5,
          //   ),
          // ),
          //hintText: hint,
        ),
      ),
    );
  }

  ContainerBack({double width , double height,BorderRadius border,Widget child}) {
    return Container(
      width: width,
      height: height,
      child: child,
      decoration: BoxDecoration(
        borderRadius: border,
        gradient: RadialGradient(
            colors: [
              Color(0XFF2A2133),
              Color(0XFF1F1A25),
              Color(0XFF141418),
              Color(0XFF131317)
            ],
            radius: 2,
            //focalRadius: 100.0,
            // focal: Alignment.center,
            center: Alignment.center,
            tileMode: TileMode.repeated,
            // focal: Alignment.bottomRight,
            stops: [
              0.1,
              0.3,
              0.55,
              0.75,
            ]),
      ),
    );
  }

  imagesvg({String image, double height, double width}) {
    return SvgPicture.asset(
      image,
      // fit: BoxFit.cover,
      height: height,
      width: width,
      allowDrawingOutsideViewBox: true,
      clipBehavior: Clip.none,
    );
  }
  imagesvgNetwork({String image, double height, double width}) {
    return SvgPicture.network(
      image,
     // color: Colors.red,
      // fit: BoxFit.cover,
      height: height,
      width: width,
      allowDrawingOutsideViewBox: true,
      clipBehavior: Clip.none,
    );
  }

  ContainerImageasset(
      {String image, double widthContainer, double heightContainer, bool circle=false}) {
    return Container(
      width: widthContainer,
      height: heightContainer,
      decoration: BoxDecoration(
        //color: Colors.red,
        shape: circle?BoxShape.rectangle:BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
  ContainerImagenetwork(
      {String image, double widthContainer, double heightContainer,
      Color color,
         border
      }) {
    return Container(

      width: widthContainer,
      height: heightContainer,
      decoration: BoxDecoration(
        color: color,
         shape: BoxShape.circle,
        border: border,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
   showToast({
     String message,
     Color colorText,
  }) {
   return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: colorText,
        fontSize: 16.0);
  }
  reload(BuildContext context, route){
    return  Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context){
          return route;
        }
    ));
  }
}

