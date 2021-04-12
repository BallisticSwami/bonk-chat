import 'package:bonk_chat/utilities/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/screens/main_screen.dart';
import 'package:random_color/random_color.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print('no data');
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var messages = snapshot.data.docs.reversed.toList();
        print('got data');
        return ConvoListView(messages: messages);
      },
    );
  }
}

class ConvoListView extends StatefulWidget {
  ConvoListView({@required this.messages});
  final List<QueryDocumentSnapshot> messages;

  @override
  ConvoListViewState createState() => ConvoListViewState();
}

class ConvoListViewState extends State<ConvoListView> {
  static String getLatestMessage(
      List<QueryDocumentSnapshot> messages, String sender) {
    String msg;
    for (var message in messages) {
      if (sender == message.data()['sender'] &&
          message.data()['receiver'] == _auth.currentUser.email) {
        msg = message.data()['text'];
      }
    }
    return msg;
  }

  static DateTime getLatestMessageTime(
      List<QueryDocumentSnapshot> messages, String sender) {
    Timestamp time;
    for (var message in messages) {
      if (sender == message.data()['sender'] &&
          message.data()['receiver'] == _auth.currentUser.email) {
        time = message.data()['time'];
      }
    }
    return DateTime.parse(time.toDate().toString());
  }

  List<String> getSenderList(List<QueryDocumentSnapshot> messages) {
    List<String> senders = [];
    for (var message in messages) {
      if (!senders.contains(message.data()['sender'])) {
        senders.add(message.data()['sender']);
      }
    }
    return senders;
  }

  @override
  Widget build(BuildContext context) {
    List<String> senders = getSenderList(widget.messages);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: senders.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SenderAvatar(
            email: senders[index],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                senders[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                  '${getLatestMessageTime(widget.messages, senders[index]).hour}:${getLatestMessageTime(widget.messages, senders[index]).minute}', style: TextStyle(color: Colors.grey[350], fontSize: SizeConfig.safeBlockHorizontal*3.2, fontWeight: FontWeight.w500),),
            ],
          ),
          subtitle: Text(
            getLatestMessage(widget.messages, senders[index]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}

class SenderAvatar extends StatelessWidget {
  SenderAvatar({@required this.email});
  final RandomColor _randomColor = RandomColor();
  final String email;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CircleAvatar(
      radius: SizeConfig.safeBlockHorizontal * 8,
      backgroundColor:
          _randomColor.randomColor(colorBrightness: ColorBrightness.light),
      child: Text(
        email.substring(0, 1).toUpperCase(),
        style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.safeBlockHorizontal * 6),
      ),
    );
  }
}
