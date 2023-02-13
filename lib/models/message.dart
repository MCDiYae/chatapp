import '../costum.dart';

class Message {
  final String textmessage;
  Message(this.textmessage);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[keyMessage]);
  }
}
