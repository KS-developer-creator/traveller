import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 90, left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LOG IN',
                style: TextStyle(
                  fontSize: 37,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF093260),
                  height: 1.2, // Line height
                ),
              ),
              SizedBox(height:3),
              Text(
                'Welcome back! Enter your credentials.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins-MeduinItalic',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF093260),
                  height: 1.2, // Line height
                  letterSpacing: 0.5, // Letter spacing
                ),
              ),

              SizedBox(height: 30,),
              Container(
                width: 380,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  border: Border.all(
                    color: Color(0xFF74777F),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 16),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF43474E),
                        height: 1.2,
                        letterSpacing: 0.5,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.black, // Assuming text color should be black
                      height: 1.2,
                      letterSpacing: 0.5,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text('Remember me'),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform your login logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login clicked'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                    side: BorderSide(
                      color: Color(0xFF74777F),
                      width: 1,
                    ),
                  ),
                ),
                child: Text('LOG IN'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}