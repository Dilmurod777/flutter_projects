class Message {
  final String text;
  final int authorId;
  final DateTime time;
  final bool isRead;

  Message({this.text, this.authorId, this.time, this.isRead = false});
}
