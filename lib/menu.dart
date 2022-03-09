import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markets/Compents/widgetsUI.dart';
import 'package:markets/detailsMenu.dart';
import 'package:markets/models/menuModel.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    // final Dio dio = Dio();
    // bool loading = false;
    // double progress = 0;

    // Future<bool> saveVideo(String url, String fileName) async {
    //   Directory directory;
    //   try {
    //     if (Platform.isAndroid) {
    //       if (await _requestPermission(Permission.storage)) {
    //         directory = await getExternalStorageDirectory();
    //         String newPath = "";
    //         print(directory);
    //         List<String> paths = directory.path.split("/");
    //         for (int x = 1; x < paths.length; x++) {
    //           String folder = paths[x];
    //           if (folder != "Android") {
    //             newPath += "/" + folder;
    //           } else {
    //             break;
    //           }
    //         }
    //         newPath = newPath + "/RPSApp";
    //         directory = Directory(newPath);
    //       } else {
    //         return false;
    //       }
    //     } else {
    //       if (await _requestPermission(Permission.photos)) {
    //         directory = await getTemporaryDirectory();
    //       } else {
    //         return false;
    //       }
    //     }
    //     File saveFile = File(directory.path + "/$fileName");
    //     if (!await directory.exists()) {
    //       await directory.create(recursive: true);
    //     }
    //     if (await directory.exists()) {
    //       await dio.download(url, saveFile.path,
    //           onReceiveProgress: (value1, value2) {
    //             setState(() {
    //               progress = value1 / value2;
    //             });
    //           });
    //       if (Platform.isIOS) {
    //         await ImageGallerySaver.saveFile(saveFile.path,
    //             isReturnPathOfIOS: true);
    //       }
    //       return true;
    //     }
    //     return false;
    //   } catch (e) {
    //     print(e);
    //     return false;
    //   }
    // }
    //
    // Future<bool> _requestPermission(Permission permission) async {
    //   if (await permission.isGranted) {
    //     return true;
    //   } else {
    //     var result = await permission.request();
    //     if (result == PermissionStatus.granted) {
    //       return true;
    //     }
    //   }
    //   return false;
    // }
    //
    // downloadFile() async {
    //   setState(() {
    //     loading = true;
    //     progress = 0;
    //   });
    //   bool downloaded = await saveVideo(
    //       "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
    //       "video.mp4");
    //   if (downloaded) {
    //     print("File Downloaded");
    //   } else {
    //     print("Problem Downloading File");
    //   }
    //   setState(() {
    //     loading = false;
    //   });
    // }

    List<MenuModel> listmenu = [
      MenuModel(image: 'assets/images/menu3.svg', name: 'salad'
         // ,iddoc: '4MEyVphs6e6wa2L7yABo'
      ),
      MenuModel(image: 'assets/images/menu1.svg', name: 'spaghetti',iddoc: 'zZAnG1lIWJQBf9tfxz9w'),
      MenuModel(image: 'assets/images/menu3.svg', name: 'chicken'),
      MenuModel(image: 'assets/images/menu1.svg', name: 'sweet'),
      MenuModel(image: 'assets/images/menu1.svg', name: 'fish'),
      MenuModel(image: 'assets/images/menu3.svg', name: 'chicken'),
      MenuModel(image: 'assets/images/menu6.svg', name: 'sweet'),
      MenuModel(image: 'assets/images/menu7.svg', name: 'fish'),
    ];
    return Scaffold(
      body: Stack(
        children: [
          WidgetsUi().ContainerBack(
              child: Padding(
            padding:
                const EdgeInsets.only(top: 60, right: 12, left: 12, bottom: 12),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: listmenu.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return elementGrid(media, listmenu, index);
                }),
          )),
          RowAppbar(media, title: 'Menu'),
        ],
      ),
    );
  }

  elementGrid(Size media, List<MenuModel> listmenu, int index) {
    return InkWell(
      onTap: () {
        print(listmenu[index].iddoc);
        WidgetsUi()
            .NavgetTo(route: DetailsMenu(title: listmenu[index].name,doc:listmenu[index].iddoc ,), context: context, back: true);
      },
      child: Container(
        height: media.height * 0.1983,
        width: media.width * 0.43,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 52,
            bottom: 33,
            right: 40,
            left: 40,
          ),
          child: Column(
            children: [
              WidgetsUi().imagesvg(
                image: listmenu[index].image,
                width: media.width * 0.214,
                height: media.height * 0.0702,
              ),
              WidgetsUi().SpaceUi(height: media.height * 0.014),
              Text(
                listmenu[index].name,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0XFF141416),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
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
              onPressed: () {}),
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
