import 'package:airdropbazarfinal/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

int i = 0;

class HotAirDrop extends StatefulWidget {
  @override
  _HotAirDropState createState() => _HotAirDropState();
}

class _HotAirDropState extends State<HotAirDrop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('hotair').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length *
                      2, //snapshot.data.documents.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data.documents[i];
                    int len = snapshot.data.documents.length;
                    if (index % 2 == 0) {
                      i++;
                      i = (i % len);

                      return SingleHotAir(
                        image: document['image'],
                        link: document['link'],
                      );
                    } else {
                      return Divider();
                    }
                  });
          }
        },
      )),
    );
  }
}

class SingleHotAir extends StatelessWidget {
  final image;
  final link;

  const SingleHotAir({Key key, this.image, this.link}) : super(key: key);
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("inkwell");
        _launchURL(link);
      },
      child: Container(
        height: 180,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: new Image(
          fit: BoxFit.cover,
          image: new CachedNetworkImageProvider(image),
        ),
      ),
    );
  }
}

// "https://img.techpowerup.org/200611/banner1.jpg",

/*InkWell(
          onTap: () {
            print("inkwell");
            _launchURL(link);
          },
          child: Container(
            height: 180,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: new Image(
              fit: BoxFit.cover,
              image: new CachedNetworkImageProvider(image),
            ),
          ),
        )*/
