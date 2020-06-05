import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/movie.dart';
import 'ui/movie_ui.dart';

void main() {
  runApp(MaterialApp(
    title: "Movies App",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  final List<Movie> moviesList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.red,
        ),
        body: ListView.builder(
          itemCount: moviesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                movieCard(context, moviesList[index]),
                Positioned(
                    top: 10.0, child: movieImage(moviesList[index].images[0])),
              ],
            );
            /**
                Card(
                elevation: 5.0,
                color: Colors.white,
                child: ListTile(
                leading: CircleAvatar(

                child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                image: NetworkImage(moviesList[index].images[0]),
                fit: BoxFit.cover)
                ),
                ),
                ),
                title: Text("${moviesList[index].title}"),
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetails(movieName: "${moviesList[index].title}",movie: moviesList[index],)));
                },
                ),
                );
             **/
          },
        ));
  }

  Widget movieCard(BuildContext context, Movie movie) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(left: 80.0),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, right: 8.0, bottom: 8.0, left: 54.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "${movie.title}",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Text("${movie.imdbRating}/10"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("${movie.released}"),
                      Text(movie.runtime),
                      Text(movie.rated)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(
                      movieName: "${moviesList}",
                      movie: movie,
                    )));
      },
    );
  }

  Widget movieImage(String url) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
    );
  }
}

class MovieDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieDetails({Key key, this.movieName, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: <Widget>[
            MovieDetailsThumbnail(thumbnail: movie.images[0]),
            MovieDetailsHeaderWithPoster(movie: movie),
            HorizontalLine(),
            MovieDetailsCast(movie: movie),
            HorizontalLine(),
            MovieDetailsExtraPosters(
              posters: movie.images,
            )
          ],
        ));
  }
}

class MovieDetailsBanner extends StatelessWidget {
  final String urlthumb;

  const MovieDetailsBanner({Key key, this.urlthumb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(urlthumb),
                fit: BoxFit.cover,
              )),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsPosterHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPosterHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.images[0].toString()),


        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(poster),fit: BoxFit.cover
            )
          ),

        ),
      ),
    );
  }
}

