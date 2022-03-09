import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
class AccountTab extends StatefulWidget {
  

  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController accountnumController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: WidgetsUi().TextFormUi(nameController,
                  hint: 'name',
                  height: media.height*0.0555,
                ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: WidgetsUi().TextFormUi(emailController,
                    hint: 'email',
                    height: media.height*0.0555,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: WidgetsUi().TextFormUi(accountnumController,
                    hint: 'account number',
                    height: media.height*0.0555,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: WidgetsUi().TextFormUi(passwordController,
                    hint: 'password',
                      height: media.height*0.0555,
                    suffixIcon: Icon(Icons.edit,color: Color(0XFFFFBD69),),
                    show: true
                  ),
                ),
                WidgetsUi().SpaceUi(height: media.height*0.0283),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: media.height*0.0616,
                      width: media.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                              colors: [
                                Color(0XFFFFBD69),

                                Color(0XFFFF9066),
                                Color(0XFFFF6363),
                              ],
                              stops: [
                                0.3,
                                0.6,
                                0.9
                              ]
                          )
                      ),
                      child: MaterialButton(onPressed: (){},
                        child: Text('Save profile',style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15,
                        ),),
                      ),
                    ),
                  ),
                ),
                WidgetsUi().SpaceUi(height: media.height*0.03)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
