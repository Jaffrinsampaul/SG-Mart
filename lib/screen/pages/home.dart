import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgmart/screen/categories/flour.dart';
import 'package:sgmart/screen/landing_page.dart';
import 'package:sgmart/screen/pages/onbording.dart';

class ShopHome extends StatefulWidget {
  // List names = ['Rice', 'Masala', 'Home care', 'Personal Care'];
  @override
  _ShopHomeState createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  List images = [
    'asset/categories/bubbly.png',
    'asset/categories/MASALA sakthi.jpg',
    'asset/categories/healthy.png',
    'asset/categories/iyarkaioil.png',
    'asset/categories/maharaja.png',
    'asset/categories/mrgoldcoconut.png',
    'asset/categories/nylonsago.jpg',
    'asset/categories/prabath.jpg',
    'asset/categories/riceflour.png',
    'asset/categories/ricepower.jpg',
    'asset/categories/savorit.png',
    'asset/categories/sooji.png',
    'asset/categories/srinawaab.png',
    'asset/categories/sunflower.png',
  ];

  List brand = [
    'asset/brand/Aachi.png',
    'asset/brand/maharaja.png',
    'asset/sgmart.png',
    'asset/brand/Sakthi.png',
    'asset/brand/udhaiyam.png'
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CarouselSlider(
            //   items: [
            //     Container(
            //       decoration: BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(25),
            //         image: DecorationImage(
            //             image: AssetImage("asset/bannert.png"),
            //             fit: BoxFit.cover),
            //       ),
            //     ),
            //     //Bannert
            //     Container(
            //       decoration: BoxDecoration(
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(25),
            //         image: DecorationImage(
            //             image: AssetImage("asset/carousel/commission.png"),
            //             fit: BoxFit.cover),
            //       ),
            //     ),
            //     //sakthibanner
            //     Container(
            //       decoration: BoxDecoration(
            //           // color: Colors.grey,
            //           borderRadius: BorderRadius.circular(25),
            //           image: DecorationImage(
            //               image: AssetImage("asset/carousel/sakthibanner.png"),
            //               fit: BoxFit.contain)),
            //     ),
            //     //masala
            //     Container(
            //       decoration: BoxDecoration(
            //           color: Colors.grey,
            //           borderRadius: BorderRadius.circular(25),
            //           image: DecorationImage(
            //               image: AssetImage("asset/carousel/masala.jpg"),
            //               fit: BoxFit.cover)),
            //     ),
            //   ],
            //   options: CarouselOptions(
            //       height: size.height * .50,
            //       autoPlay: true,
            //       autoPlayCurve: Curves.easeInOut,
            //       enlargeCenterPage: true),
            // ),

            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                // height: MediaQuery.of(context).size.height*0.4,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: size.width>1000? 4:2.5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              ),
            ),
            //length of carousel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: size.height * .010,
            ),
            Container(
              child: Column(
                children: [
                  //Brand we offer
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Brand we offering',
                      style: GoogleFonts.yantramanav(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: brand.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(brand[index],
                              width: 200,
                              fit: BoxFit.cover,)
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 250,
                      crossAxisCount: (MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height/ 2.5))
                          .round(),
                    ),
                  ),
                  //Categories
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Categories",
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .060,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: images.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        splashColor: Colors.green,
                        onTap: (){
                        },
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.asset(
                                images[index],
                                height: 220,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 250,
                      crossAxisCount: (MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 2))
                          .round(),
                      // crossAxisSpacing: 5.0,
                      // mainAxisSpacing: 5.0,
                      // childAspectRatio: MediaQuery.of(context).size.width /
                      //     (MediaQuery.of(context).size.height / 2)
                    ),
                  )
                ],
              ),
            ),
            //Buttom Container
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(width: size.width * 10, child: Buttom_Detail()),
            ),
          ],
        ),
      ),
    );
  }
//build carousel
  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          child: Image.asset(item, fit: BoxFit.fill, width: 1000)
      ),
    ),
  )).toList();
}
//carousel
final List<String> imgList = [
  'asset/carousel/commission.png',
  'asset/carousel/masala.jpg',
  'asset/carousel/bannert.png',
  'asset/carousel/sakthibanner.png'
];

