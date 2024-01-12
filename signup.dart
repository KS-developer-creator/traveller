
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel/screens/login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderText('SIGN UP', 37, FontWeight.w600),
                  _buildSubHeaderText(
                    'Hello! Create an account.',
                    18,
                    FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  const SizedBox(height: 30),
                  _buildInputField('First Name', _firstNameController, _validateNotEmpty),
                  const SizedBox(height: 40),
                  _buildInputField('Last Name', _lastNameController, _validateNotEmpty),
                  const SizedBox(height: 40),
                  _buildInputField('Phone Number', _phoneNumberController, _validateNotEmpty),
                  const SizedBox(height: 40),
                  _buildInputField('Email', _emailController, _validateEmail),
                  const SizedBox(height: 40),
                  _buildPasswordInputField(),
                  const SizedBox(height: 40),
                  _buildCircularButton(),
                  const SizedBox(height: 20),
                  _buildSignUpText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText(String text, double fontSize, FontWeight fontWeight, {double letterSpacing = 0.0}) {
    return SizedBox(
      width: 420,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'BebasNeue',
              fontWeight: fontWeight,
              color: const Color(0xFF093260),
              letterSpacing: letterSpacing,
            ),
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }

  Widget _buildSubHeaderText(String text, double fontSize, FontWeight fontWeight, {double letterSpacing = 0.0}) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'Poppins-ExtraLightItalic.ttf',
              fontWeight: fontWeight,
              color: const Color(0xFF093260),
              letterSpacing: letterSpacing,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInputField(String hintText, TextEditingController controller, [String? Function(String?)? validator]) {
    return SizedBox(
      width: 420,
      height: 60,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: const Color(0xFF74777F),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
          child: TextFormField(
            controller: controller,
            onChanged: (_) {
              _formKey.currentState?.validate();
            },
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
      ),
    );
  }

  Widget _buildPasswordInputField() {
    return SizedBox(
      width: 420,
      height: 60,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: const Color(0xFF74777F),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
          child: TextFormField(
            controller: _passwordController,
            obscureText: !_showPassword,
            onChanged: (_) {
              _formKey.currentState?.validate();
            },
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
              hintStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Color(0xFF43474E),
                height: 1.2,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton() {
    return Center(
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white24,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.black54),
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              // All fields are valid, proceed with signup
              // You can add your signup logic here
              print('Signup successful!');
            }
          },
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
              text: "Alreay have an account? ",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.5,
                color: Color(0xFF43474E),
              ),
            ),
            TextSpan(
              text: 'Log In',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const loginpage()),);

                },
            ),
          ],
        ),
      ),
    );
  }


  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
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
}
