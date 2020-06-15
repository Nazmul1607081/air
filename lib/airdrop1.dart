import 'package:flutter/material.dart';
import 'package:airdropbazarfinal/detailsairdrop1.dart';

class AirDrop1 extends StatefulWidget {
  @override
  _AirDrop1State createState() => _AirDrop1State();
}

class _AirDrop1State extends State<AirDrop1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(4)),
      //color: Colors.black54,
      child: Card(
        margin: EdgeInsets.all(0),
        //color: Colors.black26,
        child: ListTile(
          onTap: () {
            print("go details1");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsAirDrop1();
            }));
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Image(
                    image: AssetImage("images/airdrop2.jpeg"),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Card(
                      child: Text(
                    "22 days",
                    style: TextStyle(),
                  )))
            ],
          ),
          title: Text(
            '3WM',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.amberAccent,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ImageIcon(
                    AssetImage("images/takaicon.png"),
                  ),
                  Text(
                    " 15.5\$+",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          trailing: Container(
              height: 900,
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: 20,
                        width: 40,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.black,
                          icon: Image(image: AssetImage("images/talegram.jpg")),
                          onPressed: () {
                            print("ok");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: 20,
                        width: 40,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.black,
                          icon: Image(image: AssetImage("images/facebook.png")),
                          onPressed: () {
                            print("ok");
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: 20,
                        width: 40,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.black,
                          icon: Image(image: AssetImage("images/twitter.png")),
                          onPressed: () {
                            print("ok");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: 20,
                        width: 40,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.black,
                          icon: Image(image: AssetImage("images/youtube.png")),
                          onPressed: () {
                            print("ok");
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          isThreeLine: true,
        ),
      ),
    );
  }
}
