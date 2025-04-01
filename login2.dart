import 'package:auto_route/annotations.dart';
import 'package:firstproj/basicclass/whatsapp.dart';
import 'package:firstproj/nestedNavigator/aboutPage.dart';
import 'package:firstproj/nestedNavigator/registerData.dart';
import 'package:firstproj/nestedNavigator/setting%20page.dart';
import 'package:firstproj/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../basicclass/gridview.count.dart';
import '../lifeCycleMethod/lifeCycleState.dart';

@RoutePage()
class Login2 extends StatefulWidget {
  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  int _drawerPage = 0;
  int _bottomNavigation=0;
  bool _drawerUse=false;

  final List<Widget> _page = [
   // const Home(),
    SettingPage(),
    Aboutpage(),
    RegisterData(),
  ];

  final List<Widget> _page2=[
    LifeCycle(),
    Whatsapp(),
    GridCount(),
  ];

  void selectMethodPage(int index) {
    setState(() {
      _drawerPage = index;
      _drawerUse=true;
    });
  }

  void selectBottomNavi(int index) {
    setState(() {
      _bottomNavigation = index;
      _drawerUse=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
        drawer: Drawer(
            child: Padding(
                padding: EdgeInsets.all(15),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        'Setting',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        selectMethodPage(0);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('About',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      onTap: () {
                        selectMethodPage(1);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Register Data',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      onTap: () {
                        selectMethodPage(2);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ))),
        appBar: AppBar(
          title: Text(themeManager.translate('welcome')),
          actions: [
            // Switch(value: themeManager.themeMode == ThemeMode.dark, onChanged: (newValue){
            //   themeManager.toggleTheme(newValue);
            //   if(newValue == true){
            //     iconshow=Icons.sunny;
            //   }
            //   else{
            //     iconshow=Icons.shield_moon_sharp;
            //   }
            // }
            // )
            IconButton(tooltip:'Theme Change',
                onPressed: () {
                  bool newValue =
                      themeManager.themeMode == ThemeMode.light ? true : false;
                  themeManager.toggleTheme(newValue);
                },
                icon: Icon((themeManager.themeMode == ThemeMode.dark)
                    ? Icons.sunny
                    : Icons.nightlight_round)),

            IconButton(tooltip: 'Language Change',onPressed: ()=>_showLanguageDialog(context),
                icon: const Icon(Icons.language)),
          ],
        ),
        body: IndexedStack(
          index: _drawerUse?_drawerPage:_bottomNavigation,
          children: _drawerUse?_page:_page2
        ),bottomNavigationBar: BottomNavigationBar(
     items: const [
       BottomNavigationBarItem(icon: Icon(Icons.home),
       label: 'Home',backgroundColor: Colors.red),
       BottomNavigationBarItem(icon: Icon(Icons.message_sharp),
       label: 'Message',backgroundColor: Colors.yellow),
       BottomNavigationBarItem(icon: Icon(Icons.man),
       label: 'Profile',backgroundColor: Colors.blueGrey)
     ],
      currentIndex: _bottomNavigation,
      selectedItemColor: Colors.pink,
      onTap: selectBottomNavi,
    ),
    );

  }
}

void _showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Select Language"),
        content: Consumer<ThemeManager>(
          builder: (context, themeManager, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('English'),
                  onTap: () {
                    themeManager.load('en'); // Load English language
                    Navigator.pop(context);  // Close dialog
                  },
                ),
                ListTile(
                  title: Text('Tamil'),
                  onTap: () {
                    themeManager.load('ta'); // Load Tamil language
                    Navigator.pop(context);  // Close dialog
                  },
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

