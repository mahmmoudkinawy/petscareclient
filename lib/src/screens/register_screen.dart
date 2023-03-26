import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

import '../../logged_up_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _submitData() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final phoneNumber = phoneNumberController.text;
    final email = emailController.text;
    final password = passwordController.text;

    final response = await http.post(
      Uri.parse('http://pets-care.somee.com/api/account/register'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      // Redirect to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Logged_up()), //will be home screen
      );
    } else {
      Flushbar(
        message: 'Email is already taken',
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(10),
        icon: Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
        maxWidth: MediaQuery.of(context).size.width *
            0.9, // set the width to 80% of the screen width
      )..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Icon(
                    Icons.pets,
                    color: Colors.blueAccent,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 30),
                FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        controller: firstNameController,
                        name: 'firstName',
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'First Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'First Name is required.'),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        controller: lastNameController,
                        name: 'lastName',
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Last Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Last Name is required.'),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        controller: phoneNumberController,
                        name: 'phoneNumber',
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Phone Number',
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Phone Number is required.'),
                          FormBuilderValidators.match(
                            r"^01[0-2,5]{1}[0-9]{8}$",
                            errorText: "Enter a valid Egyptian Phone Number.",
                          )
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        controller: emailController,
                        name: 'email',
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Email is required.'),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        controller: passwordController,
                        name: 'password',
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Password is required.'),
                          FormBuilderValidators.minLength(8),
                          FormBuilderValidators.match(
                              r"(?=^.{6,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$",
                              errorText: "Please write more complex password.")
                        ]),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate()) {
                            _submitData();
                            Navigator.pushNamed(context, '/');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('REGISTER'),
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: const Text(
                          "Already got an account? Login",
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
