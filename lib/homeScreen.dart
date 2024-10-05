import 'package:flutter/material.dart';
import 'package:movies_app/modifiedText.dart';
import 'package:movies_app/popularTvShow.dart';
import 'package:movies_app/topRatedMovies.dart';
import 'package:movies_app/trendingMovies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  List trendingMovies = [];
  List topRatedMovies = [];
  List popularTV = [];
  final String apiKey = "0dbc88e5aeb37bcad36ab8cd05ff8448";
  final String accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZGJjODhlNWFlYjM3YmNhZDM2YWI4Y2QwNWZmODQ0OCIsIm5iZiI6MTcyODA2NDIxMy43MDE3NTEsInN1YiI6IjY2ZWJhNTkwODJmZjg3M2Y3ZDFmYWMyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QBRj_6TOYzgKTrYa8jPVp9mirFndnXxWKyeeA4nLbzA";

  loadMovies () async {
    TMDB tmdbwithcustomLogs = new TMDB(ApiKeys(apiKey, accessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));
    final responseTrending = await tmdbwithcustomLogs.v3.trending.getTrending();
    final responseTopRated = await tmdbwithcustomLogs.v3.movies.getTopRated();
    final responsepopularTV = await tmdbwithcustomLogs.v3.tv.getPopular();
    // print(responseTrending);
    setState(() {
      trendingMovies = responseTrending['results'];
      topRatedMovies = responseTopRated['results'];
      popularTV = responsepopularTV['results'];
    });
    print(trendingMovies);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: modifiedText(text: "Movies App", color: Colors.white, size: 25)
      ),
      body: ListView(
        children: [
          myTrendingMovies(trending: trendingMovies),
          myPopularTv(popularTV: popularTV),
          myTopRated(topRated: topRatedMovies)
        ],
      ),
    );
  }
}
