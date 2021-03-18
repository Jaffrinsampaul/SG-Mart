import 'package:flutter/material.dart';
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
            Container(
                width: size.width * 10,
                height: size.height * .50,
                color: Colors.grey,
                child: Image.asset("asset/sgmart.png",
                width: size.width * 10,
                height: size.height * .50,),
                // child: Onbording()
            ),
            Container(
              width: size.width * 10,
              height: size.height * .50,
              color: Colors.white10,
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                  width: size.width * 10,
                  child: Buttom_Detail()),
            ),
          ],
        ),
      ),
    );
  }
}
