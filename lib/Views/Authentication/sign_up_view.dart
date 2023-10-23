import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scale3c/Controller/authController.dart';
import 'package:scale3c/Theme/theme.dart';
import 'package:scale3c/Views/Home/home_view.dart';

import '../../Components/components.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthController authController = Get.find();

  bool validateSignUpData() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty || !email.contains('@')) {
      Get.snackbar('Error', 'Please enter a valid email address.');
      return false;
    }

    if (password.isEmpty || password.length < 6) {
      Get.snackbar('Error',
          'Please enter a password that is at least 6 characters long.');
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match.');
      return false;
    }

    return true;
  }

  void handleSignUp() async {
    if (!validateSignUpData()) {
      return;
    }
    String email = _emailController.text;
    String password = _passwordController.text;
    await authController.signUp(email, password).then((_) {
      if (authController.currentUser != null) {
        Get.off(() => HomeView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Sign Up',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/Illiustrations/auth_image_2.png',
                    height: 145,
                  ),
                  SizedBox(height: 45.h),
                  CustomTextField(
                    hintText: 'Enter email',
                    controller: _emailController,
                    obscureText: false,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter Password',
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Confirm Password',
                    controller: _confirmPasswordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => authController.isLoading.value
                        ? const CircularProgressIndicator.adaptive()
                        : CustomButton(
                            text: 'Sign Up',
                            color: kGreenAccent,
                            width: Get.width,
                            onPressed: () {
                              handleSignUp();
                            },
                            textColor: Colors.white,
                          ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'or',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[600],
                        ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child:
                            SvgPicture.asset('assets/Icons/Facebook_icon.svg'),
                      ),
                      InkWell(
                        onTap: () {},
                        child:
                            SvgPicture.asset('assets/Icons/Twitter_icon.svg'),
                      ),
                      InkWell(
                        onTap: () {},
                        child:
                            SvgPicture.asset('assets/Icons/Linkedin_icon.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'Sign In',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: kOrangeAccent,
                                    decoration: TextDecoration.underline,
                                    decorationColor: kOrangeAccent,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
