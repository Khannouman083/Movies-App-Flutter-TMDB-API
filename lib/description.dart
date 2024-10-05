import 'package:flutter/material.dart';
import 'package:movies_app/modifiedText.dart';

class myDecription extends StatefulWidget {
  final String name, description, bannerUrl, posterUrl, voting, launch_on;
  const myDecription({super.key, required this.name, required this.description, required this.bannerUrl, required this.posterUrl, required this.voting, required this.launch_on});

  @override
  State<myDecription> createState() => _myDecriptionState();
}

class _myDecriptionState extends State<myDecription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Container(
        child: ListView(
          children: [
            Container(
              height: 350,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(widget.bannerUrl,fit: BoxFit.cover,),
                  )),
                  Positioned(
                     bottom: 10,
                      left: 10,
                      child: modifiedText(text: "⭐ Average Rating: "+widget.voting, color: Colors.white, size: 20)),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios)))
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: modifiedText(text: widget.name, color: Colors.white, size: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                child: modifiedText(text: "Release Date: "+widget.launch_on, color: Colors.white, size: 20),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 250,
                    width: 150,
                    child: Image.network(widget.posterUrl,fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10,),
                  Flexible(child: modifiedText(text: widget.description, color: Colors.white, size: 18))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
