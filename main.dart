import 'package:auto_route/annotations.dart';
import 'package:firstproj/display/login2.dart';
import 'package:firstproj/Registration/registration.dart';
import 'package:firstproj/themes/theme_constrant.dart';
import 'package:firstproj/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'hiveDTO/themeDTO.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ThemeDTOAdapter());
  await Hive.openBox('settings');
  await Hive.openBox('register');

  WidgetsFlutterBinding.ensureInitialized();
  ThemeManager themeManager = ThemeManager();
   themeManager.load('en');

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeManager(),
    child: const Main(),
  ));
}

@RoutePage()
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  bool male = false;
  bool female = false;
  String selectGender = 'none';
  TextEditingController sendemail = TextEditingController();
  TextEditingController sendpassword = TextEditingController();
  String? token;
  String? selectedLanguage = 'English';

  List<String> items = ['English', 'Tamil'];

  Future<void> Loginuser() async {
    final Uri url =Uri.parse('https://reqres.in/api/login');
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final String body =
    jsonEncode({'email': sendemail.text, 'password': sendpassword.text});
    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        token = data['token'];
        print(data);
        print('Api success');
      } else {
        print('failed');
        token = null;
      }
    } catch (e) {
      print('Error $e');
      token = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SizedBox(
            width: 600,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(alignment: Alignment.topRight,value: selectedLanguage,items: items.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(), onChanged: (newValue)  {
                        if(newValue != null){
                          setState(()  {
                            selectedLanguage=newValue;
                            if(newValue == 'Tamil'){
                              Provider.of<ThemeManager>(context,listen: false).load('ta');
                            }
                            else{
                              Provider.of<ThemeManager>(context,listen: false).load('en');
                            }
                          });
                        }
                      }),
                      Text(
                        themeManager.translate('LOGIN'),
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/images/pushlogin.svg',
                        height: 100,
                        width: 100,
                        colorFilter: ColorFilter.mode(
                            Theme
                                .of(context)
                                .iconTheme
                                .color ?? Colors.white,
                            BlendMode.srcIn),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.7,
                          child: TextFormField(
                            controller: sendemail,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter E-mail";
                              } else if (!isValidEmail(value)) {
                                return "Enter a valid E-mail";
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: 'E-mail id',
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.7,
                          child: TextFormField(
                            controller: sendpassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Password";
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.3,
                          child: Builder(
                            builder: (context) {
                              return ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await Loginuser();
                                    bool isValid = Provider.of<ThemeManager>(
                                        context,
                                        listen: false)
                                        .validateLogin(
                                        sendemail.text, sendpassword.text);
                                    if (token != null || isValid) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Login2()));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                            Text("Login Successfully")),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          content: Text('User Not Found')));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Login Failed")),
                                    );
                                  }
                                },
                                child: Text(
                                    themeManager.translate('Submit')),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              themeManager.translate('Remember Me'),
                              style: const TextStyle(fontSize: 15),
                            ),
                            Checkbox(
                                value: remember,
                                onChanged: (bool? value) {
                                  setState(() {
                                    remember = value ?? false;
                                  });
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              registration()));
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Do you want to ',
                                    style: TextStyle(fontSize: 18),
                                    children: [
                                      TextSpan(
                                        text: 'Register',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                      TextSpan(text: '?'),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}

bool isValidEmail(String email) {
  return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(email);
}

bool isValidPassword(String password) {
  return RegExp(
      r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()-_+=<>?/{}[\]|]).{8,}$")
      .hasMatch(password);
}

// void _showLanguageDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text("Select Language"),
//         content: StatefulBuilder(
//           builder: (context, setState) {
//             var selectedLanguage;
//             return DropdownButton<String>(
//               value: selectedLanguage,
//               items: ['English', 'Tamil'].map((String item) {
//                 return DropdownMenuItem(
//                   value: item,
//                   child: Text(item),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 if (newValue != null) {
//                   setState(() {
//                     selectedLanguage = newValue;
//                   });
//
//                   if (newValue == 'Tamil') {
//                     LocalizationService.load('ta');
//                   } else {
//                     LocalizationService.load('en');
//                   }
//
//                   Navigator.pop(context); // Close the dialog after selection
//                 }
//               },
//             );
//           },
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//         ],
//       );
//     },
//   );
// }