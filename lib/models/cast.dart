import 'package:movies_app/constants.dart';

class Cast {
  final String name;
  final String character;
  final String? profilePath; // Updated to use a nullable String
  final String popularity;

  Cast({
    required this.name,
    required this.character,
    required this.profilePath,
    required this.popularity,
  });

  factory Cast.fromJson(dynamic jsonData) {
    return Cast(
      name: jsonData['name'],
      character: jsonData['character'],
      profilePath: jsonData['profile_path'] != null
          ? '$imageUrlBase${jsonData['profile_path']}'
          : null,
      popularity: jsonData['popularity'].toString(),
    );
  }
}
