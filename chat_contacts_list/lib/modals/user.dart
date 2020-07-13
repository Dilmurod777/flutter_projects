class User {
  final int id;
  final String firstName;
  final String lastName;
  final String imgUrl;
  final DateTime lastActivityTime;
  final int popularity;
  final int likes;
  final List history;
  final bool isPinned;
  bool isOnline;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.imgUrl,
    this.lastActivityTime,
    this.popularity = 67,
    this.likes = 0,
    this.history,
    this.isPinned = false,
  }) {
    this.isOnline =
        DateTime.now().difference(this.lastActivityTime).inMinutes < 5;
  }
}
