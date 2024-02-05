import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String title;
  final int releaseYear;
  final String genre;
  final String synopsis;
  final double rating;
  final String imageUrl;

  MovieDetailPage({
    required this.title,
    required this.releaseYear,
    required this.genre,
    required this.synopsis,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align title in the center
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blueGrey.shade900, // Dark theme background color
                    Colors.blueGrey.shade800,
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildSectionTitle('Title'), // Blog for title
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _buildSectionTitle('Release Year'), // Blog for release year
                  SizedBox(height: 8.0),
                  Text(
                    '$releaseYear',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  _buildSectionTitle('Genre'), // Blog for genre
                  SizedBox(height: 8.0),
                  Text(
                    genre,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  _buildSectionTitle('Rating'), // Blog for rating
                  SizedBox(height: 8.0),
                  Text(
                    '$rating',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  _buildSectionTitle('Synopsis'), // Blog for synopsis
                  SizedBox(height: 8.0),
                  Text(
                    synopsis,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your desired action here.
          print('Button pressed!');
        },
        child: Icon(Icons.favorite),
      ),
    );
  }

  // Method to build section titles with decoration
  Widget _buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors
            .blueGrey.shade800, // Dark theme section title background color
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Detail Page Example',
      theme: ThemeData.dark(), // Dark theme
      home: MovieDetailPage(
        title: 'Inception',
        releaseYear: 2010,
        genre: 'Sci-Fi, Action',
        synopsis:
            "Dom Cobb (Leonardo DiCaprio) is a thief with the rare ability to enter people's dreams and steal their secrets from their subconscious. His skill has made him a hot commodity in the world of corporate espionage but has also cost him everything he loves. Cobb gets a chance at redemption when he is offered a seemingly impossible task: Plant an idea in someone's mind. If he succeeds, it will be the perfect crime, but a dangerous enemy anticipates Cobb's every move.",
        rating: 8.8,
        imageUrl:
            'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
      ),
    );
  }
}
