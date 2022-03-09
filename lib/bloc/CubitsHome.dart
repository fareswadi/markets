import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markets/itemsNav/favourite.dart';
import 'package:markets/itemsNav/primaryHome.dart';
import 'package:markets/itemsNav/search.dart';
import 'package:markets/models/foodModel.dart';
import 'package:markets/tabs/account.dart';

import 'StateCubitsHome.dart';

class CubitsHome extends Cubit<HomeState> {
  CubitsHome() : super(InitalState());

  static CubitsHome getitem(context) => BlocProvider.of(context);
  int indexSelected = 0;
  List<Widget> widgetOptions = [
    PrimaryHome(),
    Favourite(),
   Account(),
    Search(),
  ];

  changeIndex(int index) {
    indexSelected = index;
    emit(changeBottomNav());
  }

  var catograyfilter = '';
  var catograyid = 0;

  changefilter(String title, int id) {
    catograyfilter = title;
    catograyid = id;

    emit(ChangeFilterState());
  }

  var cuisinefilter = '';
  var cuisineid = 0;

  changecuisinefilter(String title, int id) {
    cuisinefilter = title;
    cuisineid = id;

    emit(ChangeCuisineFilterState());
  }

  RangeValues price = const RangeValues(20, 60);
  double min = 0.0;
  double max = 100.0;

  changeSliderFilter(values) {
    price = values;
    emit(ChangePriceFilterState());
  }

  changeStartSlider(double minid) {
    min = minid;
    emit(ChangePriceStartState());
  }

  changeEndSlider(double maxid) {
    max = maxid;
    emit(ChangePriceEndState());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> discount(String title,
      String doc) {
    //emit(Discountstate());
    return FirebaseFirestore.instance
        .collection('types2')
        .doc('Rs3UqU9iQJOjQbBpS6dZ')
        .collection(title)
        .where('discount', isGreaterThan: 0)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> popular(String title,
      String doc) {
    //emit(Popularstate());
    return FirebaseFirestore.instance
        .collection('types2')
        .doc('Rs3UqU9iQJOjQbBpS6dZ')
        .collection(title)
        .where('ispopular', isEqualTo: true)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> allmenu(String title, String userId) {
     FirebaseFirestore.instance
        .collection('types2')
        .doc('Rs3UqU9iQJOjQbBpS6dZ')
        .collection(title)
        .get().then((value) {
          value.docs.forEach((element) {
            allmenu2(title, element.id, userId);
          });
    });
     return FirebaseFirestore.instance
         .collection('types2')
         .doc('Rs3UqU9iQJOjQbBpS6dZ')
         .collection(title)
         .get();
  }

  allmenu2(String title, String id, String userId) async {
    print(id.toString() + ' lolol');
    return await FirebaseFirestore.instance
        .collection('types2')
        .doc('Rs3UqU9iQJOjQbBpS6dZ')
        .collection(title).doc(id).collection('love').doc('$userId\_$id')
        .get().then((value) {
      value.data()['love'] == true ?
      FirebaseFirestore.instance
          .collection('types2')
          .doc('Rs3UqU9iQJOjQbBpS6dZ')
          .collection(title)
          .doc(id)
          .update({'love': true}) :
      FirebaseFirestore.instance
          .collection('types2')
          .doc('Rs3UqU9iQJOjQbBpS6dZ')
          .collection(title)
          .doc(id)
          .update({'love': false});
    });
  }


  // bool bothyes;
  // Future<bool> transLove2({String id, String userid}) async {
  //   bool both;
  //   await FirebaseFirestore.instance
  //       .collection('mylove').
  //   where('id', isEqualTo: id).
  //   where('userId', isEqualTo: userid)
  //       .get().then((value) {
  //     value.docs.forEach((element) {
  //       print(element.data()['id'].toString() + ' 333');
  //       print(element.data()['userId'].toString() + ' 444');
  //
  //       if (element.data()['id'] != null && element.data()['userId'] != null) {
  //         both = true;
  //         return Future<bool>.value(true);
  //       } else {
  //         both = false;
  //         return Future<bool>.value(false);
  //       }
  //       print(both.toString() + ' 666');
  //     });
  //   });
  // }

  Future<QuerySnapshot<Map<String, dynamic>>> PrivteLove(String userId){
    return FirebaseFirestore.instance.collection('mylove')
        .where('userId' , isEqualTo:userId ).
         get();
 }

  // Stream<QuerySnapshot<Map<String, dynamic>>>
 buildSnapshots(String current) async{
    return  FirebaseFirestore.instance
        .collection('types2')
        .doc('Rs3UqU9iQJOjQbBpS6dZ')
        .collection('salad')
        .where('name',
        isEqualTo: current)
        .get();
  }
  // transLove(String title, String doc) async {
  //   await FirebaseFirestore.instance
  //       .collection('types2')
  //       .doc('Rs3UqU9iQJOjQbBpS6dZ')
  //       .collection(title)
  //       .get()
  //       .then((value) async {
  //     print(value.size);
  //     value.docs.forEach((element) async {
  //       var yeslove = await FirebaseFirestore.instance
  //           .collection('types2')
  //           .doc('Rs3UqU9iQJOjQbBpS6dZ')
  //           .collection(title)
  //           .doc(element.id)
  //           .collection('love')
  //           .doc('P2rJ0RyBMSV7ZjstXa2W2TrI2Mw1_${element.id}')
  //           .get()
  //           .then((value) async {
  //         FirebaseFirestore.instance
  //             .collection('types2')
  //             .doc('Rs3UqU9iQJOjQbBpS6dZ')
  //             .collection(title)
  //             .doc(element.id)
  //             .update({'love': value.data()['love']});
  //       });
  //     });
  //   });
  //   // emit(transLoveState());
  // }

  addfavrite(String title, String id, bool love) async {
    print(id);
    print(love);
    await FirebaseFirestore.instance
        .collection('types2')
        .doc('Rs3UqU9iQJOjQbBpS6dZ')
        .collection(title)
        .doc(id)
        .update({'love': love});
    await FirebaseFirestore.instance
        .collection('types2')
        .doc('Rs3UqU9iQJOjQbBpS6dZ')
        .collection(title)
        .doc(id)
        .collection('love')
        .doc('P2rJ0RyBMSV7ZjstXa2W2TrI2Mw1_${id}')
        .set({'love': love});
      emit(addLoveState());
  }

//P2rJ0RyBMSV7ZjstXa2W2TrI2Mw1
  addtolistLove(
      {String image, String name, int price, String id, String userid}) async {
    await FirebaseFirestore.instance
        .collection('mylove')
        .add({
      'image': image,
      'name': name,
      'price': price,
      'id': id,
      'userId': userid,
    });
      emit(addListState());
    print('add......');

  }

  removetolistLove({String id, String userid}) async {
    print(id);
    await FirebaseFirestore.instance
        .collection('mylove')
        .where('id', isEqualTo: id).
    where('userId', isEqualTo: userid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.delete();
        print(element.id);
      });
    });
    emit(removeListState());
    print('remve.......');
  }

}