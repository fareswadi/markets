import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class SignupGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url:'https://accounts.google.com/signup/v2/webcreateaccount?hl=en&flowName=GlifWebSignIn&flowEntry=SignUp',
      appBar: AppBar(
        title: Text('Sign Up Google'),

      ),
displayZoomControls:true ,
      withZoom: true,

    );
  }
}
