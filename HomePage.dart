import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodbasic/router/About_page.dart';
import 'package:riverpodbasic/router/AppRouter.dart';
import 'package:riverpodbasic/router/Setting_page.dart';
import 'package:riverpodbasic/router/dashBoard_page.dart';

@RoutePage()
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int _selectIndex=0;

  void _select(int index){
    setState(() {
      _selectIndex=index;
    });

    switch(index){
      case 0:
        context.router.push(SettingRoute());
        context.router.pop();
        break;
      case 1:
        context.router.push(AboutRoute());
        context.router.pop();
        break;
      case 2:
        context.router.push(DashBoardRoute());
        context.router.pop();
        break;
      default:
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [Icon(Icons.access_alarm)],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Vehicle Details')),
            ListTile(title: Text('Bike'), onTap: () {
              context.router.push(BikeRoute());
              context.router.pop();
            }),
            ListTile(title: Text('Car'), onTap: () {
              context.router.push(CarRoute());
              context.router.pop();
            }),
            ListTile(title: Text('Cycle'), onTap: () {
              context.router.push(CycleRoute());
              context.router.pop();
            }),
          ],
        ),
      ),
      body:AutoRouter(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: _select,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.add_business_outlined),label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'DashBoard'),
        ],
      ),
    );
  }
}
