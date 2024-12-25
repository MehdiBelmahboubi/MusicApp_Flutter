import 'package:flutter/material.dart';

class SongPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Now Playing',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.music_note,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Song Title',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Artist Name',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  iconSize: 36,
                  onPressed: () {
                    // Add previous song functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 36,
                  onPressed: () {
                    // Add play song functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  iconSize: 36,
                  onPressed: () {
                    // Add next song functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}