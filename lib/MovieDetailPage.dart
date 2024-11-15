import 'package:flutter/material.dart';
import 'tmdb_api.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;

  MovieDetailPage({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: TMDbApi.getMovieDetails(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final movie = snapshot.data!;
        return Scaffold(
          appBar: AppBar(
            title: Text(movie['title']),
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(movie['imageUrl']),
                SizedBox(height: 16),
                Text(
                  movie['title'],
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Release Date: ${movie['releaseDate']}'),
                SizedBox(height: 8),
                Text('Rating: ${movie['rating']}'),
                SizedBox(height: 16),
                Text(
                  movie['overview'],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
