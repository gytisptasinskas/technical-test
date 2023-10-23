import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scale3c/Components/custom_listTile.dart';
import 'package:scale3c/Controller/authController.dart';
import 'package:scale3c/Theme/theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            foregroundImage:
                                AssetImage('assets/Profile/profile_1.png'),
                          ),
                          Text(
                            'Username',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              const Spacer(),
                              const Text('New York'),
                              SizedBox(width: 14.w),
                              const Icon(
                                Icons.circle,
                                size: 5,
                              ),
                              SizedBox(width: 14.w),
                              const Text('ID: 1120611'),
                              const Spacer(),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Edit',
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 150.w,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kBorderColor,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text('About Me'),
                                  ),
                                ),
                                Obx(
                                  () => authController.isLoading.value
                                      ? const CircularProgressIndicator
                                          .adaptive()
                                      : Container(
                                          width: 150.w,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          decoration: const BoxDecoration(
                                            color: kGreenAccent,
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              authController.signOut();
                                            },
                                            child: const Text(
                                              'Log out',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: kHomeBackground,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            const CustomListTile(
                              icon: Icons.phone,
                              title: "Phone Number",
                              subtitle: "+3788888888",
                            ),
                            SizedBox(height: 16.h),
                            const CustomListTile(
                              icon: Icons.email,
                              title: "Email",
                              subtitle: "user@gmail.com",
                            ),
                            SizedBox(height: 16.h),
                            const CustomListTile(
                              icon: Icons.circle,
                              title: "Completed projects",
                              subtitle: "248",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
