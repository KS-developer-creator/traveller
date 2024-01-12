import 'package:flutter/material.dart';
import 'package:travel/screens/signup.dart';

import 'login.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo at the top
            Container(
              padding: const EdgeInsets.only(left: 4, top: 10),
              alignment: Alignment.topLeft,
              child: Image.asset('assets/welcome-top.png', height: 130),
            ),
            const SizedBox(
              height: 40,
            ),
            // Welcome message in the middle
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 53,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF093260),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Buttons for login and signup at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    width: 138,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFF093260),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const loginpage()));
                        // Add login button functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    width: 138,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFF093260),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const signup()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50.0, // Proper gap between the button rows
            ),
            // Three additional buttons below with a grey background
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add Google sign-in functionality
                    _handleGoogleSignIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0x00d6d5d5),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF245FA6).withOpacity(0.05),
                          offset: const Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/google.png', height: 20),
                        const SizedBox(width: 10),
                        const Text(
                          'Login with Google',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add Facebook sign-in functionality
                    _handleFacebookSignIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0x00d6d5d5),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF245FA6).withOpacity(0.05),
                          offset: const Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/facebook.png', height: 20),
                        const SizedBox(width: 10),
                        const Text(
                          'Login with Facebook',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add Apple sign-in functionality
                    _handleAppleSignIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0x00fdfbff),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF245FA6).withOpacity(0.05),
                          offset: const Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/apple.png', height: 22),
                        const SizedBox(width: 8),
                        const Text(
                          'Login with Apple',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 59.0,
            ),
            // Image at the bottom right
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(right: 16, bottom: 16), // Adjust margin as needed
              child: Image.asset('assets/welcome bottom.png', width: 330,),
            ),
          ],
        ),
      ),
    );
  }

  void _handleGoogleSignIn() {
    // Placeholder for Google sign-in logic
    print("Initiate Google Sign-In");
  }

  void _handleFacebookSignIn() {
    // Placeholder for Facebook sign-in logic
    print("Initiate Facebook Sign-In");
  }

  void _handleAppleSignIn() {
    // Placeholder for Apple sign-in logic
    print("Initiate Apple Sign-In");
  }
}
