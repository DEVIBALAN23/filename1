import 'package:flutter/material.dart';
import 'package:riverpodbasic/RiverPodBasic/AutoDispose.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Responsive());
  }
}

class Responsive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, pass) {
          bool isLargeScreen = pass.maxWidth > 600;

          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Responsive Layout'),
                      SizedBox(height: 20),
                      isLargeScreen
                          ? GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            //Allows the grid to take only the required space inside a Column or SingleChildScrollView.// Prevents infinite height issues when using GridView inside a scrollable widget.
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1.2,
                                ),
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.blue,
                                child: Center(
                                  child: Text('index ${index + 1}'),
                                ),
                              );
                            },
                          )
                          : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(Icons.add_circle),
                                title: Text('index ${index + 1}'),
                              );
                            },
                          ),
                    ],
                  ),
                ),
              ),
              SlidingUpPanel(
                minHeight: 80,
                maxHeight: pass.maxHeight * 0.7,
                panel: Center(child: Text('hii welcome')),
                collapsed: Container(
                  color: Colors.black26,
                  child: Center(child: Text('Slide Me Up')),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
