import 'package:flutter/material.dart';
import 'package:orgtaski/methods.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}
class _SecondPageState extends State<SecondPage> {
 final ScrollController _scrollController =
      ScrollController();
  bool showTitle = false;
  double _cartWidth = 0;
  double _cartHeight = 0;
  @override
  @override
  Widget BuildCustomCard(Color color, String title, String hours, double percent) {

  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    curve: Curves.bounceInOut,
    width: _cartWidth / 2.3,
    height: _cartHeight,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(40),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 32.0, top: 12),
          child: CircularPercentIndicator(
            radius: 47,
            center: Text(
              "${(percent * 100).toInt()}%",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            lineWidth: 6,
            percent: percent,
            progressBorderColor: Colors.white,
            backgroundColor: Colors.grey,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.white,
          ),
        ),
        SizedBox(height: 70),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "$hours Hours Progress         ",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(height: 13)
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 200 && !showTitle) {
        setState(() {
          showTitle = true; 
        });
      } else if (_scrollController.offset <= 200 && showTitle) {
        setState(() {
          showTitle = false;
        });
      }
    });
    Future.delayed(Duration(milliseconds: 300), () {
      
      setState(() {
        _cartWidth = MediaQuery.sizeOf(context).width; 
        _cartHeight = 290;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            toolbarHeight: 40,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(248, 254, 196, 87),
            elevation: 0,
            title: showTitle
                ? Center(
                    child: Text(
                      "[Ramtin Amiri]",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                : null,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: _cartWidth, 
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(248, 254, 196, 87),
                    borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(40),bottomEnd: Radius.circular(40))
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Icon(Icons.menu, size: 40),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Icon(
                              Icons.search,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              CircularPercentIndicator(
                                radius: 57,
                                lineWidth: 6.5,
                                percent: 0.8,
                                progressBorderColor: const Color.fromARGB(255, 215, 32, 32),
                                backgroundColor: Color.fromARGB(248, 254, 196, 87),
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("lib/ss/m2.jpg")),
                                  color: const Color.fromARGB(255, 83, 117, 230),
                                  borderRadius: BorderRadius.circular(300),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Ramtin Amiri",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Text(
                                "Flutter Developer",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100,
                                  color: const Color.fromARGB(255, 62, 61, 61),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "   My Tasks",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 19),
                      child: BuildCircleIcons(Color.fromARGB(255, 75, 142, 154), Icons.calendar_today)
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23, right: 5),
                      child:BuildCircleIcons(Color.fromARGB(255, 230, 83, 83), Icons.alarm)
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Text(
                            "To Do                                           ",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "5 tasks now.1 started                     ",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 4),
                      child: BuildCircleIcons(Color.fromARGB(255, 115, 226, 64), Icons.downloading)
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Text(
                            "In Progress                                           ",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "1 tasks now.1 started                                     ",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 4),
                      child:BuildCircleIcons(Color.fromARGB(255, 77, 205, 241), Icons.check_circle_outline)
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Text(
                            " Done                                 ",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "18 tasks now.13 started      ",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Active Projects",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildCustomCard(Color.fromARGB(255, 52, 112, 102), "Medical app        ", "9", 0.9),
                   BuildCustomCard(Color.fromARGB(255, 172, 48, 52), "Making History \n Notes", "12", 0.5)
                  ],
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   BuildCustomCard(Color.fromARGB(255, 42, 212, 33), "Practice Coding", "0!", 0.1),
                 BuildCustomCard(Color.fromARGB(255, 15, 215, 182), "Practice Phisics", "12", 0.0)
                  ],
                ),
                SizedBox(height: 10,)
              ], 
            ),
          ),  
        ],
      ),
    );
  }
}
