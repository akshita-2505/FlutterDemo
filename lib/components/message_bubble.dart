import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe, this.time});
  final String sender;
  final String text;
  final bool isMe;
  final time;

  msToTime(duration) {
    var minutes = (((duration+19800000)/(1000*60))%60).round();
    var hours = (((duration+19800000)/(1000*60*60*60))%24).round();

    hours = (hours < 10) ? '0$hours' : hours;
    minutes = (minutes < 10) ? '0$minutes' : minutes;
    return ('$hours:$minutes');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isMe ? Colors.red : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          Text(
            msToTime(time.millisecondsSinceEpoch),
            style: TextStyle(
                fontSize: 10.0,
                color: Colors.black54
            ),
          )
        ],
      ),
    );
  }
}