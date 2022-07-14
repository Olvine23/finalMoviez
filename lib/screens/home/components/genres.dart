import 'package:flutter/material.dart';
import 'package:moviez/components/genre_card.dart';

class Genres extends StatelessWidget {
  const Genres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> genres = ["Action" , "Comedy" , "Drama" , "Horror", "Romance" ,"Thriller" ] ;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 36, 
      
      child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: genres.length, itemBuilder: (context, index) =>  GenreCard(genre: genres[index])),
      
    );
    
  }
}


