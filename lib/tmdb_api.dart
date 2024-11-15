import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDbApi {
  static const String apiKey = 'e547e17d4e91f3e62a571655cd1ccaff';  
  static const String baseUrl = 'https://api.themoviedb.org/3';


  static Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/movie?api_key=$apiKey&query=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List movies = data['results'];
      return movies.map((movie) => {
        'id': movie['id'],
        'title': movie['title'],
        'imageUrl': 'https://image.tmdb.org/t/p/w500' + movie['poster_path'],
        'overview': movie['overview'],
        'releaseDate': movie['release_date'],
        'rating': movie['vote_average'].toString(),
      }).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

 
  static Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {
        'title': data['title'],
        'overview': data['overview'],
        'releaseDate': data['release_date'],
        'rating': data['vote_average'].toString(),
        'imageUrl': 'https://image.tmdb.org/t/p/w500' + data['poster_path'],
      };
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
