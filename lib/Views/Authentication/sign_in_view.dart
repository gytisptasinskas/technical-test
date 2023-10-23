import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scale3c/Components/components.dart';
import 'package:scale3c/Controller/authController.dart';
import 'package:scale3c/Theme/theme.dart';
import 'package:scale3c/Views/Authentication/sign_up_view.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController authController = Get.find();

  bool validateEmailAndPassword() {
    String email = _userNameController.text;
    String password = _passwordController.text;

    if (email.isEmpty || !email.contains('@')) {
      Get.snackbar('Error', 'Please enter a valid email address.');
      return false;
    }

    if (password.isEmpty || password.length < 6) {
      Get.snackbar('Error',
          'Please enter a password that is at least 6 characters long.');
      return false;
    }

    return true;
  }

  void handleSignIn() async {
    if (!validateEmailAndPassword()) {
      return;
    }

    String email = _userNameController.text;
    String password = _passwordController.text;

    await authController.signIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Sign In',
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/Illiustrations/auth_image_1.png',
                    height: 145,
                  ),
                  SizedBox(height: 50.h),
                  CustomTextField(
                    hintText: 'Username',
                    controller: _userNameController,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 14.h),
                  Container(
                    alignment: Alignment.centerRight,
                    width: Get.width,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      onPressed: () {},
                      child: Text(
                        'Forgot your password?',
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[600],
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Obx(
                    () => authController.isLoading.value
                        ? const CircularProgressIndicator.adaptive()
                        : CustomButton(
                            onPressed: handleSignIn,
                            text: 'Login',
                            color: kGreenAccent,
                            width: Get.width,
                            textColor: Colors.white,
                          ),
                  ),
                  SizedBox(height: 16.h),
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
                        'Don\'t have an account?',
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignUpView());
                        },
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: kOrangeAccent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kOrangeAccent),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
