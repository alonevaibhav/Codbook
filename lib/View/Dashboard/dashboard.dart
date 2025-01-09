import 'package:codbook/Helper/responsive.dart';
import 'package:codbook/View/Dashboard/dashboard_mobile.dart';
import 'package:codbook/View/Dashboard/dashboard_tab.dart';
import 'package:codbook/View/Dashboard/dashboard_web.dart';
import 'package:flutter/cupertino.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: DashboardMobile(),
        tablet: DashboardTab(),
        desktop: DashboardWeb());
  }
}
