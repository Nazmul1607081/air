import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



const icon_size = 5.0;
class DetailsAirDrop1 extends StatefulWidget {
  @override
  _DetailsAirDrop1State createState() => _DetailsAirDrop1State();
}

class _DetailsAirDrop1State extends State<DetailsAirDrop1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Text("Project Information",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("this is the Project Information.this is the Project Information. this is the Project Information.this is the Project Information",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,

                ),
                overflow: TextOverflow.visible ,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text("Instruction",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("this is the Project Information.this is the Project Information. this is the Project Information.this is the Project Information",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,

                ),
                overflow: TextOverflow.visible ,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text("Video",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset("images/airdrop1.jpeg")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(5))
                  ),
                  height: 50,
                  width: 140,
                  child: FlatButton(
                    child: Center(
                      child: Text("WhitePaper",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white
                        ),
                      ),
                    ), onPressed: () {},
                  ),

                ),
                Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(5))
                  ),
                  child: FlatButton(
                    child: Center(
                      child: Text("Website",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white
                        ),
                      ),
                    ), onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              color: Colors.indigo,
              child:FlatButton(
                child: Center(

                  child: Text("Join AirDrop",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white
                    ),
                  ),
                ), onPressed: () {
                print("join now");
              },
              ) ,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image:AssetImage("images/facebook.png")),
                ),
                IconButton(onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image:AssetImage("images/twitter.png")),
                ),IconButton(onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image:AssetImage("images/talegram.jpg")),
                ),IconButton(onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image:AssetImage("images/instagram.jpg")),
                ),IconButton(onPressed: () {},
                  iconSize: icon_size,
                  icon: Image(image:AssetImage("images/youtube.png")),
                ),



              ],
            )
          ],
        ),
      ),
    );
  }
}

