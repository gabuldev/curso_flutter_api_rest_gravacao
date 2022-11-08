import 'author.dart';

class Post {
  final String title;
  final List<String> tags;
  final String readTime;
  final String photoUrl;
  final bool hasReadLater;
  final Author author;
  Post({
    required this.title,
    required this.tags,
    required this.readTime,
    required this.photoUrl,
    required this.hasReadLater,
    required this.author,
  });
}
