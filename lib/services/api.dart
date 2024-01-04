import 'dart:convert';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/models/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Movies>> getTopRated() async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['results'];
      List<Movies> moviesList =
          results.map((json) => Movies.fromjson(json)).toList();
      return moviesList;
    } else {
      throw Exception('there is error ${response.statusCode}');
    }
  }

  Future<List<Movies>> getUpComing() async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/movie/upcoming?$apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['results'];
      List<Movies> moviesList =
          results.map((json) => Movies.fromjson(json)).toList();
      return moviesList;
    } else {
      throw Exception('there is error ${response.statusCode}');
    }
  }

  Future<List<Movies>> getPopular() async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/movie/popular?$apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['results'];
      List<Movies> moviesList =
          results.map((json) => Movies.fromjson(json)).toList();
      return moviesList;
    } else {
      throw Exception('there is error ${response.statusCode}');
    }
  }

  Future<List<Movies>> getTrending() async {
    http.Response response =
        await http.get(Uri.parse('$baseUrl/trending/movie/day?$apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['results'];
      List<Movies> moviesList =
          results.map((json) => Movies.fromjson(json)).toList();
      return moviesList;
    } else {
      throw Exception('there is error ${response.statusCode}');
    }
  }

  Future<List<Cast>> getCastList(int movieid) async {
    try {
      http.Response response =
          await http.get(Uri.parse('$baseUrl/movie/$movieid/credits?$apiKey'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> results = data['cast'];
        List<Cast> castList =
            results.map((json) => Cast.fromJson(json)).toList();
        return castList;
      } else {
        throw Exception('there is error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('failed :$e');
    }
  }

  Future<List<Movies>> getSearch(String query) async {
    try {
      // we encode query because it's can contain sumpols or character
      String encodedQuery = Uri.encodeComponent(query);
      http.Response response = await http
          .get(Uri.parse('$baseUrl/search/movie?$apiKey&query=$encodedQuery'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> results = data['results'];
        List<Movies> moviesList =
            results.map((json) => Movies.fromjson(json)).toList();
        return moviesList;
      } else {
        throw Exception('There is an error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }

  Future<String> getYouTube(int movieid) async {
    try {
      http.Response response =
          await http.get(Uri.parse('$baseUrl/movie/$movieid/videos?$apiKey'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'];
        if (data.isNotEmpty) {
          final videoKey = data[0]['key'];
          if (videoKey != null) {
            String movieTrailer = '$youtubebaseurl$videoKey';
            return movieTrailer;
          } else {
            throw Exception('No video key found for the movie');
          }
        } else {
          throw Exception('No video found for the movie');
        }
      } else {
        throw Exception('Failed to fetch videos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch videos: $e');
    }
  }
}
/*Future<String> getYouTube(int movieid) async {
    try {
      http.Response response =
          await http.get(Uri.parse('$baseUrl/movie/$movieid/videos?$apiKey'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'];
        if (data.isNotEmpty) {
          final videoKey = data[0]['key'] ?? 'PoF4B_xPVlg';
          String movieTrailer = '$youtubebaseurl$videoKey';
          return movieTrailer;
        } else {
          throw Exception('No video found for the movie');
        }
      } else {
        throw Exception('Failed to fetch videos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch videos: $e');
    }
  } */