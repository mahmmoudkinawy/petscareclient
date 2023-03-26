import 'dart:developer';
import 'package:get/get.dart';
import 'package:petscareclient/expanded.dart';
import 'package:petscareclient/profile_screen/view/profile_screen.dart';
import 'package:petscareclient/src/screens/home_screen.dart';

import 'logged_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isVisable = true;

  late String username;
  late String password;

  late GlobalKey<FormState> key;

  @override
  void initState() {
    super.initState();
    key = GlobalKey<FormState>();
    // usernameController = TextEditingController();
    // passContoller = TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    // usernameController.dispose();
    // passContoller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 55),
                child: Container(
                    height: 180,
                    width: 180,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child: Image.asset('assets/1.jpg')),
              ),
              const SizedBox(height: 30),
              Form(
                  key: key,
                  child: Column(
                    children: [
                      Card(
                        elevation:20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  'assets/svgs/user.svg',
                                  color: const Color(0xff8F8F8F),
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.contain,
                                  matchTextDirection: true,
                                ),
                              ),

                              labelText: ' Email',
                              hintStyle: GoogleFonts.vazirmatn().copyWith(
                                fontSize: 14,
                                color: const Color(0xffC2C2C2),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your email';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              username = newValue!;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Card(
                        elevation:20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: TextFormField(
                            obscureText: isVisable,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  'assets/svgs/password.svg',
                                  color: const Color(0xff8F8F8F),
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.contain,
                                  matchTextDirection: true,
                                ),
                              ),
                              suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.indigo,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isVisable = !isVisable;
                                    });
                                  }),
                              labelText: ' password',
                              hintTextDirection: TextDirection.ltr,

                              hintStyle: GoogleFonts.vazirmatn().copyWith(
                                fontSize: 14,
                                color: const Color(0xffC2C2C2),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your password';
                              }


                              if (value.length < 8 &&
                                  username == 'mohamed@gmail.com') {
                                Fluttertoast.showToast(
                                    msg: "Please Enter at least 8 chars",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              password = newValue!;
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      height: 55,
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                  side: BorderSide(color: Colors.black)
                              ),
                            ),
                            // backgroundColor: MaterialStateProperty.all(
                            //     Color.fromARGB(255, 96, 177, 243)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15))),
                        onPressed: _signInWithForm,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              ' Signin',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "? don't have account",
                        style: TextStyle(color: Colors.grey),
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Logged_up(),
                          ));
                    },
                    child: const Text(
                      ' Register',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                ],
              ),
              Container(
                color: Colors.amber,
              )
            ],
          ),
        ),

      ),
    );
  }

  _signInWithForm() {
    if (!key.currentState!.validate()) return;
    key.currentState?.save();
    log('email:$username\npassword:$password');
    if (username == 'mohamed@gmail.com' && password == '12345678') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      final snackBar = SnackBar(
        content: const Text('Welcome to my vet',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        dismissDirection: DismissDirection.up,
        padding: EdgeInsets.all(7),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'إخفاء',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Fluttertoast.showToast(
          msg: 'You are logged successfully',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.pink,
          fontSize: 16.0);
      return;
    } else {
      Fluttertoast.showToast(
          msg: 'please correct your data..',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.indigo,
          fontSize: 16.0);
    }
  }
}
