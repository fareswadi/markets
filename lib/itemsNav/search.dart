import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/bloc/CubitsHome.dart';
import 'package:markets/bloc/StateCubitsHome.dart';
import 'package:markets/shareWidget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controllertext = TextEditingController();
  QuerySnapshot querySnapshot;
  bool exsit=false;
  Map<String,dynamic>data;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    TextStyle style = GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    );
    searchwidget(QuerySnapshot<Object> querySnapshot, Size media, EdgeInsets padding, TextStyle style) {
      return exsit

          ?  ListView.builder(
        itemCount:querySnapshot.docs.length ,
        itemBuilder: (context, index) {
          // print(querySnapshot.docs[index].id);
          // var gogo=querySnapshot.docs[index];
          // print(gogo.get('name').toString() +' ***');
          //       print(querySnapshot.docs[index].data() );
          // print(querySnapshot.docs[index].data());


          return Column(children: [
            Container(
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      WidgetsUi().ContainerImagenetwork(
                        image: querySnapshot.docs[index].get('image'),
                        widthContainer: media.width * 0.283,
                        heightContainer:
                        media.height * 0.1306,
                      ),
                      WidgetsUi().SpaceUi(
                          width: media.width * 0.062),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            querySnapshot.docs[index].get('name').length > 15
                                ? querySnapshot.docs[index].get('name')
                                .replaceRange(
                                13,
                                querySnapshot.docs[index].get('name')
                                    .length,
                                '...')
                                : querySnapshot.docs[index].get('name'),
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          WidgetsUi().SpaceUi(
                              height: media.height * 0.01),
                          Text(
                            '\$${querySnapshot.docs[index].get('price')}',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0XFF636363),
                            ),
                          )
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
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: querySnapshot.docs[index].get('love') == false
                            ? Icon(
                          Icons.favorite_border,
                          color: Color(0XFF636363),
                          size: 30,
                        )
                            : Icon(
                          Icons.favorite,
                          color: Color(0xFFFFBD69),
                          size: 30,
                        ),
                       onPressed: (){},
                      ),
                    ],
                  )
                ],
              ),
            ),
            WidgetsUi().SpaceUi(
              height: media.height * 0.0395,
            ),
          ]);
        },
        shrinkWrap: true,
      )
          : elseSerach(media, padding, style);
    }




    EdgeInsets padding = EdgeInsets.symmetric(vertical: 8);
    return BlocConsumer<CubitsHome, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubitvar = CubitsHome.getitem(context);


        return Scaffold(
          body: Stack(
            children: [
              Share().bordercontainer(media),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Share().RowAppbar(context, media,
                        istitle: true, title: 'Search'),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: WidgetsUi().TextFormUi(
                        controllertext,
                        hint: 'Search',
                        suffixIcon: Icon(
                          Icons.search,
                          color: Color(0XFF636363),
                        ),
                         function: (val) {
                           cubitvar
                               .buildSnapshots(controllertext.text)
                               .then((value) {
                             querySnapshot=value;
                             //print(value);
                             setState(() {
                               exsit=true;

                             });
                             if(val.length==0){
                               setState(() {
                                 exsit=false;
                               });
                             }



                           });

                        },
                      ),
                    ),


                    searchwidget(querySnapshot, media, padding, style)


                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }



  yesSearch(Size media) {
    return FutureBuilder(
      builder: (context, snapshot) => ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        WidgetsUi().ContainerImagenetwork(
                          image:
                              'https://sweetcaramelsunday.com/wp-content/uploads/Boiled-Egg-Salad-A.jpg',
                          widthContainer: media.width * 0.283,
                          heightContainer: media.height * 0.1306,
                        ),
                        WidgetsUi().SpaceUi(width: media.width * 0.062),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Egg salad',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '\$15',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Color(0XFF636363),
                              ),
                            )
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
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Color(0XFF636363),
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              WidgetsUi().SpaceUi(height: media.height * 0.0395)
            ],
          );
        },
      ),
    );
  }

  elseSerach(Size media, EdgeInsets padding, TextStyle style) {
    return Column(
      children: [
        WidgetsUi().SpaceUi(height: media.height * 0.032),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'POPULAR',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: Color(0XFF636363),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Mixed fruit salad',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Egg salad',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Grilled chicken with mushrooms',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Japanese salmon',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Grilled lamb',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Spanish roast beef',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Spaghetti',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Japanese sushi',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Mexican barbecue',
                    style: style,
                  ),
                ),
                Padding(
                  padding: padding,
                  child: Text(
                    'Canadian lobster',
                    style: style,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
