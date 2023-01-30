import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {

    Map slidervalue = ModalRoute.of(context)!.settings.arguments as Map;
    List allimage = slidervalue['simage'];

    return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              slidervalue['text'],
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                items: allimage
                    .map(
                      (e) => Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(e),
                      ),
                    ),
                  ),
                )
                    .toList(),
                options: CarouselOptions(

                  autoPlay: true,
                  height: 250,
                  viewportFraction: 0.7,
                  autoPlayCurve: Curves.easeInBack,
                  enlargeCenterPage: true,
                ),
              ),

            ],
          ),
    );
  }
}
