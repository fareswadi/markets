import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/homepage.dart';
import 'package:markets/models/menuModel.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/shareWidget.dart';

class PrimaryHome extends StatefulWidget {
  @override
  _PrimaryHomeState createState() => _PrimaryHomeState();
}

class _PrimaryHomeState extends State<PrimaryHome> {
  @override
  String image1='https://images.immediate.co.uk/production/volatile/sites/30/2020/08/curried-rice-egg-salad-b82fca5.jpg?quality=90&resize=440,400' ;
  String image2='https://sweetcaramelsunday.com/wp-content/uploads/Boiled-Egg-Salad-A.jpg' ;
  String namefood= 'Egg salad';
  double price= 35;


  changebackground(int index){
    if(index==1){
      setState(() {
        image1='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBUH5-Hw2RjToa3_GsKKqxFClj5AhU5jz2Lzdh27nukeeaTlB7hjKQwJUgAYHztqZZhqA&usqp=CAU' ;
        image2='https://www.inspiredtaste.net/wp-content/uploads/2019/03/Spaghetti-with-Meat-Sauce-Recipe-1-1200.jpg' ;
        namefood= 'Gnocchi';
        price= 20;
      });

    }else if(index==2){
      setState(() {
        image1='https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Chicken_65_%28Dish%29.jpg/1200px-Chicken_65_%28Dish%29.jpg' ;
        image2='https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/bltgbpxqai8onm0tiebh' ;
        namefood= 'Butter ';
        price= 30;
      });
    }else if(index==3){
      setState(() {
        image1='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHfwFUX0xqj89mjCfBlDNnG2qsv4GwOP0gmg&usqp=CAU';
        image2='https://thebusybaker.ca/wp-content/uploads/2018/06/easy-no-fail-homemade-angel-food-cake-fbig1.jpg' ;
        namefood= 'Cakes';
        price= 40;
      });

    }else if(index==4){
      setState(() {
        image1='https://s1.1zoom.me/big0/233/Fish_Food_Lemons_Tomatoes_Plate_521275_1280x853.jpg' ;
        image2='https://media.gettyimages.com/photos/closeup-of-fish-and-rice-in-plate-on-white-background-picture-id1064599380?s=612x612' ;
        namefood= 'Pellets';
        price= 50;
      });
    }else{
      setState(() {
        image1='https://images.immediate.co.uk/production/volatile/sites/30/2020/08/curried-rice-egg-salad-b82fca5.jpg?quality=90&resize=440,400' ;
        image2='https://sweetcaramelsunday.com/wp-content/uploads/Boiled-Egg-Salad-A.jpg' ;
        namefood= 'Egg salad';
        price= 35;
      });
    }

  }
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    List<MenuModel> listmenu = [
      MenuModel(image: 'assets/images/menu1.svg', name: 'salad'),
      MenuModel(image: 'assets/images/menu1.svg', name: 'spaghetti'),
      MenuModel(image: 'assets/images/menu2.svg', name: 'chicken'),
      MenuModel(image: 'assets/images/menu1.svg', name: 'sweet'),
      MenuModel(image: 'assets/images/menu4.svg', name: 'fish'),

    ];


    return Scaffold(
      body: Stack(
        children: [
         Share().bordercontainer(media),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Share().RowAppbar(context,media,istitle: false),
              Stack(
                children: [
                  Transform.translate(
                    offset: Offset(
                        media.width * 0.04579,
                        (media.height - MediaQuery.of(context).padding.top) *
                            0.17),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            namefood,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 30),
                          ),
                          WidgetsUi().SpaceUi(height: media.height * 0.01232),
                          Text(
                            '\$ ${price.toString()}',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w400,
                                color: Color(0XFFFF6363),
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-media.width * 0.47, media.height * 0.33),
                    child: WidgetsUi().ContainerImagenetwork(
                        image:
                            image2,
                        //widthContainer: media.width*0.48,
                        heightContainer: media.height * 0.22168),
                  ),
                  Transform.translate(
                    offset: Offset(media.width * 0.45, media.height * 0.00),
                    child: WidgetsUi().ContainerImagenetwork(
                        image:
                            image1,
                        //widthContainer: media.width*0.48,
                        heightContainer: media.height * 0.4656),
                  ),


                ],
              ),
              Transform.translate(
                offset: Offset(0, media.height * 0.15),
                child: Container(
                  height: media.height * 0.115,
                  // color: Colors.red,
                  child: Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        itemCount: listmenu.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  changebackground(index);
                                  print(price);
                                  // WidgetsUi().NavgetTo(
                                  //   context: context,
                                  //   back: false,
                                  //   route: HomePage(),
                                  // );
                                },
                                child: Container(
                                 // color: Colors.red,
                                  child: Column(
                                    children: [
                                      WidgetsUi().imagesvg(
                                        image: listmenu[index].image,
                                        height: media.height * 0.0493,
                                      ),
                                      WidgetsUi().SpaceUi(
                                          height: media.height*0.01
                                      ),
                                      Text(
                                        listmenu[index].name,
                                        style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0XFF636363)),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              WidgetsUi().SpaceUi(
                                  width: media.width*0.25
                              ),
                            ],
                          );

                        }),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }


}
