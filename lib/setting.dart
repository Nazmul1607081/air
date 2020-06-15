import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white70,
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              height: 40,
              child: InkWell(
                onTap: () {
                  print("noti click");
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child:
                          Image(image: AssetImage("images/notification.png")),
                    ),
                    Expanded(flex: 1, child: Text("Notification")),
                    Container(
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/list.png")),
              name: "List Your AirDrop",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/homeicon.png")),
              name: "APBT Token",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/service.jpg")),
              name: "Our Service",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/faq.png")),
              name: "FAQ",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/support.png")),
              name: "Support",
            ),
            Divider(),
            Container(
              margin: EdgeInsets.all(5),
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Join our community",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/youtube.png")),
              name: "Youtube",
              link: "",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/talegram.jpg")),
              name: "Talegram",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/twitter.png")),
              name: "Twitter",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/facebook.png")),
              name: "Facebook",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/instagram.jpg")),
              name: "Instagram",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/share.png")),
              name: "Share with friends",
            ),
            Divider(),
            SingleRow(
              icon: Image(image: AssetImage("images/about.png")),
              name: "About",
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class SingleRow extends StatelessWidget {
  final icon;
  final name;
  final link;

  const SingleRow({Key key, this.icon, this.name, this.link}) : super(key: key);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 40,
      child: InkWell(
        onTap: () {
          print("clicked row");
          if (link != null) {
            _launchURL(link);
          }
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: icon,
            ),
            Text("$name"),
          ],
        ),
      ),
    );
  }
}

/*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 3,
          )),*/
