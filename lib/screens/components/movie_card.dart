import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviez/models/shows.dart';
import 'package:moviez/screens/details_screen.dart';
import 'package:moviez/services/services.dart';
import 'package:shimmer/shimmer.dart';

// list of shows

class SeriesList extends StatelessWidget {
  const SeriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {  

        return ApiServices.fetchallShows();
      },
      child: Center(
        child: FutureBuilder(
          future: ApiServices.fetchallShows(),
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.none) {
              //print('project snapshot data is: ${projectSnap.data}');
              return const Center(
                child: Text("No show available right now"),
              );
            }
            if (projectSnap.connectionState == ConnectionState.waiting) {
              return  const  Center(
    
                child: CircularProgressIndicator(),
    
              );
    
            }
            if(projectSnap.hasError){
              return Center(
                child: Row(
                  children: [
                    const Text("Damnit No Internet", style: TextStyle(fontSize: 30, color: Colors.white),),
                    const Icon(Icons.emoji_flags , color: Colors.red, size: 20,)
                  ],
                ),
              );
            }
            return moviebuilder(
              projectSnap.data,
            );
          },
        ),
      ),
    );
  }
}

//view widget

Widget moviebuilder(dynamic data) {
  var statuscode = data[1];
  if (statuscode == 200) {
    final finalJson = json.decode(data[0]!);

    var allshow = finalJson.map((e) => Mod.fromJson(e)).toList();

    return GridView.builder(
      
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: allshow.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    id: allshow[index].id,
                    status: allshow[index].status,
                    showposter: allshow[index].image.original,
                    name: allshow[index].name,
                    rating: allshow[index].rating.average,
                    description: allshow[index].summary,
                  ),
                )),
            child: SizedBox(
            
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                        width: 200,
                        height: 150,
                        
          
                        
                           decoration: BoxDecoration(   
                                      borderRadius: BorderRadius.circular(22),

                                      image: DecorationImage(

                                        image: CachedNetworkImageProvider(
                                          
                                          allshow[index].image.medium
                                          
                                          
                                        ),
                                        // image: NetworkImage( allshow[index].image.medium,),
                                        //whatever image you can put here
                                        fit: BoxFit.cover,
                                      ),
                         
                        )),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    allshow[index].name,
                    style:  GoogleFonts.lato(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white))
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  } else {
    return const Center(
      child: Text("Not Found"),
    );
  }
}
