import 'package:flames_ui/pages/_chat.dart';
import 'package:flames_ui/pages/calendar.dart';
import 'package:flames_ui/pages/home.dart';
import 'package:flames_ui/pages/search.dart';
import 'package:flames_ui/theme/color.dart';
import 'package:flames_ui/util/bottom_navigation_bar_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int  indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: indexPage,
      children: const [

        HomePage(),
        SearchPage(),
        CalendarPage(),
        ChatPage(),


      ],
    );
  }

  Widget getBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: 1, color: bgDark.withOpacity(0.3))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(icons.length, (index) {
            return  Container(
                decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                BoxShadow(
                color: indexPage == index? Colors.grey[100]: Colors.white,
                blurRadius: 5.0,
                  spreadRadius: 0.1,


            ),
            ]
            ),
            child:
              IconButton(
                    iconSize:  indexPage == index
                        ? 50.00
                        : 50.00,
              onPressed: () {
                setState(() {
                  indexPage = index;
                });
              },

              icon: SvgPicture.asset(
                indexPage == index
                ? icons[index]['active']
                : icons[index]['inactive'] ,

              ),


              ),
            );
          })
        ),
      ),
    );
  }
}