import 'package:flutter/material.dart';
import 'package:walchain/features/auth/screens/sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(color: Color(0xFFFBFBFF)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.87, // 87% of the screen width
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome To ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'General Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'WALLCHAIN',
                      style: TextStyle(
                        color: Color(0xFF560CF4),
                        fontSize: 48,
                        fontFamily: 'General Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size.height * 0.05), // 5% of the screen height
            SizedBox(
              width: size.width * 0.77, // 77% of the screen width
              child: const Text(
                'Your Efficient Supply Chain Solution!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF302A2A),
                  fontSize: 20,
                  fontFamily: 'General Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.1), // 10% of the screen height
            Container(
              width: size.width * 0.92, // 92% of the screen width
              height: size.height * 0.3, // 30% of the screen height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/welcome.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.1), // 10% of the screen height
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: const Color(0xFFFF9F1C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
      ),
      )
    );
  }
}
