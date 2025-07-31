import 'package:flutter/material.dart';
import 'package:machne_test/screens/bookingList_Screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with background + logo
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo_make_11_06_2023_115 1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Image.asset(
                      'assets/images/Asset 1 2.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Header text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login or register to book your appointments',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Email field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  filled: true,
                  fillColor: Color(0xffD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            const SizedBox(height: 20),

            // Password field
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  filled: true,
                  fillColor: const Color(0xffD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            // Login Button
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child: SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff006837), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BookingListScreen()),
      );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login button pressed")),
        );
      },
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white, 
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),

 const SizedBox(height: 30),
            // Terms and Conditions text
            // Terms and Conditions text with blue highlights
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        fontSize: 13,
        color: Colors.grey[700],
      ),
      children: const [
        TextSpan(
            text: 'By creating or logging into an account you are agreeing with our '),
        TextSpan(
          text: 'Terms and Conditions',
          style: TextStyle(
            color: Color(0xff0028FC),
            fontWeight: FontWeight.bold,
          ),
          // Add recognizer here if you want it tappable
        ),
        TextSpan(text: ' and '),
        TextSpan(
          text: 'Privacy Policy',
          style: TextStyle(
            color: Color(0xff0028FC),
            fontWeight: FontWeight.bold,
          ),
          // Add recognizer here if you want it tappable
        ),
        TextSpan(text: '.'),
      ],
    ),
  ),
),


            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
