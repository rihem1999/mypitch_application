import 'package:flutter/material.dart';
import 'package:mypitch_application/viewmodels/auth_viewmodel.dart';
import 'package:mypitch_application/views/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double logoWidth =
        screenWidth * 0.4; // 30% of the screen width for the logo

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171A25),
      ),
      backgroundColor: const Color(0xFF171A25), // Set the background color
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo-full.svg', // Ensure the path is correct
                width: logoWidth, // Set the logo width
              ),
              const SizedBox(
                  height:
                      16.0), // Add some spacing between the logo and the welcome text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'the essence of every match\n at your fingertips.\n'
                          .toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Automatically.'.toUpperCase(),
                      style: const TextStyle(
                        color: Color.fromRGBO(116, 229, 144, 1.0),
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height:
                      32.0), // Add some spacing between the welcome text and text fields
              Container(
                width: screenWidth * 0.7, // 70% of the available width
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(6.0), // Set the border radius
                  color: Colors.white, // Set the background color
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none, // Remove the default border
                    contentPadding: EdgeInsets.symmetric(
                        horizontal:
                            16.0), // Optional: Add padding inside the TextField
                  ),
                ),
              ),
              const SizedBox(
                  height: 16.0), // Add some spacing between the fields
              Container(
                width: screenWidth * 0.7, // 70% of the available width
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(6.0), // Set the border radius
                  color: Colors.white, // Set the background color
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none, // Remove the default border
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal:
                            16.0), // Optional: Add padding inside the TextField
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 16.0), // Add some spacing between the fields
              SizedBox(
                width: screenWidth * 0.7, // 70% of the available width
                child: ElevatedButton(
                  onPressed: () async {
                    await Provider.of<AuthViewModel>(context, listen: false)
                        .login(_emailController.text, _passwordController.text);
                    if (Provider.of<AuthViewModel>(context, listen: false)
                        .isAuthenticated) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                    } else {
                      // Afficher une erreur
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(
                        116, 229, 144, 1.0), // Set the button background color
                    textStyle: const TextStyle(
                      fontSize: 16.0, // Set the font size
                      color: Colors.white, // Set the text color
                    ),
                    minimumSize: const Size(0, 50), // Set the minimum height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6.0), // Set the border radius
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF171A25),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  // Handle forgot password
                },
                child: const Text(
                  'Forgot your password ?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Or',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Divider(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: screenWidth * 0.7,
                child: OutlinedButton.icon(
                  icon: Image.asset(
                    'assets/icons/gmail.png', // Ensure the path is correct
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: const Text('Continue with Google', style: TextStyle(
                    fontFamily: 'Montserrat'
                  ),),
                  onPressed: () {
                    // Handle Google login
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF171A25),
                    foregroundColor: Colors.white,
                    side: const BorderSide(
                      color: Color.fromRGBO(116, 229, 144,
                          1.0), // Set the button background color
                    ), // Set the border color
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                    ),
                    minimumSize: const Size(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: screenWidth * 0.7,
                child: OutlinedButton.icon(
                  icon: Image.asset(
                    'assets/icons/apple.png', // Ensure the path is correct
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: const Text('Continue with Facebook', style: TextStyle(
                    fontFamily: 'Montserrat'
                  ),),
                  onPressed: () {
                    // Handle Facebook login
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF171A25),
                    foregroundColor: Colors.white,
                    side: const BorderSide(
                      color: Color.fromRGBO(116, 229, 144,
                          1.0), // Set the button background color
                    ), // Set the border color
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                    ),
                    minimumSize: const Size(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
