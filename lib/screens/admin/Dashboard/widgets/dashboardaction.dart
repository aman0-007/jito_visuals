import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jito_visuals/screens/admin/Dashboard/widgets/dashboardactionbutton.dart';
import 'package:jito_visuals/screens/admin/dashcharts/dashboardchart_screen.dart';
import 'package:jito_visuals/screens/admin/team/alluserlist_screen.dart';
import 'package:jito_visuals/screens/contants/screen_change_anim.dart';
import 'package:jito_visuals/screens/users/BOD/customwebview.dart';

class DashboardActions extends StatelessWidget {
  final bool isSmallScreen;
  const DashboardActions({required this.isSmallScreen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final String? userType = box.read('user_data')?['userType'];

    List<Widget> dashboardActions = [];

    if (userType == 'admin') {
      dashboardActions = [
        DashboardActionButton(icon: Icons.calendar_today, label: 'Sameeksha Scorecard', color: const Color(0xFF00537A)),
        DashboardActionButton(icon: Icons.task_alt, label: 'Events Overview', color: const Color(0xFFF5A201)),
        DashboardActionButton(
          icon: Icons.bar_chart,
          label: 'Dashboard',
          color: const Color(0xFF00537A),
          onTap: () {
            Navigator.push(
              context,
              AnimatedPageTransition(
                page: DashboardchartScreen(),
                transitionType: TransitionType.slideFromBottom,
              ),
            );
          },
        ),
        DashboardActionButton(
          icon: Icons.people,
          label: 'Team',
          color: const Color(0xFFF5A201),
          onTap: () {
            Navigator.push(
              context,
              AnimatedPageTransition(
                page: AlluserlistScreen(),
                transitionType: TransitionType.slideFromBottom,
              ),
            );
          },
        ),
      ];
    } else if (userType == 'PROJECT') {
      dashboardActions = [
        DashboardActionButton(
            icon: Icons.task_alt,
            label: 'Events Overview',
            color: const Color(0xFFF5A201),
          onTap: () {
            Navigator.of(context).push(CustomWebViewPageRoute(
              url: 'https://app.powerbi.com/view?r=eyJrIjoiYmEyY2Y3OWUtYzczYi00YjNmLTg5ODEtMjYwZjNkMWNjYzM1IiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9',
              title: 'Project Events',
            ));
          },
        ),
      ];
    }

    return dashboardActions.isNotEmpty
        ? GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: isSmallScreen ? 2 : 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: dashboardActions,
    )
        : const SizedBox(); // If no actions, return an empty widget
  }
}
