import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<IconData> navMenu = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation Animation"),
        ),
        bottomNavigationBar: Container(
          height: screenWidth * .155,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 30,
                offset: Offset(0, 10))
          ]),
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.024),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: screenWidth * .2125,
                        child: Center(
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height:
                                index == selectedIndex ? screenWidth * 0.12 : 0,
                            width: index == selectedIndex
                                ? screenWidth * 0.2125
                                : 0,
                            decoration: BoxDecoration(
                                color: index == selectedIndex
                                    ? Colors.blueAccent.withOpacity(0.3)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: screenWidth * .2125,
                        child: Icon(
                          navMenu[index],
                          color: index == selectedIndex
                              ? Colors.blueAccent
                              : Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
