import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:markets/bloc/stateCubitsAuth.dart';

class CubitdoAuth extends Cubit<FoodAuthstate> {
  CubitdoAuth() : super(intialshop());

  static CubitdoAuth getAuth(context) => BlocProvider.of(context);
  var Showpassword = true;
  var icon = Icon(Icons.remove_red_eye);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String errortext='';
  changeShowPassword() {
    Showpassword = !Showpassword;
    if (Showpassword) {
      icon = Icon(Icons.visibility);
    } else {
      icon = Icon(Icons.visibility_off);
    }
    emit(changeshowPasswordState());
  }

  signUp({String email , String password, String username}) async {
    errortext='';
   try{
     emit(LoadingSignUp());
     UserCredential usersign = await FirebaseAuth.instance
         .createUserWithEmailAndPassword(
       email: email,
       password: password,
     );
     await users.add({
       'username':username,
       'email':email,
     });
      emit(SuceessSignUp());
   }on FirebaseAuthException catch(e){

      if (e.code == 'weak-password') {
       print('The password provided is too weak.');
       errortext='The password provided is too weak.';
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
       errortext='The account already exists for that email.';
     }
  emit(errorSignUp());
   }catch(e){

      print(e);
      errortext=e;
     emit(errorSignUp());
    }
  }
 bool isgreen=false;
  changecolor(value){
    if(value.length>=5){

     isgreen=true;
    }else{
      isgreen=false;
    }
    emit(changeColorIcon());
  }
  bool istouch=false;
  fingerTouch(){
    istouch=true;
    emit(fingertouch());
  }

  login({String email, String password})async{
    errortext='';
    try{

      emit(LoadingLogin());
      var userlogin=await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      emit(SuceessLogin());
    }on FirebaseException catch(e){


      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        errortext='No user found for that email.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        errortext='Wrong password provided for that user.';
      }
      emit(errorLogin());
    }
  }
  Future<UserCredential> loginWithFacebook()async{

    try{
      emit(LoadingLoginfb());
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider
          .credential(loginResult.accessToken.token);

      // Once signed in, return the UserCredential
      emit(SuceessLoginfb());
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    }catch(e){
      print(e);
      errortext=e;
      emit(errorLoginfb());
    }

  }
  Future<UserCredential> loginWithGoogle()async{

    try{
      emit(LoadingLoginGoogle());
      // Trigger the sign-in flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
     emit(SuceessLoginGoogle());
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);

    }catch(e){
      print(e);
      errortext=e;
      emit(errorLoginGoogle());
    }

  }
}