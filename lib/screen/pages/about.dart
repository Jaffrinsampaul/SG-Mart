import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.grey,
            width: size.width * .50,
            height: size.height * 10,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //heading
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Our Company",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87
                      ),
                    ),
                  ),
                  //First para
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Multilevel marketing (MLM) is a strategy that some direct sales "
                      "companies use to encourage existing distributors to recruit "
                      "new distributors. In MLM schemes, there can be hundreds or "
                      "thousands of members worldwide, but relatively few earn "
                      "meaningful incomes from their efforts, indicating a possible "
                      "pyramid scheme.",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Image(image: AssetImage("asset/maxresdefault.jpg")),
                  //second para
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Based in Ada, Michigan, U.S., on the same property where "
                          "our company was founded, our global footprint stretches"
                          " across six continents with a presence in more than 100+ "
                          "countries and territories. While many things have changed "
                          "over the past 60 years, our four Founders Fundamentals "
                          "and six company values still guide us "
                          "today. And, we remain one of the largest family-owned "
                          "companies-an attribute that's rare in 2020."
                    ),
                  ),
                  //leadership
                  Text("Leadership"),
                  //iamge and para
                  Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      Container(
                        width: size.width * .25,
                        height: size.height * .25,
                        child: Text("Amway is above all a family company. Steve Van Andel "
                            "and Doug DeVos lead a diverse global management team "
                            "that supports Amway Direct Sellers and their goals"),
                      ),
                      Container(
                        width: size.height * .15,
                        height: size.width * .10,
                        child: Image(
                          image: AssetImage("asset/mlm-companies-push.jpg"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
