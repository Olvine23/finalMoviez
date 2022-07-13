import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviez/base_config.dart';
import 'package:moviez/models/cast.dart';
import 'package:moviez/services/services.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  final String status;
  final String showposter;
  final String name;
  final double rating;
  final String description;
  const DetailScreen(
      {Key? key,
      required this.id,
      required this.showposter,
      required this.name,
      required this.rating,
      required this.description,
      required this.status
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: 
    
      
      FloatingActionButton(
        onPressed: () { 


          Navigator.pushAndRemoveUntil(
  			context,
  			MaterialPageRoute(builder: (context) => ListView()), // this mymainpage is your page to refresh
  			(Route<dynamic> route) => false,
		);



         },
        child: Icon(
          
          Icons.refresh,size: 40, color: Colors.white,),
      ),
      
      backgroundColor: secondary_color,
      body: ListView(
         
        children: <Widget>[
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: <Widget> [
                Container(
                
                   
                  height: size.height * 0.4 - 50,

                  //image section
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
                    image:
                    
                     DecorationImage(
                       fit: BoxFit.cover,
                       image:  CachedNetworkImageProvider(showposter)
                     )
                       
                
                        
                  ),
                  
                ),

                //rating box
                Positioned(
                    bottom: 0,
                    right: 0,

                    child: Container(
                      width: size.width * 0.9,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50)
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 50,
                            color: const Color(0xFF12153D).withOpacity(0.2),
                          ),
                        ]
                      ),
                      child: Padding(
                        
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround, 
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star , color: Colors.yellow, size: 30,),
                                const SizedBox(height: 5,),
                                RichText(
                                  
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                   children: 
                                   [
                                     TextSpan(
                                       text: "${rating.toString()}/",
                                       style: const TextStyle(fontWeight: FontWeight.w600)
                                     ),
                                     const TextSpan(text: "10\n"),
                                     const TextSpan(
                                       text: "150,212",
                                       style: TextStyle(color: Colors.grey)
                                     )
                                   ]
                                  
                                ))
                              ],
                            ),


                            //rate this

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              const Icon(Icons.star),
                              const SizedBox(height: 5,),
                                Text("Rate This", style: Theme.of(context).textTheme.bodyText2,)

                              ],
                            ),

                            //MetaScore

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF51CF66),
                                    borderRadius: BorderRadius.circular(2)
                                  ),
                                  child: Text(
                                    rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 5,),
                                const Text("Metascore",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                                Text("63 critic reviews",
                                
                                style: GoogleFonts.lato()
                                ),
                              ],
                            )


                        ]),
                     ),
                    ),
                    
                  
                    
                    ),
                   const  SafeArea(child: BackButton(color: Colors.white,))
              ],
            ), 
          ),
          SizedBox(height: 10),
 
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(name, style: Theme.of(context).textTheme.headline5),
                const SizedBox(height: 10, width: 20,),
                Text(status, style:  const TextStyle(fontSize: 15, color: Colors.green), )
              ],
            ),
          ),
              
              Padding(
              
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Html(data: description ,style:{
                'p':Style(
                  color: primary_color,
                  fontSize: FontSize.large,
                  fontFamily:  '${GoogleFonts.mukta()}'
                  ),

              },),
              // child: Text(
              //   description,
              //   style:  GoogleFonts.lato(textStyle:  const TextStyle(color: Colors.white ,fontSize: 18))
              // ),
            ),]
          ),

          //  FutureBuilder(
             
          //  builder:(context, snapshot){
          //    if(snapshot.connectionState == ConnectionState.none){
          //      return const Center(
          //     child: Text("No show available right now"),
          //   );
          //    }
          //   if(snapshot.connectionState == ConnectionState.waiting){
          //     return  const  Center(

          //     child: CircularProgressIndicator(),

          //   );
          //   }
          //    return castBuilder(snapshot.data);
          //  } , 
           
          //  future: ApiServices.fetchCast(),

           
          //  )

          SizedBox(height: 40,),


          FutureBuilder(

            future: ApiServices.fetchPoems(),
            
            builder:(context, snapshot){
              if(snapshot.connectionState == ConnectionState.none ){
                return Text("Oopsie");
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }

              return poems(snapshot.data);
            }
            
             )
        ],
      ),
    );
  }
}

Widget poems(dynamic data){

  var status = data[1];
  if(status == 200){
    final jsonFinal = jsonDecode(data[0]);

    var allPoems = jsonFinal.map((e) => PoemsT.fromJson(e)).toList();

    return ListView.builder(physics: const ScrollPhysics(),  shrinkWrap: true,  itemCount: allPoems.length, itemBuilder:  (context, index){

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Text(allPoems[index].title , style: TextStyle(color: Colors.yellow),),
          // ignore: prefer_const_constructors
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: CachedNetworkImageProvider(allPoems[index].poet.photoAvatarUrl))

            ),
          ),
          Text(allPoems[index].url , style: TextStyle(color: Colors.red),),
          Text(allPoems[index].content, style: TextStyle(color: primary_color , fontFamily: 'roboto'),),
        ],
      );



    }
    
    
    );
  }
  else{
    return Text("Nothing");
  }


}

 Widget castBuilder(dynamic data){

   var statusCode = data[1];
   if(statusCode == 200){
     final finalJson = json.decode(data[0]!);

     var allCast = finalJson.map((e) => Cast.fromJson(e)).toList();
     print(allCast);


     return ListView.builder(itemCount: allCast.length, itemBuilder: ((context, index) => Text(allCast[index].name, style: TextStyle(color: Colors.white),)));

     
   }

   else{
     return Text("No Text");
   }



 }


// To parse this JSON data, do
//
//     final poems = poemsFromJson(jsonString);

 

List<Poems> poemsFromJson(String str) => List<Poems>.from(json.decode(str).map((x) => Poems.fromJson(x)));

String poemsToJson(List<Poems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Poems {
    Poems({
        required this.title,
        required this.description,
        required this.date,
        required this.categories,
        required this.body,
        required this.id,
    });

    String title;
    String description;
    String date;
    List<String> categories;
    String body;
    int id;

    factory Poems.fromJson(Map<String, dynamic> json) => Poems(
        title: json["title"],
        description: json["description"],
        date: json["date"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        body: json["body"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "date": date,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "body": body,
        "id": id,
    };
}


 // To parse this JSON data, do
//
//     final poemsT = poemsTFromJson(jsonString);
 
List<PoemsT> poemsTFromJson(String str) => List<PoemsT>.from(json.decode(str).map((x) => PoemsT.fromJson(x)));

String poemsTToJson(List<PoemsT> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoemsT {
    PoemsT({
        required this.title,
        required this.content,
        required this.url,
        required this.poet,
    });

    String title;
    String content;
    String url;
    Poet poet;

    factory PoemsT.fromJson(Map<String, dynamic> json) => PoemsT(
        title: json["title"],
        content: json["content"],
        url: json["url"],
        poet: Poet.fromJson(json["poet"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "url": url,
        "poet": poet.toJson(),
    };
}

class Poet {
    Poet({
        required this.name,
        required this.url,
        required this.photoAvatarUrl,
    });

    String name;
    String url;
    String photoAvatarUrl;

    factory Poet.fromJson(Map<String, dynamic> json) => Poet(
        name: json["name"],
        url: json["url"],
        photoAvatarUrl: json["photo_avatar_url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "photo_avatar_url": photoAvatarUrl,
    };
}
