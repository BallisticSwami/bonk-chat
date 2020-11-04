import 'package:bonk_chat/utilities/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatListViewBuilder extends StatefulWidget {

  ChatListViewBuilder({@required this.messages, @required this.child});

  final Widget child;
  final List<QueryDocumentSnapshot> messages;
  @override
  _ChatListViewBuilderState createState() => _ChatListViewBuilderState();
}

class _ChatListViewBuilderState extends State<ChatListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 6,
                        vertical: SizeConfig.safeBlockVertical*3),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.messages.length,
                    itemBuilder: (context, index) {
                      return Text(
                        '${widget.messages[index].data()['text']} from ${widget.messages[index].data()['sender']}',
                        style: TextStyle(fontSize: 20),
                      );
                    },
                  );
  }
}