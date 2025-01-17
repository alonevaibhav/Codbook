import 'package:codbook/Helper/responsive.dart';
import 'package:codbook/View/Welcomepage/WelcomePageMobile.dart';
import 'package:codbook/View/Welcomepage/welcome_page_tab.dart';
import 'package:codbook/View/Welcomepage/welcome_page_web.dart';
import 'package:flutter/cupertino.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Welcomepagemobile(),
        tablet: WelcomePageTab(),
        desktop: WelcomePageWeb());
  }
}
