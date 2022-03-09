import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/bloc/CubitsHome.dart';
import 'package:markets/bloc/StateCubitsHome.dart';
import 'package:markets/detailsMenu.dart';
import 'package:markets/models/foodModel.dart';
import 'package:markets/shareWidget.dart';

class AllMenu extends StatefulWidget {
  String title;
  String doc;

  AllMenu({this.title, this.doc});

  @override
  _AllMenuState createState() => _AllMenuState();
}

class _AllMenuState extends State<AllMenu> {
  @override
  bool love;

  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return BlocConsumer<CubitsHome, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubitvar = CubitsHome.getitem(context);
        return Scaffold(
          body: FutureBuilder(
            future: cubitvar.allmenu(widget.title,'P2rJ0RyBMSV7ZjstXa2W2TrI2Mw1'),
            builder: (context, snapshot) {

              if (snapshot.connectionState == ConnectionState.none) {
                print('non');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xFFFFBD69),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0XFFFF6363),
                    ),
                  ),
                );
              }
              if (snapshot.hasData) {

                return buildListView(cubitvar, snapshot, media);
              } else if (snapshot.hasError) {
                Container(
                  child: Text(
                    snapshot.error,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return Center(
                  child: Text(
                'no data for ${widget.title} ',
                style: TextStyle(color: Colors.white),
              ));


            },
          ),
        );
      },
    );
  }

  ListView buildListView(
      CubitsHome cubitvar, AsyncSnapshot snapshot, Size media) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index) {
          String name = snapshot.data.docs[index].data()['name'];
          var basic = snapshot.data.docs[index].data();
         //  cubitvar.
          // allmenu2(widget.title, basic['id'], 'SLIPSE8b3FYRjBiylXTEMsX34t93');
          return Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: 17, left: 17, top: 10, bottom: 10),
                child: WidgetsUi().ContainerBack(
                  height: media.height * 0.1725,
                  border: BorderRadius.circular(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 12, top: 12, bottom: 12),
                                child: WidgetsUi().ContainerImagenetwork(
                                  image: basic['image'],
                                  widthContainer: media.width * 0.283,
                                  heightContainer: media.height * 0.1306,
                                ),
                              ),
                              WidgetsUi().SpaceUi(width: media.width * 0.025),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    basic['name'].length > 15
                                        ? basic['name'].replaceRange(
                                            11, name.length, '...')
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

                                  if (basic['love'] == true) {
                                    print('nooo');
                                    cubitvar.addfavrite(
                                        widget.title, basic['id'], false);

                                    print(basic['id'].toString()+ ' 321');
                                    cubitvar.removetolistLove(id: basic['id'],
                                    userid: 'P2rJ0RyBMSV7ZjstXa2W2TrI2Mw1');
                                    WidgetsUi().reload(
                                        context,
                                        DetailsMenu(
                                          title: widget.title,
                                          doc: widget.doc,
                                          tab: 1,
                                        ));
                                  } else {
                                    print('yesssssss...........');
                                    cubitvar.addfavrite(
                                        widget.title, basic['id'], true);


                                    print(basic['id'].toString() +' 123');
                                    cubitvar.addtolistLove(
                                      image: basic['image'],
                                      price: basic['price'],
                                      name: basic['name'],
                                      id: basic['id'],
                                      userid: 'P2rJ0RyBMSV7ZjstXa2W2TrI2Mw1'
                                    );
                                    WidgetsUi().reload(
                                        context,
                                        DetailsMenu(
                                          title: widget.title,
                                          doc: widget.doc,
                                          tab: 1,
                                        ));
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
