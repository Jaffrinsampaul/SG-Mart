import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgmart/screen/landing_page.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'asset/bannert.png',
              height: size.width / 3,
              width: size.width,
            ),
            SizedBox(
              height: size.width * .010,
            ),

            Text(
              "Welcome to SGMart",
              style: GoogleFonts.ubuntu(fontSize: 22, color: Colors.black),
            ),

            SizedBox(
              height: size.height * .020,
            ),
            //First para
            Text(
              "We connect millions of buyers around Tamilnadu, empowering "
              "people & creating economic opportunity for all.",
              style: GoogleFonts.inter(fontSize: 19, color: Colors.grey
                  // fontWeight: FontWeight.bold,
                  ),
            ),
            //Second para
            SizedBox(
              height: size.height * .020,
            ),
            Text(
              "SgMart Online Shopping is the Joint venture of SgMart "
              "Trading Pte Ltd, Peruma Exports, Singapore/India "
              "largest grocery retailer.",
              style: GoogleFonts.inter(fontSize: 19, color: Colors.grey
                  // fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: size.height * .020,
            ),
            Text(
              "With SgMart, you can shop for a wide range of your "
              "household needs from fresh produce to quality Indian "
              "Kitchen Spices/Grain/Masala Products, and home care "
              "essentials to baby products. Have them delivered to "
              "your door, or choose the most convenient time and "
              "place for pickup. Enjoy an effortless shopping "
              "experience with SgMart, whether from your computer,"
              " tablet or mobile phone",
              style: GoogleFonts.inter(fontSize: 19, color: Colors.grey
                  // fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: size.height * .020,
            ),
            Text(
              "In Sep 2000,  SgMart was founded  with a simple mission – "
              "to save you time and money spent shopping for groceries"
              " and household essentials, so you can focus on the "
              "important things in life.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: size.height * .020,
            ),
            Text(
              "Today, after putting a lot of hard work, challenges "
              "and learnings, we’ve built a service that is delivering "
              "on this promise for Indian grocery.",
              style: GoogleFonts.inter(fontSize: 19, color: Colors.grey
                  // fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: size.height * .020,
            ),
            Text(
              "We are having wide range of products in stock, and are "
              "adding more regularly. We provide hot sale offer for "
              "these products  everyday at low prices as well. We have "
              "a website and mobile application to make ordering as "
              "easy as possible.  And we have the latest warehouse and "
              "delivery technologies to ensure your order gets to you "
              "as ordered and when you want.",
              style: GoogleFonts.inter(fontSize: 19, color: Colors.grey
                  // fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: size.height * .020,
            ),
            Text(
              "SgMart is selective in hiring hard-working, dedicated "
              "employees who naturally focus on doing the best for our "
              "customers.",
              style: GoogleFonts.inter(fontSize: 19, color: Colors.grey
                  // fontWeight: FontWeight.bold,
                  ),
            ),

            Align(
                alignment: AlignmentDirectional.bottomCenter,
                child:
                    Container(width: size.width * 10, child: Buttom_Detail()))
          ],
        ),
      ),
    );
  }
}
