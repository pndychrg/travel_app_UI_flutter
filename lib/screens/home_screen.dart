import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:travel_app/models/recommended_model.dart';
import 'package:travel_app/models/popular_model.dart';
import 'package:travel_app/models/beach_model.dart';
import 'package:travel_app/screens/selected_place_screen.dart';
import 'package:travel_app/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Page Controller
  final _pageController = PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarTravel(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              //custom navigation
              Container(
                  height: 57.6,
                  margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Color(0x080a0928),
                        ),
                        child: Icon(Icons.menu),
                      ),
                      Container(
                          height: 57.6,
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 57.6,
                                width: 57.6,
                                padding: EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.6),
                                  color: Color(0x080a0928),
                                ),
                                child: Icon(Icons.search),
                              )
                            ],
                          ))
                    ],
                  )),
              //text widget for title
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8),
                child: Text(
                  'Explore\nthe Nature',
                  style: GoogleFonts.lato(
                      fontSize: 45, fontWeight: FontWeight.w700),
                ),
              ),

              //Custom Tab bar with custom indicator
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 14.4, top: 28.8),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                    indicatorPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                    isScrollable: true,
                    unselectedLabelColor: Color(0xFF000000),
                    labelStyle: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    indicator: RectangularIndicator(
                      bottomLeftRadius: 100,
                      bottomRightRadius: 100,
                      topRightRadius: 100,
                      topLeftRadius: 100,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text(" Recommended "),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(" Popular "),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(" New Destination "),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text(" Hidden Gems "),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //ListView Widget with PageView
              //Recommended Section
              Container(
                height: 218,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      recommendations.length,
                      (int index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SelectedPlaceScreen(
                                      recommendedModel:
                                          recommendations[index])));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 28.8),
                              width: 333.6,
                              height: 218.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.6),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          recommendations[index].image))),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      bottom: 19.2,
                                      left: 19.2,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.8),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaY: 19.2, sigmaX: 19.2),
                                          child: Container(
                                            height: 36,
                                            padding: EdgeInsets.only(
                                                left: 16.72, right: 14.4),
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.location_pin,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 9.52,
                                                ),
                                                Text(
                                                  recommendations[index].name,
                                                  style: GoogleFonts.lato(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    fontSize: 16.8,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )),
                ),
              ),

              //Dots indicator
              // Using smoothPageIndicator Library
              Padding(
                padding: EdgeInsets.only(left: 28.8, top: 28.8),
                child: Padding(
                  padding: const EdgeInsets.only(left: 118.0),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: recommendations.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Colors.white,
                        dotColor: Color(0xffababab),
                        dotHeight: 5.8,
                        dotWidth: 6,
                        spacing: 5.8),
                  ),
                ),
              ),

              //Text Widget for Popular Categories
              Padding(
                padding:
                    const EdgeInsets.only(top: 48.0, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Popular Categories',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      'Show All',
                      style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),

              //Horizontal List View for Categories
              Container(
                margin: EdgeInsets.only(top: 13.6),
                height: 55.6,
                child: ListView.builder(
                  itemCount: populars.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 28.8, right: 9.6),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 19.2, left: 10),
                      height: 45.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(populars[index].color),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 19.2,
                          ),
                          Image.asset(
                            populars[index].image,
                            height: 17.9,
                          ),
                          SizedBox(
                            width: 19.2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // ListView for Beach Section
              Container(
                margin: EdgeInsets.only(top: 28.8, bottom: 16.8),
                height: 124.8,
                child: ListView.builder(
                  itemCount: beaches.length,
                  padding: EdgeInsets.only(left: 28.8, right: 12),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 124.8,
                      width: 188.4,
                      margin: EdgeInsets.only(right: 16.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              CachedNetworkImageProvider(beaches[index].image),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //bottom navigation bar
            ],
          ),
        ),
      ),
    );
  }
}
