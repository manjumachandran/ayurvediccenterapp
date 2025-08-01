import 'package:flutter/material.dart';
import 'package:machne_test/screens/booking_List_Screen.dart';
import 'package:provider/provider.dart';
import 'package:machne_test/providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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

            // Email
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  filled: true,
                  fillColor: const Color(0xffD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            const SizedBox(height: 20),

            // Password
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  filled: true,
                  fillColor: const Color(0xffD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
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

            const SizedBox(height: 30),

            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff006837),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: loginProvider.isLoading
                          ? null
                          : () async {
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please fill all fields"),
                                  ),
                                );
                                return;
                              }

                              final success = await loginProvider.login(email, password);

                              if (success) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const BookingListScreen()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Login failed"),
                                  ),
                                );
                              }
                            },
                      child: loginProvider.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Terms and Conditions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  children: const [
                    TextSpan(text: 'By creating or logging into an account you are agreeing with our '),
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(color: Color(0xff0028FC), fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Color(0xff0028FC), fontWeight: FontWeight.bold),
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
