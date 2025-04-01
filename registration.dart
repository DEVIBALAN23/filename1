import 'package:auto_route/annotations.dart';
import 'package:firstproj/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:firstproj/localization/LocalizationService.dart';
import '../themes/theme_manager.dart';

@RoutePage()
class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  TextEditingController sendName=TextEditingController();
  TextEditingController sendNumber=TextEditingController();



  final _formKey = GlobalKey<FormState>();
  int age = 18;

  void increment() {
    setState(() {
      if (age < 70) {
        age++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (age > 10) {
        age--;
      }
    });
  }

  bool validGender() {
    if (selectGender == null) {
      print('selectgender');
      return false;
    }
    return true;
  }


  String? selectGender;

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      // drawer: Drawer(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('Home'),
      //       Text('About'),
      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      // actions: [
      //   Icon(Icons.access_alarm_outlined),
      //   Icon(Icons.ac_unit_sharp),
      //   CircleAvatar(
      //     backgroundImage:NetworkImage("data:image/jpeg;base64,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") ,
      //     backgroundColor: Colors.black,
      //   ),
      // ],
      // backgroundColor: Colors.pinkAccent,
      //   title: Text('Registration',style: TextStyle(fontWeight: FontWeight.bold),),
      //   elevation: 5,
      //   shadowColor:Colors.blueAccent,
      // ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 600,
              child: Card(
                // color: Colors.white38,
                // elevation: 30,
                // shadowColor: Colors.black,
                // borderOnForeground: false,
                // semanticContainer: false,
                // surfaceTintColor: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          themeManager.translate('REGISTRATION'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                      ),

                      // ListView(
                      //   children: [
                      //     Text('list 1'),
                      //     Text('list 2'),
                      //     Text('list 3'),
                      //   ],
                      // ),
                      // Spacer(),
                      SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset(
                        'assets/images/regis.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).iconTheme.color ?? Colors.white,
                            BlendMode.srcIn),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      TextFormField(
                        controller: sendName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter E-mail ";
                          }else if(!isValidEmail(value)){
                            return "Enter Valid Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // fillColor: Colors.white60,
                          // filled: true,
                          hintText: 'Enter E-mail',
                          // labelText: 'Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        controller: sendNumber,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Mobile Number ";
                          } else if (!isValidMobileNumber(value)) {
                            return "Enter Valid Number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // fillColor: Colors.white60,
                          // filled: true,
                          hintText: 'Enter your Number here',
                          // labelText: 'Mobile-Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter your Age here',
                      //     labelText: 'Age',
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.black),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Age      :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // SizedBox(width: 20,),
                            // InkWell(
                            //   onLongPress: () =>setState(() {
                            //     decrement();
                            //   }),child: ElevatedButton(onPressed: decrement, child: Text('-')),
                            // ),
                            ElevatedButton(
                              onPressed: decrement,
                              child: Text('-'),
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.zero),
                            ),
                            // SizedBox(width: 10,),
                            // Container(
                            //   height: 40,
                            //   width: 40,
                            //   child: Text('$age'),
                            // ),
                            Text('$age'),
                            // SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed: increment,
                              child: Text('+'),
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.zero),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Gender :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Male'),
                                Radio(
                                    value: 'male',
                                    groupValue: selectGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectGender = value;
                                      });
                                    }),
                                Text('Female'),
                                Radio(
                                    value: 'female',
                                    groupValue: selectGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectGender = value;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                                style: ButtonStyle(),
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      validGender()) {
                                    String name=sendName.text;
                                    String number=sendNumber.text;

                                    Provider.of<ThemeManager>(context,listen:false ).registerData(name, number);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Registration Success")),
                                    );
                                    Navigator.pop(context,MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Registration Failed")),
                                    );
                                  }
                                },
                                child: Text('Register')),
                          ),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Already have an account ',
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                TextSpan(text: '?'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool isValidMobileNumber(String number) {
  RegExp regExp = RegExp(r'^[6-9]\d{9}$');
  return regExp.hasMatch(number);
}
bool isValidEmail(String email) {
  return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(email);
}