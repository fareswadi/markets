import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/menu.dart';

class Share {

  Padding RowAppbar(BuildContext context,Size media, {String title, bool istitle, }) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.bars,
                  color: Color(0xFFFFBD69),
                ),
                onPressed: () {
                  WidgetsUi().NavgetTo(context: context, back: true,route: Menu());
                },),
            istitle
                ? Text(
                    title,
                    style: GoogleFonts.arimaMadurai(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0XFFFFBD69)),
                  )
                : Container(),
            Stack(
              children: [
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.shoppingBag,
                      color: Color(0xFFFFBD69),
                    ),
                    onPressed: () {
                      WidgetsUi().NavgetTo(context: context, back: true,route: Menu());
                    },),
                Positioned(
                  right: media.width * 0.01,
                  child: Text(
                    '3',
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0XFFFF6363)),
                  ),
                )
              ],
            ),
          ],
        ));
  }
  bordercontainer(Size media,{Widget child}){
    return  WidgetsUi().ContainerBack(
        height: media.height * 0.90028,
        width: media.width,
        border: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      child: child
    );
  }
  Column ContainerMenu(Size media,{bool isdiscount,}) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
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
                            image:
                            'https://sweetcaramelsunday.com/wp-content/uploads/Boiled-Egg-Salad-A.jpg',
                            widthContainer: media.width * 0.283,
                            heightContainer: media.height * 0.1306,
                          ),
                        ),
                        WidgetsUi().SpaceUi(width: media.width * 0.025),
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
                            isdiscount?
                            Row(
                              children: [
                                Text(
                                  '\$15',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    decoration:TextDecoration.lineThrough ,
                                    color: Color(0XFF636363),
                                  ),
                                ),
                                WidgetsUi().SpaceUi(width: media.width*0.02),
                                Text(
                                  '\$10',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ):
                            Text(
                              '\$15',
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
                          icon: Icon(
                            Icons.favorite_border,
                            color: Color(0XFF636363),
                            size: 25,
                          ),
                          onPressed: () {},
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
  }
}
