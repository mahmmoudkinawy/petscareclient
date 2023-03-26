import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Logged_up extends StatefulWidget {
  const Logged_up({Key? key}) : super(key: key);

  @override
  State<Logged_up> createState() => _Logged_upState();
}

class _Logged_upState extends State<Logged_up> {
  var _image;
  bool isVisable = true;
  late String username;
  late String email;
  late String location;
  late String phone;
  late String password;

  late GlobalKey<FormState> key;

  @override
  void initState() {
    super.initState();
    key = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      height: 180,
                      width: 180,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                           color: Color(0xEEEEEEFF) ),
                      child: Image.asset('assets/2.jpg',fit: BoxFit.cover)),
                ),
                const SizedBox(height: 20),
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
                        labelText: ' First name',
                        hintTextDirection: TextDirection.ltr,
                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                          fontSize: 14,
                          color: const Color(0xffC2C2C2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        username = newValue!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
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
                        ),                        prefixIcon: Padding(
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
                        labelText: 'Second name',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                          fontSize: 14,
                          color: const Color(0xffC2C2C2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your location';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
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
                        ),                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/svgs/phone.svg',
                            color: const Color(0xff8F8F8F),
                            height: 24,
                            width: 24,
                            fit: BoxFit.contain,
                            matchTextDirection: true,
                          ),
                        ),
                        labelText: ' phone number',
                        hintTextDirection: TextDirection.ltr,
                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                          fontSize: 14,
                          color: const Color(0xffC2C2C2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your phone';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        phone = newValue!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
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
                        ),                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/svgs/email.svg',
                            color: const Color(0xff8F8F8F),
                            height: 24,
                            width: 24,
                            fit: BoxFit.contain,
                            matchTextDirection: true,
                          ),
                        ),
                        labelText: ' e-mail',
                        hintTextDirection: TextDirection.rtl,
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
                        email = newValue!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
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
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                          fontSize: 14,
                          color: const Color(0xffC2C2C2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your password';
                        }
                        if (value.length < 8) {
                          Fluttertoast.showToast(
                              msg: "Please Enter at least 8 chars",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              //  timeInSecForIosWeb: 2,
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
                const SizedBox(height: 15),
                //
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          height: 55,
                          width: 200,
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
                                  ' Register',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signInWithForm() {
    if (!key.currentState!.validate()) return;
    key.currentState?.save();
    // log('email:$email\npassword:$password\nname:$username\nphone:$phone\n');
    if (username == null ||
        username.isEmpty ||
        password == null ||
        password.isEmpty ||
        email == null ||
        email.isEmpty ||
        location == null ||
        location.isEmpty ||
        phone == null ||
        phone.isEmpty) {
      // log('You are logged successfully');
      Fluttertoast.showToast(
          msg: '   please enter a correct data ..',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          //timeInSecForIosWeb: 2,
          backgroundColor: Colors.white,
          textColor: Colors.pink,
          fontSize: 16.0);
      return;
    } else {
      Fluttertoast.showToast(
          msg: 'You are logged successfully',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          //      timeInSecForIosWeb: 10,
          backgroundColor: Colors.white,
          textColor: Colors.indigo,
          fontSize: 16.0);
    }
  }

  Future pickPhotoFromGallery() async {
    File imageFile =
        (await ImagePicker().pickImage(source: ImageSource.camera)) as File;

    setState(() {
      _image = imageFile;
    });
  }
}
