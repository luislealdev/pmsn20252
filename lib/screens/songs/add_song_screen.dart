import 'package:flutter/material.dart';
import 'package:pmsn20252/firebase/songs_firebase.dart';

class AddSongScreen extends StatefulWidget {
  const AddSongScreen({super.key});

  @override
  State<AddSongScreen> createState() => _AddSongScreenState();
}

class _AddSongScreenState extends State<AddSongScreen> {
  SongsFirebase? songsFirebase;

  @override
  void initState() {
    super.initState();
    songsFirebase = SongsFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar Canción")),
      body: Center(
        child: TextButton(
          onPressed: () {
            songsFirebase!
                .insertSong({
                  "title": "Canción de prueba",
                  "duration": "3:30",
                  "lyrics": "Letra de la canción de prueba",
                  "image": "https://example.com/image.jpg",
                })
                .then((value) => Navigator.pop(context));
          },
          child: Text("Agregar Canción"),
        ),
      ),
    );
  }
}
