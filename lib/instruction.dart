import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Instructions extends StatefulWidget {
  final instruction_no;

  const Instructions({Key key, this.instruction_no}) : super(key: key);
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection(widget.instruction_no)
          .orderBy('sno', descending: false)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                return new SingleInstruction(
                  instruction: document[widget.instruction_no],
                );
              }).toList(),
            );
        }
      },
    );
  }
}

class SingleInstruction extends StatelessWidget {
  final instruction;

  const SingleInstruction({Key key, this.instruction}) : super(key: key);

  _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4),
        //color: Colors.pink,
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Linkify(
          textAlign: TextAlign.justify,
          onOpen: _onOpen,
          text: instruction,
        ),
      ),
    );
  }
}
