import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/bloc/CubitsHome.dart';
import 'package:markets/bloc/StateCubitsHome.dart';
import 'package:markets/shareWidget.dart';
class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override

  Widget build(BuildContext context) {
    var media=MediaQuery.of(context).size;
    return BlocConsumer<CubitsHome,HomeState>(
      listener: (context, state){},
      builder:(context, state) {
        var cubitvar=CubitsHome.getitem(context);
        return Scaffold(

        body: Stack(
          children: [

            Share().bordercontainer(media,
            child:  FutureBuilder(
              future:cubitvar.PrivteLove('P2rJ0RyBMSV7ZjstXa2W2TrI2Mw1') ,
              builder:(context, snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemBuilder: (context, index){
                      var basic=snapshot.data.docs[index].data();

                          return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          WidgetsUi().SpaceUi(height: media.height*0.052),

                          Center(
                            child: Stack(
                              children: [
                                WidgetsUi().ContainerImagenetwork(
                                    image: basic['image'],
                                    heightContainer: media.height * 0.222,
                                    widthContainer: media.width*0.48
                                ),
                                buildAddIcon(media)
                              ],
                            ),
                          ),
                          WidgetsUi().SpaceUi(height: media.height*0.026),
                          Text(basic['name'],style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white,
                          ),),
                          WidgetsUi().SpaceUi(height: media.height*0.007),
                          Text('\$${basic['price']}',style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0XFF636363),
                          ),),
                          WidgetsUi().SpaceUi(height: media.height*0.053),
                        ],
                      );
                    },
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                  );
                }else{
                  Center(
                    child: Text('no data'),
                  );

                }
                return Text('found some of error');
              },
            ),
            ),

           Share().RowAppbar(context,media,istitle: true,title: 'favourite',),


          ],
        ),
      );
      },
    );
  }

   buildAddIcon(Size media) {
    return Transform.translate(
      offset: Offset(media.width*0.31,media.height*0.158),
      child: Container(
                  height: media.height*0.071,
                  width: media.width*0.134,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFFFF6363),
                        Color(0XFFFF9066),
                        Color(0XFFFFBD69),
                      ],
                      stops: [
                        0.3,
                        0.6,
                        0.9,
                      ]
                    )
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.add,
                      color: Colors.white,),
                      iconSize: 30,
                      onPressed: (){},
                    ),
                  ),
                ),
    );
  }
}
