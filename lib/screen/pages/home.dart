import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgmart/screen/categories/flour.dart';
import 'package:sgmart/screen/landing_page.dart';
import 'package:sgmart/screen/pages/onbording.dart';

class ShopHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                //Bannert
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage("asset/bannert.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                //logo
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage("asset/sgmart.png"),
                          fit: BoxFit.contain)),
                ),
                //groceryStore
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage("asset/grocerystore.jpg"),
                          fit: BoxFit.cover)),
                ),
                //lay-chips
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage("asset/frito-lay-chips.jpg"),
                          fit: BoxFit.cover)),
                ),
                //masala
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage("asset/masala.jpg"),
                          fit: BoxFit.cover)),
                ),
                //sgbanner-1
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage(
                        "asset/sgbanner-1.jpg",
                      ))),
                )
              ],
              options: CarouselOptions(
                  height: size.height * .50,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true),
            ),
            SizedBox(
              height: size.height * .010,
            ),
            Container(
              // width: size.width * 10,
              // height: size.height,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(20)),
              //   color: Colors.grey,
              // ),
              child: Column(
                children: [
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
                  //First row
                  Row(
                    children: [
                      //Rice
                      Padding(
                        padding: const EdgeInsets.only(left: 350.0),
                        child: Container(
                          width: size.width * .10,
                          height: size.height * .23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              //Rice
                              Image.asset(
                                "asset/categories/Rice & Pulses.jpg",
                                width: size.width * .10,
                                height: size.height * .18,
                              ),
                              Text(
                                "Rice & Pulses",
                                style: GoogleFonts.yantramanav(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      //Masala
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          width: size.width * .10,
                          height: size.height * .23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Image.asset(
                                "asset/categories/MASALA sakthi.jpg",
                                width: size.width * .10,
                                height: size.height * .18,
                              ),
                              Text("Masala",
                                  style: GoogleFonts.yantramanav(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      //Home Care
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          width: size.width * .10,
                          height: size.height * .23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Image.asset(
                                "asset/categories/homecare.jpg",
                                width: size.width * .10,
                                height: size.height * .18,
                              ),
                              Text("Home Care",
                                  style: GoogleFonts.yantramanav(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      //personal Care
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          width: size.width * .10,
                          height: size.height * .23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Image.asset(
                                "asset/categories/personalcare.png",
                                width: size.width * .090,
                                height: size.height * .18,
                              ),
                              Text("Personal Care",
                                  style: GoogleFonts.yantramanav(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * .060,
                  ),
                  //second row
                  Row(
                    children: [
                      //Flour & Sooji
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Flour_Sooji(),));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 350.0),
                          child: Container(
                            width: size.width * .10,
                            height: size.height * .23,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                Image.asset(
                                  "asset/categories/Flour & Sooji.png",
                                  width: size.width * .10,
                                  height: size.height * .18,
                                ),
                                Text("Flour & Sooji",
                                    style: GoogleFonts.yantramanav(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Tea & Coffee
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          width: size.width * .10,
                          height: size.height * .23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Image.asset(
                                "asset/categories/Tea & Coffee.jpg",
                                width: size.width * .10,
                                height: size.height * .18,
                              ),
                              Text(
                                  "Tea & Coffee",
                                  style: GoogleFonts.yantramanav(
                                      fontSize: 15, fontWeight: FontWeight.bold)
                              )
                            ],
                          ),
                        ),
                      ),
                      //Dry Fruits
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          width: size.width * .10,
                          height: size.height * .23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 9,
                              ),
                              Image.asset(
                                "asset/categories/Dry Fruits.png",
                                width: size.width * .10,
                                height: size.height * .18,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                  "Dry Fruits",
                                  style: GoogleFonts.yantramanav(
                                      fontSize: 15, fontWeight: FontWeight.bold)
                              )
                            ],
                          ),
                        ),
                      ),
                      //Oil ,Ghee, Butter & Cheese
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          width: size.width * .10,
                          height: size.height * .23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Image.asset(
                                "asset/categories/Oil ,Ghee, Butter & Cheese.jpg",
                                width: size.width * .10,
                                height: size.height * .18,
                              ),
                              Text(
                                  "Oil ,Ghee, Butter\n& Cheese",
                                  style: GoogleFonts.yantramanav(
                                      fontSize: 13, fontWeight: FontWeight.bold)
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width * .020,
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
}
