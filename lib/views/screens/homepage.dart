import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'global.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Staggered Grid View",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
      ),
      body:  MasonryGridView.builder(
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: BouncingScrollPhysics(),
          itemCount: Global.allthing.length,
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, i) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'SliderPage',
                        arguments: Global.allthing[i]);
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: Global.allthing[i]['height'],
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  Global.allthing[i]['image'],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                color: Colors.grey[300]),
                            child: Text(
                              "${Global.allthing[i]['text']}",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}