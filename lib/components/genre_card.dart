import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({ required this.genre,Key? key}) : super(key: key);
  final String genre; 

  @override
  Widget build(BuildContext context) {

    

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 15),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

      decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(20)),
      child: Text( genre , style: TextStyle(fontSize: 16 , color: Colors.black.withOpacity(0.6)),),
    );
    
  }
}