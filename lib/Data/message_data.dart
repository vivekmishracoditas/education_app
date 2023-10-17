class MessageData {
  String name;
  List<Message> messages;
  String profileImage;

  int unreadMessageCount() {
    int cnt = 0;
    for (var i = 0; i < messages.length; i++) {
      if (messages[i].isRead) {
        cnt++;
      }
    }
    return cnt;
  }

  MessageData({
    required this.name,
    required this.messages,
    required this.profileImage,
  });
}

class Message {
  String message;
  String time;
  bool isRead;

  Message({
    required this.message,
    required this.time,
    required this.isRead,
  });
}
