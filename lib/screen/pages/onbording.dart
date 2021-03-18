import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sgmart/services/onbording_data.dart';



class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        itemBuilder: (context, index) {
          return SliderTitle(
            imageAssetPath: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc(),
          );
        },
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
        height: Platform.isAndroid ? 90 : 80,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
                onTap: () {
                  pageController.animateToPage(slides.length - 1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear);
                },
                child: Text("SKIP",style: TextStyle(
                    fontSize: 20
                ),)),
            Row(
              children: <Widget>[
                for (int i = 0; i < slides.length; i++)
                  currentIndex == i
                      ? pageIndexIndicator(true)
                      : pageIndexIndicator(false)
              ],
            ),
            InkWell(
                onTap: () {
                  pageController.animateToPage(currentIndex + 1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear);
                },
                child: Text("NEXT",style: TextStyle(
                    fontSize: 20
                ),)),
          ],
        ),
      )
          : GestureDetector(
        onTap: (){
        },
      ),
    );
  }
}

class SliderTitle extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTitle({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPath),
          SizedBox(
            height: 20,
          ),
          Text(title),
          SizedBox(
            height: 12,
          ),
          Text(desc),
        ],
      ),
    );
  }
}