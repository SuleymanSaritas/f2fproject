import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecocycle/core/components/navigator/push_replacement.dart';
import 'package:ecocycle/features/home/home_screen.dart';

class EmailPasswordForm extends StatefulWidget {
  @override
  EmailPasswordFormState createState() => EmailPasswordFormState();
}

class EmailPasswordFormState extends State<EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 8),
                child: Container(
                  child: Text(
                    "Login with Email and Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "E-mail",
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.grey[300],
                ),
                validator: (String? mail) {
                  if (mail!.isEmpty) return "Please write an e-mail";
                  return null;
                },
              ),
              SizedBox(height: 16), // TextFormField'lar arasına boşluk eklendi
              TextFormField(
                controller: _passwordController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Password",
                  fillColor: Colors.grey[300],
                ),
                validator: (String? password) {
                  if (password!.isEmpty) return "Please type a password";
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _signInWithEmailAndPassword();
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      Flexible(
                        child: Text(
                          'Login with Email',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  void _signInWithEmailAndPassword() async {
    try {
      final User? user = (await auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      // ignore: deprecated_member_use
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${user!.email} logged in with."),
        ),
      );

      pushReplacement(
        context,
        NavigationPage(),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.message}"),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("There was a problem logging in with Email and Password"),
        ),
      );
    }
  }
}
