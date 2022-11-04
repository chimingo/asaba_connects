import 'dart:convert';

import 'package:asaba_connect/screens/util/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required String title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getPhotos()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/"));
    List photos =[];
    if (response.statusCode==200){
      var jsons=jsonDecode(response.body);
      for (var json in jsons) {
        Photo photo =Photo.fromJson(json);
        photos.add(photo);
        
      }
      }else {
        throw Exception("error");
        
      }
      return photos;
    }
    
        late Future futurePhotos;
  @override
  void initState() {
    super.initState();
    futurePhotos= getPhotos();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(
          padding: const EdgeInsets.only(left:10),
          child: textInfo("Contacts",FontWeight.w600,Colors.white,25),
          
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add_box_sharp))
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              clipBehavior: Clip.none,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(300)) ),
                  fillColor: Color.fromARGB(120, 255, 255, 255),
                  filled: true,
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search)
                ),

              ),
            ),
        //    Container(
        //     padding:const EdgeInsets.only(left: 15),
        //     clipBehavior: Clip.none,
        //     width: double.infinity,
        //    child: textInfo("Favourites", FontWeight.normal, Colors.white, 14)
        //   ) ,
        //   Container(
        //     width:double.infinity,
        //     height: 150,
        //     padding: EdgeInsets.zero,
        //     child: FutureBuilder(
        //       future: getPhotos(),
        //       builder:((context, snapshot){
        //         return ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: 30,
        //           itemBuilder:((context, index){
        //             return Column(
        //               children: [
        //                 Container(
        //                   width: 70,
        //                   height: 70,
        //                   decoration: BoxDecoration(
        //                     image: DecorationImage(image: NetworkImage("${snapshot.data[index]}"),
                            
                            
        //                    ),
        //                    ),
        //                    ),
                           
        //                    ],
        //                     );
                           
        //           }
        //         ));
                        
                      

                    
          


        
        
        //       }
        // ),
        //     )
        //   )]
          ]
      )));
  }
  }
