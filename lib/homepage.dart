import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:markets/ConfirmLogin.dart';
import 'package:markets/bloc/CubitsHome.dart';
import 'package:markets/login.dart';
import 'package:markets/signup.dart';

import 'bloc/StateCubitsHome.dart';



class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
 
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   var media=MediaQuery.of(context).size;
    return BlocConsumer<CubitsHome,HomeState>(
      listener: (context , state){  },
      builder:(context , state) {
        var cubitvar = CubitsHome.getitem(context);
        return Scaffold(

          body: cubitvar.widgetOptions[cubitvar.indexSelected],
          bottomNavigationBar: BottomNavigationBar(
           showUnselectedLabels: true,
           elevation: 0,
            selectedItemColor: Color(0xFFFFBD69),
            backgroundColor: Colors.transparent.withOpacity(0),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
            ],
            currentIndex: cubitvar.indexSelected,

            onTap: (index){
              cubitvar.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
