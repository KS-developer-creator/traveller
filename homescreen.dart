import 'package:flutter/material.dart';
import 'package:travellers/screens/login.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo at the top
            Container(
              padding: EdgeInsets.only(left: 4, top: 10),
              alignment: Alignment.topLeft,
              child: Image.asset('assets/welcome-top.png', height: 100),
            ),
            SizedBox(
              height: 40,
            ),
            // Welcome message in the middle
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 53,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF093260),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Buttons for login and signup at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF093260),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()),);
                        // Add login button functionality
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 8.0),
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF093260),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add signup button functionality
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 38.0, // Proper gap between the button rows
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
                    primary: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xD6D5D5),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF245FA6).withOpacity(0.05),
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/googlelogo.png', height: 20),
                        SizedBox(width: 10),
                        Text(
                          'Login with Google',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add Facebook sign-in functionality
                    _handleFacebookSignIn();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xD6D5D5),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF245FA6).withOpacity(0.05),
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/facebooklogo.png', height: 20),
                        SizedBox(width: 10),
                        Text(
                          'Login with Facebook',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add Apple sign-in functionality
                    _handleAppleSignIn();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xFDFBFF),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF245FA6).withOpacity(0.05),
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/applelogo.png', height: 22),
                        SizedBox(width: 8),
                        Text(
                          'Login with Apple',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 56.0,
            ),
            // Image at the bottom right
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 16, bottom: 16), // Adjust margin as needed
              child: Image.asset('assets/welcome bottom.png', width: 230,),
            ),
          ],
        ),
      ),
    );
  }

  // Example method for Google sign-in
  void _handleGoogleSignIn() {
    // Add your Google sign-in logic here
    print("Initiate Google Sign-In");
  }

  // Example method for Facebook sign-in
  void _handleFacebookSignIn() {
    // Add your Facebook sign-in logic here
    print("Initiate Facebook Sign-In");
  }

  // Example method for Apple sign-in
  void _handleAppleSignIn() {
    // Add your Apple sign-in logic here
    print("Initiate Apple Sign-In");
  }
}
