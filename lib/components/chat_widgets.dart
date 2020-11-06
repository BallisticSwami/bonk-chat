import 'package:bonk_chat/utilities/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bonk_chat/screens/chat_screen.dart';

GlobalKey<_ChatListViewBuilderState> globalKey = GlobalKey();

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class ChatListViewBuilder extends StatefulWidget {
  ChatListViewBuilder({@required this.messages, Key key}) : super(key: key);

  final List<QueryDocumentSnapshot> messages;

  @override
  _ChatListViewBuilderState createState() => _ChatListViewBuilderState();
}

class _ChatListViewBuilderState extends State<ChatListViewBuilder> {
  ScrollController messagesListController;

  void animateToListEnd() {
    messagesListController.animateTo(
      messagesListController.position.maxScrollExtent,
      duration: Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    super.initState();
    messagesListController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        reverse: true,
        controller: messagesListController,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 6,
            vertical: SizeConfig.safeBlockVertical * 3),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.messages.length,
        itemBuilder: (context, index) {
          return MessageBubble(
              isMe:
                  widget.messages[index].data()['sender'] == loggedInUser.email,
              sender: widget.messages[index].data()['sender'],
              text: widget.messages[index].data()['text'],
              time: widget.messages[index].data()['time'] as Timestamp,
              );
        },
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {@required this.sender,
      @required this.text,
      @required this.isMe,
      @required this.time});

  final String sender;
  final String text;
  final bool isMe;
  final Timestamp time;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          isMe
              ? SizedBox()
              : (Text(
                  sender,
                  style: TextStyle(
                      color: Colors.deepPurple[900].withOpacity(0.4),
                      fontSize: SizeConfig.safeBlockHorizontal * 3.4),
                )),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 0.4,
          ),
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 4),
              bottomRight: Radius.circular(SizeConfig.safeBlockHorizontal * 4),
              topLeft: Radius.circular(isMe
                  ? SizeConfig.safeBlockHorizontal * 4
                  : SizeConfig.safeBlockHorizontal * 1),
              topRight: Radius.circular(isMe
                  ? SizeConfig.safeBlockHorizontal * 1
                  : SizeConfig.safeBlockHorizontal * 4),
            ),
            color: isMe ? Color(0xffEDEEF7) : Color(0xffF7F7F8),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4.1,
                    color: isMe ? Colors.purple[900] : Color(0xff584a75)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
