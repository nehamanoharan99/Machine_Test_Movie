import 'package:flutter/material.dart';
import 'package:movieproject/ZoomImagePage.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, String>> favorites;

  const FavoritesPage({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: Colors.blue,
      ),
      body: favorites.isEmpty
          ? Center(child: Text("No favorites added yet!"))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      // Navigate to a new screen with the zoomed-in image
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ZoomImagePage(imageUrl: favorites[index]["imageUrl"]!),
                        ),
                      );
                    },
                    child: Image.network(
                      favorites[index]["imageUrl"]!,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(favorites[index]["title"]!),
                );
              },
            ),
    );
  }
}