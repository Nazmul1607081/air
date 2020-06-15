import 'package:airdropbazarfinal/instruction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:airdropbazarfinal/youtubevideoplayer.dart';

const icon_size = 5.0;

class DetailsAirDrop extends StatelessWidget {
  final name;
  final information;
  final instruction;
  final video_link;
  final whitepaper_link;
  final website_link;
  final join_link;

  const DetailsAirDrop(
      {Key key,
      this.information,
      this.instruction,
      this.video_link,
      this.whitepaper_link,
      this.website_link,
      this.join_link,
      this.name})
      : super(key: key);
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.indigo,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            name,
            style: TextStyle(color: Colors.indigo),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Project Information",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                information,
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Instruction",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ),
            Instructions(
              instruction_no: instruction,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Video",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ),
            Container(
                height: 200,
                width: 100,
                padding: EdgeInsets.all(10),
                child: MyYoutubePlayer(
                  video_link: video_link,
                )
                // Container() // ,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(5))),
                  height: 50,
                  width: 140,
                  child: FlatButton(
                    child: Center(
                      child: Text(
                        "WhitePaper",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      _launchURL(whitepaper_link);
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(5))),
                  child: FlatButton(
                    child: Center(
                      child: Text(
                        "Website",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      _launchURL(website_link);
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              color: Colors.indigo,
              child: FlatButton(
                child: Center(
                  child: Text(
                    "Join AirDrop",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {
                  print("join now");
                  _launchURL(join_link);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image: AssetImage("images/facebook.png")),
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image: AssetImage("images/twitter.png")),
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image: AssetImage("images/talegram.jpg")),
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image: AssetImage("images/instagram.jpg")),
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image: AssetImage("images/youtube.png")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
