import 'dart:convert';

import 'package:admin/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart' as url;
import 'package:http/http.dart' as http;

import '../../../constants.dart';

final auth = url.url + 'auth/signin';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late SharedPreferences shp;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  Future<void> initSharedPref() async {
    shp = await SharedPreferences.getInstance();
  }

  Future<void> loginUser(String email, String password) async {
    final url = Uri.parse(auth);
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successful login, handle the response
        final responseData = json.decode(response.body);
        // Extraire le token du corps de la réponse
        final receivedToken = responseData as String;
        // Extraire l'ID de l'utilisateur du token décodé
        //final token = verifyJwtHS256Signature(
        //  receivedToken, "not-less-than-32-lettres+strong-key");
        //store userId in sharedpref
        shp.setString('token', receivedToken);
        String? token = shp.getString('token');
        //String? userId = token.toJson()['userId'];
        //print('userId : ${userId}');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
        );

        // Example: Navigate to the home screen or perform other actions
      } else if (response.statusCode == 404) {
        // User not found
        print('User not found. Status code: ${response.statusCode}');
        print('Error message: ${response.body}');

        // Example: Show an error message to the user
      } else {
        // Failed login, handle the error
        print('Failed to login. Status code: ${response.statusCode}');
        print('Error message: ${response.body}');

        // Example: Show an error message to the user
      }
    } catch (error) {
      // Handle other exceptions (e.g., network error)
      print('Error: $error');

      // Example: Show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Form is valid, perform login

                loginUser(emailController.text, passwordController.text);
              }
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
