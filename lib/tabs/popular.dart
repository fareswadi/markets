import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/bloc/CubitsHome.dart';
import 'package:markets/bloc/StateCubitsHome.dart';
import 'package:markets/detailsMenu.dart';
import 'package:markets/shareWidget.dart';

class Popular extends StatefulWidget {
  String title;
  String doc;

  Popular({this.title,this.doc});

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;
    return BlocConsumer<CubitsHome, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubitvar = CubitsHome.getitem(context);

        return Scaffold(
          body: FutureBuilder(
            future: cubitvar.popular(widget.title, widget.doc),
            builder:(context, snapshot){

              if( snapshot.connectionState==ConnectionState.waiting){

                return Center(child: CircularProgressIndicator(backgroundColor: Color(0xFFFFBD69),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0XFFFF6363),
                  ),),
                );
              }
              if(snapshot.hasData){
                print('yesssssssss');
                print(widget.doc);
                print(snapshot.data.docs.length);
                return buildListView(cubitvar,snapshot, media);
              }
              else if(snapshot.hasError){
                Container(
                  child: Text(snapshot.error,style: TextStyle(color: Colors.white),),
                );
              }
              return Center(child: Text('no data for ${widget.title} ',style: TextStyle(color: Colors.white),));

              // Container(
              //   child: Center(
              //     child: Text(snapshot.data.docs[0].data()['name'],style: TextStyle(color: Colors.white),),
              //   ),
              // ):


            },
          ),
        );
      },
    );
  }



  ListView buildListView(CubitsHome cubitvar,AsyncSnapshot snapshot, Size media) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index) {

          var basic = snapshot.data.docs[index].data();
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: 17, left: 17, top: 10, bottom: 10),
                child: WidgetsUi().ContainerBack(
                  height: media.height * 0.1725,
                  border: BorderRadius.circular(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 12, top: 12, bottom: 12),
                                child: WidgetsUi()
                                    .ContainerImagenetwork(
                                  image: basic['image'],
                                  widthContainer:
                                  media.width * 0.283,
                                  heightContainer:
                                  media.height * 0.1306,
                                ),
                              ),
                              WidgetsUi().SpaceUi(
                                  width: media.width * 0.025),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    basic['name'].length > 15
                                        ? basic['name']
                                        .replaceRange(11,
                                        basic['name'].length, '...')
                                        : basic['name'],
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '\$${basic['price']}',
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                     // decoration:TextDecoration.lineThrough ,
                                      color: Color(0XFF636363),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Color(0XFF636363),
                                  size: 25,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon:
                                //   //   basic['yK6I6jkcdCVcqJriUsUeuEuuKod2']==true
                                //   (
                                //       basic['love'][0]['yK6I6jkcdCVcqJriUsUeuEuuKod2']==null ||
                                //       basic['love'][0]['yK6I6jkcdCVcqJriUsUeuEuuKod2']==false
                                //   )
                                //
                                //
                                //
                                //
                                //
                                // // (
                                // //      cubitvar.love[1].islove==null ||
                                // //          cubitvar.love[1].islove==false
                                // //  )
                                basic['love']==false
                                    ? Icon(
                                  Icons.favorite_border,
                                  color: Color(0XFF636363),
                                  size: 25,
                                )
                                    : Icon(
                                  Icons.favorite,
                                  color: Color(0xFFFFBD69),
                                  size: 25,
                                ),
                                onPressed: () {
                                  if(basic['love']==true){
                                    cubitvar.addfavrite(widget.title, basic['id'], false);
                                    WidgetsUi().reload(context, DetailsMenu(title: widget.title,doc: widget.doc,tab: 0,));
                                  }else{
                                    cubitvar.addfavrite(widget.title, basic['id'], true);
                                    WidgetsUi().reload(context, DetailsMenu(title: widget.title,doc: widget.doc,tab: 0,));
                                  }

                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
//Popular
//
