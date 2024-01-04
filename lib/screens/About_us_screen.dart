import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/widgets/custom_text.dart';

class AboutScreen extends StatelessWidget {
  static String id = 'AboutUs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: CustomText(
              text:
                  'ClubMovies is an online paid streaming service providing original movies and TV shows. The terms of ClubMovies do not disclose whether any social interactions are available between users, or whether any personal information or content may be made publicly visible to others. Netflixs terms say they collect personal information such as name, email addresses, postal code, payment method, telephone number, and other information collected automatically when users visit the Service. The terms of Netflix also state they disclose or share personal information with other companies, agents, or contractors ("Service Providers") to perform services on their behalf or to assist with the provision of services. The terms also state Netflix does sell users personal information to third parties for profit.',
              size: 18.sp,
              color: Colors.black)),
    );
  }
}
