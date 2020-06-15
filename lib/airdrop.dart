import 'package:airdropbazarfinal/detailsaidrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

String url = "";

class AirDrop extends StatelessWidget {
  final day;
  final name;
  final cost;
  final rating;
  final image;
  final information;
  final instruction;
  final video_link;

  final whitepaper_link;
  final website_link;
  final join_link;

  const AirDrop(
      {Key key,
      this.day,
      this.name,
      this.cost,
      this.rating,
      this.image,
      this.information,
      this.instruction,
      this.video_link,
      this.whitepaper_link,
      this.website_link,
      this.join_link})
      : super(key: key);

  Future<void> getingUrl() async {
    print("getigurl called");
    for (int i = 0; i < 5; i++) {
      print(url);
    }
    print("ok");
  }

  @override
  Widget build(BuildContext context) {
    //print("buid mathod called");
    //getingUrl();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white30,
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
            //////////////go to details page/////////////
            print("go details");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsAirDrop(
                information: information,
                instruction: instruction,
                video_link: video_link,
                whitepaper_link: whitepaper_link,
                website_link: website_link,
                join_link: join_link,
                name: name,
              );
            }));
          },
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  height: 20,
                  width: 20,
                  child: new Image(
                    image: new CachedNetworkImageProvider(image),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Card(
                      child: Text(
                    "$day days",
                    style: TextStyle(),
                  )))
            ],
          ),
          title: Text(
            '$name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: <Widget>[
              RatingBar(
                ignoreGestures: true,
                itemSize: 20,
                initialRating: double.parse(rating),
                onRatingUpdate: (double value) {
                  print(value);
                },
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              Row(
                children: <Widget>[
                  ImageIcon(
                    AssetImage("images/takaicon.png"),
                  ),
                  Text(
                    " $cost\$+",
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
                          icon: Image(image: AssetImage("images/gmail.png")),
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
