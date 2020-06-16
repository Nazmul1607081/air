import 'package:airdropbazarfinal/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:airdropbazarfinal/airdrop.dart';

import 'package:airdropbazarfinal/airdrop1.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:admob_flutter/admob_flutter.dart';

String url = "";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Firestore firestore = Firestore.instance;
  Future<QuerySnapshot> getImages() {
    print("inside get data");
    return firestore.collection("update").getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //Slider
        Container(
          height: 250,
          child: FullscreenSliderDemo(),
        ),
        // Last Update
        Container(
          color: Colors.white30,
          //color: Colors.black54,
          height: 40,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
                //color: Colors.pink,
              ),
              child: Text(
                "Latest Update",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: AdMob(),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('airdrop').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return new ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new AirDrop(
                      day: document['days'],
                      name: document['name'],
                      cost: document['cost'],
                      rating: document['rating'],
                      image: document['image'],
                      information: document['information'],
                      instruction: document['instruction'],
                      video_link: document['video_link'],
                      whitepaper_link: document['whitepaper_link'],
                      website_link: document['website_link'],
                      join_link: document['join_link'],
                    );
                  }).toList(),
                );
            }
          },
        ),
        //airdrop
      ],
    );
  }
}

final List<String> imgList = [
  'images/banner1.jpg',
  'images/banner2.png',
];

class FullscreenSliderDemo extends StatelessWidget {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
            ),
            items: imgList
                .map((item) => Container(
                      child: InkWell(
                          onTap: () {
                            print(item);
                            if (item == "images/banner1.jpg") {
                              print("1");
                              _launchURL(
                                  "https://share.trustwallet.com/IrSrac");
                            } else {
                              print("2");
                              _launchURL("https://brave.com/air363");
                            }
                          },
                          child: Image.asset(
                            item,
                            fit: BoxFit.fill,
                            height: height,
                          )),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
