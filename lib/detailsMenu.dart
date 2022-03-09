import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/bloc/CubitsHome.dart';
import 'package:markets/bloc/StateCubitsHome.dart';
import 'package:markets/itemsNav/search.dart';
import 'package:markets/tabs/AllMenu.dart';
import 'package:markets/tabs/Discount.dart';
import 'package:markets/tabs/popular.dart';

class DetailsMenu extends StatefulWidget {
  String title;
  String doc;
  int tab;

  DetailsMenu({this.title, this.doc,this.tab});

  @override
  _DetailsMenuState createState() => _DetailsMenuState();


}

class _DetailsMenuState extends State<DetailsMenu>
    with SingleTickerProviderStateMixin {
  @override
  var tabcontroller;
  int selectindex = 0;

  double price = 0.0;
 TextStyle sliderStyle= GoogleFonts.openSans(
  fontWeight: FontWeight.w400,
  color: Color(0XFF636363),);
 int inital;
  @override
  void initState() {
   widget.tab==null?inital=1:inital=widget.tab;
    tabcontroller = TabController(length: 3, vsync: this, initialIndex: inital);
    tabcontroller.addListener(() {});
  }

  @override
  void dispose() {
    tabcontroller.dispose();
    super.dispose();
  }

  var ScaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    // var catograyfilter = '';
    // var cuisinefilter = '';
    // int catograyfilterid = 0;
    // int cuisinefilterid = 0;

    // double price = 0.0;
    var media = MediaQuery.of(context).size;

    return BlocConsumer<CubitsHome, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubitvar = CubitsHome.getitem(context);
        return Scaffold(
          key: ScaffoldKey,
          appBar: AppBar(
            title: Text(
              widget.title,
              style: GoogleFonts.arimaMadurai(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0XFFFFBD69),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Color(0xFFFFBD69),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFFFFBD69),
                  ),
                  onPressed: () {
                    WidgetsUi().NavgetTo(
                        context: context, back: true, route: Search());
                  }),
              IconButton(
                  icon: Icon(
                    Icons.article_outlined,
                    color: Color(0xFFFFBD69),
                  ),
                  onPressed: () {
                    ScaffoldKey.currentState.showBottomSheet((context) {
                      return BlocConsumer<CubitsHome, HomeState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            var cubitvar = CubitsHome.getitem(context);
                            return bottomSheet(media, cubitvar);
                          });
                    });
                  })
            ],
            bottom: TabBar(
              controller: tabcontroller,
              labelStyle: GoogleFonts.openSans(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              indicatorColor: Color(0xFFFFBD69),
              indicatorPadding: EdgeInsets.only(right: 12, left: 12, top: 22),
              tabs: [Text('Popular'), Text('All Menu'), Text('Discount')],
            ),
          ),
          body: TabBarView(
            controller: tabcontroller,
            children: [
              Popular(title: widget.title,doc: widget.doc,),
              AllMenu(title: widget.title,doc: widget.doc,),
              Discount(title: widget.title,doc: widget.doc,),
            ],
          ),
        );
      },
    );
  }

  Container bottomSheet(Size media, CubitsHome cubitvar) {
    return Container(
                            height: media.height,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0XFF141416),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Filter',
                                    style: GoogleFonts.arimaMadurai(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFFFBD69),
                                    ),
                                  ),
                                ),
                                WidgetsUi()
                                    .SpaceUi(height: media.height * 0.015),
                                Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 8, bottom: 5),
                                        child: Text(
                                          'CATEGORIES',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: GridView.count(
                                          shrinkWrap: true,
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 7,
                                          mainAxisSpacing: 7,
                                          childAspectRatio: 3,
                                          children: [
                                            elementFilterCatogray(
                                                cubitvar, media,
                                                title: 'Breakfast', id: 0),
                                            elementFilterCatogray(
                                                cubitvar, media,
                                                title: 'Lunch', id: 1),
                                            elementFilterCatogray(
                                                cubitvar, media,
                                                title: 'Diner', id: 2),
                                            elementFilterCatogray(
                                                cubitvar, media,
                                                title: 'Drink', id: 3),
                                            elementFilterCatogray(
                                                cubitvar, media,
                                                title: 'Fast food', id: 4),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 8, bottom: 5),
                                        child: Text(
                                          'CUISINE',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: GridView.count(
                                          shrinkWrap: true,
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 7,
                                          mainAxisSpacing: 7,
                                          childAspectRatio: 3,
                                          children: [
                                            elementFilterCuisine(
                                                cubitvar, media,
                                                title: 'Asian', id: 0),
                                            elementFilterCuisine(
                                                cubitvar, media,
                                                title: 'Italian', id: 1),
                                            elementFilterCuisine(
                                                cubitvar, media,
                                                title: 'Mexican', id: 2),
                                            elementFilterCuisine(
                                                cubitvar, media,
                                                title: 'Europe', id: 3),
                                            elementFilterCuisine(
                                                cubitvar, media,
                                                title: 'Pizza', id: 4),
                                            elementFilterCuisine(
                                                cubitvar, media,
                                                title: 'japan', id: 5),
                                            elementFilterCuisine(
                                                cubitvar, media,
                                                title: 'Burgers', id: 6),
                                            elementFilterCuisine(
                                                cubitvar, media,
                                                title: 'Shushi', id: 7),
                                          ],
                                        ),
                                      ),
                                      //slider****
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'PRICE',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ),
                                      RangeSlider(
                                        min: 0,
                                        max: 100,
                                        inactiveColor: Color(0XFF20203F),
                                        onChanged: (values) {
                                          cubitvar.changeStartSlider(
                                              values.start);
                                          cubitvar
                                              .changeEndSlider(values.end);
                                        },
                                        divisions: 10,
                                        values: RangeValues(
                                            cubitvar.min, cubitvar.max),
                                        labels: RangeLabels(
                                            '\$${cubitvar.min.round().toString()}',
                                            '\$${cubitvar.max.round().toString()}'),
                                        activeColor: Color(0XFFFF6363)
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$1',
                                              style: sliderStyle,
                                            ),
                                            Text('\$${cubitvar.min}',
                                              style: sliderStyle,),
                                            Text('\$${cubitvar.max}',
                                              style: sliderStyle,),
                                            Text('\$100',
                                              style: sliderStyle,),
                                          ],
                                        )
                                      ),
                                      WidgetsUi().SpaceUi(
                                        height: media.height*0.04
                                      )
                                      ,
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
                                                  Color(0XFFFF6363),
                                                  Color(0XFFFF9066),
                                                  Color(0XFFFFBD69),
                                                ],
                                                stops: [
                                                  0.3,
                                                  0.5,
                                                  0.7
                                                ]
                                              )
                                            ),
                                            child: MaterialButton(onPressed: (){},
                                            child: Text('Filter',style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
  }

  InkWell elementFilterCatogray(CubitsHome cubitvar, Size media,
      {String title, int id}) {
    return InkWell(
        onTap: () {
          cubitvar.changefilter(title, id);

          print(cubitvar.catograyid == id);

          print(cubitvar.catograyid);
        },
        child: Container(
          height: media.height * 0.047,
          width: media.width * 0.2534,
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.openSans(
                color: cubitvar.catograyid == id
                    ? Colors.white
                    : Color(0XFF636363),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: cubitvar.catograyid == id
                  ? Color(0XFF20203F)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0XFF202040))),
        ));
  }

  InkWell elementFilterCuisine(CubitsHome cubitvar, Size media,
      {String title, int id}) {
    return InkWell(
        onTap: () {
          cubitvar.changecuisinefilter(title, id);

          print(cubitvar.cuisineid == id);

          print(cubitvar.cuisineid);
        },
        child: Container(
          height: media.height * 0.047,
          width: media.width * 0.2534,
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.openSans(
                color:
                    cubitvar.cuisineid == id ? Colors.white : Color(0XFF636363),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: cubitvar.cuisineid == id
                ? Color(0XFF20203F)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Color(0XFF202040),
            ),
          ),
        ));
  }

  Padding RowAppbar(Size media, {String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Color(0xFFFFBD69),
              ),
              onPressed: () {
                print('soso');
                Navigator.pop(context);
              }),
          Text(
            title,
            style: GoogleFonts.arimaMadurai(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0XFFFFBD69),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Color(0xFFFFBD69),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
