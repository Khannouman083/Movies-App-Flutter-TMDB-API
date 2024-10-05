import 'package:flutter/material.dart';
import 'package:movies_app/modifiedText.dart';

class myPopularTv extends StatefulWidget {
  List popularTV;
  myPopularTv({super.key, required this.popularTV});

  @override
  State<myPopularTv> createState() => _myPopularTvState();
}

class _myPopularTvState extends State<myPopularTv> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(text: "Popular Tv Shows", color: Colors.white, size: 25),
          Container(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.popularTV.length,
                itemBuilder: (context, index){
                  return widget.popularTV[index]['original_name']!=null ?Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(image:
                              NetworkImage("http://image.tmdb.org/t/p/w500"+widget.popularTV[index]['poster_path']))
                          ),
                        ),
                        Container(
                          child: modifiedText(text: widget.popularTV[index]['original_name'], color: Colors.white, size: 14),
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
