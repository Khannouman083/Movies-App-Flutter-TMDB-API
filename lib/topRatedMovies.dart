import 'package:flutter/material.dart';
import 'package:movies_app/modifiedText.dart';

class myTopRated extends StatefulWidget {
  List topRated;
  myTopRated({super.key, required this.topRated});

  @override
  State<myTopRated> createState() => _myTopRatedState();
}

class _myTopRatedState extends State<myTopRated> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text: "Top Rated Movies", color: Colors.white, size: 25),
          Container(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.topRated.length,
                itemBuilder: (context, index){
                  return widget.topRated[index]['title']!=null ?Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(image:
                              NetworkImage("http://image.tmdb.org/t/p/w500"+widget.topRated[index]['poster_path']))
                          ),
                        ),
                        Container(
                          child: modifiedText(text: widget.topRated[index]['title'], color: Colors.white, size: 14),
                        )
                      ],
                    ),
                  ): Container();
                }),
          )
        ],
      ),
    );
  }
}
