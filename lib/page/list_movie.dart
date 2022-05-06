import 'package:flutter/material.dart';
import 'package:get_tugas_ming_10_token/core/model/Result.dart';
import 'package:get_tugas_ming_10_token/core/repository/repository.dart';

class ListMovie extends StatefulWidget {
  const ListMovie({Key? key}) : super(key: key);

  @override
  State<ListMovie> createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  var repoUserList;
  var baseUrlImage = 'https://image.tmdb.org/t/p/w500';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repoUserList = Repository().getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Movie>>(
        future: repoUserList,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Movie> dataMovie = snapshot.data;
            print(dataMovie.length);
            return ListView.builder(
                itemCount: dataMovie.length,
                itemBuilder: (context, index) {
                  Movie movies = dataMovie[index];
                  return GestureDetector(
                    onTap: () {
                      ShowDialogFunc(
                          context,
                          '$baseUrlImage' + movies.posterPath,
                          movies.originalTitle,
                          movies.releaseDate.toString());
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(60 / 2),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage('$baseUrlImage' +
                                            movies.posterPath))),
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    ' ' + movies.originalTitle,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  )
                                ],
                              ),
                              // Text(
                              //   ' ' + movies.releaseDate.toString(),
                              //   style: const TextStyle(fontSize: 15),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

ShowDialogFunc(
  context,
  String images,
  String firsName,
  String lastMame,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: const EdgeInsets.all(15),
            width: 320,
            height: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    images,
                    height: 200,
                    width: 200,
                  ),
                ),
                Text(
                  ' ' + firsName,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  ' ' + lastMame,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
        ));
      });
}
