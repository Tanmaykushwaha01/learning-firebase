import 'package:firebase/Round-Button.dart';
import 'package:firebase/Signup-Button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Login Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                    hintText: 'Enter your email',
                    helperText: 'example@gmai.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,

                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter password';
                  }
                  return null;
                },
              ),
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          RoundButton(
              title: 'Login',
              onTap: () {
                if (_formKey.currentState!.validate()) {}
              }),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have account"),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
              }, child: const Text('Create Account')),
            ],
          )
        ],
      ),
    );
  }
}
