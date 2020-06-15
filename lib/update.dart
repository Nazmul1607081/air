import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

String sms = "";
String updateTitle = "";
String updateDescription = "";

class _UpdateState extends State<Update> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpdateListView(),
    );
  }
}

class CustomUpdate extends StatelessWidget {
  final title;
  final description;

  const CustomUpdate({Key key, this.title, this.description}) : super(key: key);

  _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), border: Border.all(width: 3)),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
            ),
            overflow: TextOverflow.visible,
          ),
          Divider(
            height: 10,
          ),
          Linkify(
            textScaleFactor: 1.2,
            textAlign: TextAlign.justify,
            onOpen: _onOpen,
            text: description,
          ),
        ],
      ),
    );
  }
}

final databaseReference = Firestore.instance;

void getData() {
  print("get data called");
  databaseReference
      .collection("update")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) {
      print('${f.data}}');
      print(f.data['title']);
    });
  });
}

class UpdateListView extends StatefulWidget {
  @override
  _UpdateListViewState createState() => _UpdateListViewState();
}

class _UpdateListViewState extends State<UpdateListView> {
  void saveData() async {
    DocumentReference ref = await databaseReference.collection("sms").add({
      'sender': 'nazmul81csekuet@gmail.com',
      'description': "$sms",
      'time': DateTime.now()
    });
    print(ref.documentID);
    print("upload finished");

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Sent Successful"),
    ));

    /*Fluttertoast.showToast(
        msg: "Your massage sent successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        fontSize: 16.0);*/
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(5, 25, 5, 5),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  "If you have any update you can share it with us.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write your massage here',
                ),
                onChanged: (text) {
                  sms = text;
                  print("$sms");
                },
              ),
              Container(
                width: 80,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 3)),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    saveData();
                    print("$sms");
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('update').snapshots(),
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
                    return new CustomUpdate(
                      title: document['title'],
                      description: document['description'],
                    );
                  }).toList(),
                );
            }
          },
        )
      ],
    );
  }
}

//request.time < timestamp.date(2020, 7, 6)
