import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/modifiedText.dart';

class myTrendingMovies extends StatefulWidget {
  List trending;
  myTrendingMovies({super.key, required this.trending});

  @override
  State<myTrendingMovies> createState() => _myTrendingMoviesState();
}

class _myTrendingMoviesState extends State<myTrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text: "Trending Movies", color: Colors.white, size: 25),
          Container(
            height: 250,
            child: ListView.builder(
               scrollDirection: Axis.horizontal,
                itemCount: widget.trending.length,
                itemBuilder: (context, index){
                  return widget.trending[index]['title']!=null ?InkWell(
                    onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>myDecription(name: widget.trending[index]['title'],
                      description: widget.trending[index]['overview'],
                      bannerUrl: "http://image.tmdb.org/t/p/w500"+widget.trending[index]['backdrop_path'],
                      posterUrl: "http://image.tmdb.org/t/p/w500"+widget.trending[index]['poster_path'],
                      voting: widget.trending[index]["vote_average"].toString(),
                      launch_on: widget.trending[index]["release_date"])));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(image:
                              NetworkImage("http://image.tmdb.org/t/p/w500"+widget.trending[index]['poster_path']))
                            ),
                          ),
                          Container(
                            child: modifiedText(text: widget.trending[index]['title'], color: Colors.white, size: 14),
                          )
                        ],
                      ),
                    ),
                  ): Container();
                }),
          )
        ],
      ),
    );
  }
}
