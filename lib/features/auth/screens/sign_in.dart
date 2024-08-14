import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walchain/config/app_constants.dart';
import 'package:walchain/core/services/auth_service.dart';
import 'package:walchain/features/auth/bloc/auth_bloc.dart';
import 'package:walchain/features/auth/bloc/auth_event.dart';
import 'package:walchain/features/auth/bloc/auth_state.dart';
import 'package:walchain/features/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocProvider(
        create: (context) => AuthBloc(AuthService()),
        child: FutureBuilder<bool>(
          future: _checkAuthStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data == true) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              });
              return Container();
            } else {
              return const SignInForm();
            }
          },
        ),
      ),
    );
  }

  Future<bool> _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('user_uid');
    return uid != null;
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Center(
                child: SvgPicture.asset(
                  'assets/svgs/logo.svg',
                  width: 177,
                  height: 51,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'LOGIN',
                style: AppTextStyles.titleTextStyle,
              ),
              const SizedBox(height: 20),
              const Text(
                'To get started, please log in with your credentials. We’re excited to have you back!',
                style: AppTextStyles.subTitleTextStyle,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0x0F040F16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InputField(
                hintText: 'Enter Email*',
                controller: emailController,
              ),
              const SizedBox(height: 20),
              InputField(
                hintText: 'Enter Password*',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                text: 'Login',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputFieldBackground,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: AppColors.inputFieldBorderColor,
          width: 1.34,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: AppTextStyles.inputTextStyle,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: AppTextStyles.inputHintTextStyle,
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 74,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.primaryButtonTextStyle,
        ),
      ),
    );
  }
}
