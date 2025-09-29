import 'package:flutter/material.dart';
import 'package:pmsn20252/database/movies_database.dart';

class ListMoviesScreen extends StatefulWidget {
  const ListMoviesScreen({super.key});

  @override
  State<ListMoviesScreen> createState() => _ListMoviesScreenState();
}

class _ListMoviesScreenState extends State<ListMoviesScreen> {
  MoviesDatabase? moviesDB;

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Peliculas :)")),
      body: FutureBuilder(
        future: moviesDB!.select(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something was wrong!'));
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final objM = snapshot.data![index];
                  return Container(
                    height: 100,
                    color: Colors.black,
                    child: Text(objM.name!),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}
