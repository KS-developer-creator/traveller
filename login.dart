import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel/screens/signup.dart';

import '../sharedprefrencelibrary.dart';

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
  final _signUpTapGestureRecognizer = TapGestureRecognizer();
  @override
  void dispose() {
    // Dispose of the TapGestureRecognizer when the widget is disposed
    _signUpTapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderText('LOG IN', 37, FontWeight.w600),
                  _buildHeaderText(
                    'Welcome back! Enter your credentials.',
                    18,
                    FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  const SizedBox(height: 40),
                  _buildInputField('Email', _emailController, _validateEmail),
                  const SizedBox(height: 10),
                  _buildRememberMeCheckbox(),
                  const SizedBox(height: 12),
                  _buildInputField(
                    'Password',
                    _passwordController,
                    _validatePassword,
                    isPassword: true,
                  ),
                  const SizedBox(height: 8),
                  _buildForgotPasswordButton(),
                  const SizedBox(height: 30),
                  Center(
                    child: _buildCircularButton(
                      onPressed: _loginClicked,
                      icon: Icons.arrow_forward,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildOrLogInWithLabel(),
                  const SizedBox(height: 8.5),
                  _buildSocialButtons(),
                  const SizedBox(height: 20),
                  _buildSignUpText(),
                ],
              ),
            ),
            SizedBox(
              height: 280,
              width: 300,
              // top: 500, // Adjust the position from the bottom as needed
              // left: 10, // Adjust the position from the left as needed
              child: Image.asset(
                'assets/signup bottom.png', // Replace with the actual path to your image
                width: 260, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildHeaderText(
      String text,
      double fontSize,
      FontWeight fontWeight, {
        double letterSpacing = 0.0,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'BebasNeue',
            fontWeight: fontWeight,
            color: const Color(0xFF093260),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 3),
      ],
    );
  }

  Widget _buildInputField(
      String hintText,
      TextEditingController controller,
      String? Function(String?)? validator, {
        bool isPassword = false,
      }) {
    return Container(
      width: 380,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        border: Border.all(
          color: const Color(0xFF74777F),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Color(0xFF43474E),
              height: 1.2,
              letterSpacing: 0.5,
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 1.2,
            letterSpacing: 0.5,
          ),
          validator: validator,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      children: [
        Checkbox(
          checkColor: const Color(0xFF093260),
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value ?? false;
            });
          },
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: Color(0xFF093260),
          ),
        ),
      ],
    );
  }

  Widget _buildCircularButton({
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return ClipOval(
      child: _buildElevatedButton(onPressed: onPressed, icon: icon),
    );
  }

  Widget _buildElevatedButton({
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16), backgroundColor: const Color(0xFFC2C4CA),
        shape: const CircleBorder(),
      ),
      child: Icon(icon, size: 20, color: Colors.white),
    );
  }

  Widget _buildOrLogInWithLabel() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Text(
                'Or log in with',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  letterSpacing: 0.5,
                  color: Color(0xFF74777F),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15), // Adjust the margin as needed
                child: Container(
                  height: 1,
                  color: Colors.grey, // You can customize the color of the divider
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }





  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton('assets/google.png'),
        _buildSocialButton('assets/facebook.png'),
        _buildSocialButton('assets/apple.png'),
      ],
    );
  }

  Widget _buildSocialButton(String imagePath) {
    return Container(
      width: 72,
      height: 52,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:  Colors.white70,
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x4D000000),
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Image.asset(imagePath),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Forgot Password clicked'),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Color(0xFF5375E9),
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: 'Poppins',
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpText() {
    return Center(
      child: RichText(
        text:   TextSpan(
          children: [
            const TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.5,
                color: Color(0xFF43474E),
              ),
            ),
            TextSpan(
              text: 'Sign up',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.5,
                color: Color(0xFF5375E9),
              ),
              recognizer: TapGestureRecognizer()
              ..onTap = ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const signup()),);

              },
            ),
          ],
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (RegExp(r"[*^]").hasMatch(value)) {
      return 'Password should not contain special characters like * and ^';
    }
    return null;
  }

  Future<void> _loginClicked() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      await SharedPreferencesHelper.saveLoginStatus(true);
      // loginApi(email, password);


    }
  }
}