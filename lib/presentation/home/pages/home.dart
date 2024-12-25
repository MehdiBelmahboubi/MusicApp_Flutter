import 'package:flutter/material.dart';
import 'package:music_app_flutter/core/configs/assets/app_vectors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fond noir
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête avec l'image d'album
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppVectors.logo,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 180,
                    width: double.infinity,

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppVectors.home_top_card,
                      height: 188,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Section "News"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "News",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _newsCard('assets/images/bad_guy.jpg', 'Bad Guy', 'Billie Eilish'),
                  _newsCard('assets/images/scorpion.jpg', 'Scorpion', 'Drake'),
                  _newsCard('assets/images/artist.jpg', 'WH', 'Artist Name'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Section "Playlist"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Playlist",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See More",
                    style: TextStyle(
                      color: Color.fromARGB(255, 62, 159, 238),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _playlistItem("As It Was", "Harry Styles", "5:33"),
            _playlistItem("God Did", "DJ Khaled", "3:43"),
          ],
        ),
      ),
    );
  }

  Widget _newsCard(String imagePath, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.play_circle_fill,
                  color: Color.fromARGB(255, 62, 159, 238),
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playlistItem(String title, String artist, String duration) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.play_circle_fill, color: Color.fromARGB(255, 62, 159, 238), size: 32),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                artist,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            duration,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.favorite_border, color: Colors.grey),
        ],
      ),
    );
  }
}
