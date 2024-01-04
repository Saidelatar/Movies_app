import 'package:movies_app/constants.dart';

class Movies {
  final String? backdropPath;
  final String? title;
  final String? desc;
  final String popularity;
  final String vote;
  final String? poster;
  final int id;

  Movies({
    required this.backdropPath,
    required this.title,
    required this.desc,
    required this.popularity,
    required this.vote,
    required this.poster,
    required this.id,
  });

  factory Movies.fromjson(dynamic jsonData) {
    return Movies(
      backdropPath: '$imageUrlBase${jsonData['backdrop_path']}',
      title: jsonData['original_title'],
      desc: jsonData['overview'],
      popularity: jsonData['popularity'].toString(),
      vote: jsonData['vote_count'].toString(),
      poster: jsonData['poster_path'] != null
          ? '$imageUrlBase${jsonData['poster_path']}'
          : '',
      id: jsonData['id'],
    );
  }
}
