import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showCard = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('StartDate'),
                        Text('|'),
                        Text('EndDate'),
                        Text('|'),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showCard = !showCard;
                            });
                          },
                          child: Row(
                            children: [
                              Text('No of Travellers'),
                              Icon(showCard
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      print('Button pressed');
                    },
                    child: Text('Proceed'),
                  ),
                ],
              ),
              if (showCard)

                Container(
                  margin: EdgeInsets.only(top: 10,left: 300),
                  width: 200,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child:Column(
                    children: [
                      Text('Add Travellers'),
                      Text('Adults / Childern'),
                      Row(
                        children: [
                          Text('')
                        ],
                      )
                    ],
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
