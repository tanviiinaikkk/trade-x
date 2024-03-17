import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BannerWidget extends StatefulWidget {
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List _bannerImage = [];

  getBanners(){
    return _firestore
        .collection('banners')
        .get()
        .then((QuerySnapshot querySnapshot) {
         querySnapshot.docs.forEach((doc) {
           setState(() {
             _bannerImage.add(doc['image']);
           });
         });
        }  );
  }

  void initState(){
    super.initState();
    getBanners();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.yellow.shade900,
        borderRadius: BorderRadius.circular(10),
      ),

      child: PageView.builder(
        itemCount: _bannerImage.length,
          itemBuilder: (context,index){
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: _bannerImage[index] ,
            placeholder: (context, url) => Shimmer(
              duration: Duration(seconds: 10), //Default value
              interval: Duration(seconds: 10), //Default value: Duration(seconds: 0)
              color: Colors.white, //Default value
              colorOpacity: 0, //Default value
              enabled: true, //Default value
              direction: ShimmerDirection.fromLTRB(),  //Default Value
              child: Container(
                color: Colors.orangeAccent,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
          )
        );
      })
    );
  }
}
