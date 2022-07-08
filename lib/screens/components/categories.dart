// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  int selected_category = 0;

  List<String> categories = ["All Shows ", "Box Office " , "Coming Soon" , "Kenyan Special"];
  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.symmetric(vertical: 20),
      
      height: 60,
      
      child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: categories.length, itemBuilder: (context, index) => buildCategory(index, context)),
      );
    
  }

  Padding buildCategory(int index, BuildContext context) {
  
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: GestureDetector(
         onTap: (){
            setState(() {
              selected_category = index;
            });
         },
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(categories[index], style:  GoogleFonts.lato( fontWeight: FontWeight.bold, fontSize: 20, textStyle: TextStyle(color: index == selected_category ? Colors.white : Colors.grey),),) , 
             Container(margin: const EdgeInsets.symmetric(vertical: 10), height: 6, width: 40, decoration: BoxDecoration(
               color:  index == selected_category ? Colors.red : Colors.transparent,
               borderRadius: BorderRadius.circular(10)
             ) ,)
           ],
         ),
       ),
     );

  }
}