import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scale3c/Theme/theme.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kBorderColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(27, 18, 0, 18),
        child: Row(
          children: [
            Icon(
              icon,
              color: kOrangeAccent,
            ),
            SizedBox(width: 27.w),
            const SizedBox(
              height: 50,
              child: VerticalDivider(
                color: kBorderColor,
                thickness: 1,
                width: 20,
              ),
            ),
            SizedBox(width: 22.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
