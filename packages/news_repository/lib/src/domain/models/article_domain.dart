import 'package:equatable/equatable.dart';

class ArticleDomain extends Equatable {
  const ArticleDomain({
    required this.title,
    required this.description,
    required this.source,
    required this.url,
    required this.imageUrl,
    required this.content,
    required this.dateTime,
  });

  final String title;
  final String? description;
  final String source;
  final String url;
  final String? imageUrl;
  final String? content;
  final DateTime dateTime;

  @override
  List<Object?> get props => [
        title,
        description,
        source,
        url,
        imageUrl,
        content,
        dateTime,
      ];
}
