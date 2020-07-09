import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_course/models/page.dart';
import 'package:flutter_course/screens/home_screen.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;
  int _index = 0;
  ValueNotifier<int> _pageViewerNotifier = ValueNotifier(0);

  _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(
        'Language',
        '1- Making friends is easy as waving your hand back and forth in easy step',
        Icons.language,
        'assets/images/1.png'));
    pages.add(PageModel(
        'AC',
        '2- Making friends is easy as waving your hand back and forth in easy step',
        Icons.ac_unit,
        'assets/images/2.png'));
    pages.add(PageModel(
        'Map',
        '3- Making friends is easy as waving your hand back and forth in easy step',
        Icons.map,
        'assets/images/3.png'));
    pages.add(PageModel(
        'ADB',
        '4- Making friends is easy as waving your hand back and forth in easy step',
        Icons.adb,
        'assets/images/4.png'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
              itemCount: pages.length,
              onPageChanged: (index) {
                /*setState(() {
                  _index = index;
                });*/
                _pageViewerNotifier.value = index;
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: ExactAssetImage(
                            pages[index].image,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Transform.translate(
                          child: Icon(
                            pages[index].icon,
                            size: 150,
                            color: Colors.white,
                          ),
                          offset: Offset(0, -96),
                        ),
                        Text(
                          pages[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
          Transform.translate(
            offset: Offset(0, 175),
            child: Align(
              alignment: Alignment.center,
              child: _displayPageIndicator(pages.length),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _drawIndicator(_index),
              ),*/
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: RaisedButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          // TODO: Update Seen
                          _updateSeen();
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Get started'.toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }

  List<Widget> _drawIndicator(int index) {
    //print(index);
    //print(pages.length);
    List<Widget> widgets = List<Widget>();
    for (int i = 0; i < pages.length; i++) {
      widgets.add(_drawCircle(i == index ? Colors.red : Colors.grey));
      //widgets.add(_drawCircle(i == index ? Colors.red : Colors.grey));
    }
    return widgets;
  }

  Widget _drawCircle(Color _color) {
    print(_color.toString());
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _color,
      ),
    );
  }

  Widget _displayPageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewerNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
