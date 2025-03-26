import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jito_visuals/screens/admin/Dashboard/widgets/dashboardactionbutton.dart';
import 'package:jito_visuals/screens/admin/dashcharts/dashboardchart_screen.dart';
import 'package:jito_visuals/screens/admin/team/alluserlist_screen.dart';
import 'package:jito_visuals/screens/contants/screen_change_anim.dart';
import '../../../webview/webview_route.dart';

class DashboardActions extends StatelessWidget {
  final bool isSmallScreen;
  const DashboardActions({required this.isSmallScreen, super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final String? userType = box.read('user_data')?['userType'];

    List<Widget> dashboardActions = [];

    if (userType == 'admin') {
      dashboardActions = [
        DashboardActionButton(
            icon: Icons.calendar_today,
            label: 'Sameeksha Scorecard',
            color: const Color(0xFF00537A),
          onTap: () {
            Navigator.of(context).push(CustomWebViewPageRoute(
              url: 'https://app.powerbi.com/view?r=eyJrIjoiMmNlMGIzMDQtYjMwMy00ZGQ0LTllZjItNzQxZjEwOGU2MDI0IiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9',
              title: 'Sameeksha Scorecard',
            ));
          },
        ),
        DashboardActionButton(
            icon: Icons.task_alt,
            label: 'Events Overview',
            color: const Color(0xFFF5A201),
          onTap: () {
            Navigator.of(context).push(CustomWebViewPageRoute(
              url: 'https://app.powerbi.com/view?r=eyJrIjoiNmJmMDU3MDktOGU1Ny00OTEyLTkxYjMtNDRmNzlmMTQ4MGZlIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9',
              title: 'Events Overview',
            ));
          },
        ),
        DashboardActionButton(
          icon: Icons.bar_chart,
          label: 'Dashboard',
          color: const Color(0xFF00537A),
          onTap: () {
            Navigator.push(
              context,
              AnimatedPageTransition(
                page: const DashboardchartScreen(),
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
    } else if (userType == 'APEX') {
      dashboardActions = [
        DashboardActionButton(
          icon: Icons.task_alt,
          label: 'JITO Activities Scorecard',
          color: const Color(0xFFF5A201),
          onTap: () {
            Navigator.of(context).push(CustomWebViewPageRoute(
              url: box.read('user_data')?['link'],
              title: 'JITO Activities Scorecard',
            ));
          },
        ),
      ];
    } else if (userType == 'ZONE') {
      String email = box.read('user_data')?['email'] ?? '';
      String labelText = email.split('.')[0].toUpperCase(); // Extracting part before the first dot and converting to uppercase

      dashboardActions = [
        DashboardActionButton(
          icon: Icons.task_alt,
          label: '$labelText Zone Events Overview', // Using the extracted part of the email
          color: const Color(0xFFF5A201),
          onTap: () {
            Navigator.of(context).push(CustomWebViewPageRoute(
              url: box.read('user_data')?['link'],
              title: '$labelText Dashboard',
            ));
          },
        ),
      ];
    }

    if (dashboardActions.isEmpty) {
      return const SizedBox(); // If no actions, return an empty widget
    } else if (dashboardActions.length == 1) {
      return Center(
        child: SizedBox(
          width: 200, // Adjust width to match grid items
          height: 200, // Adjust height to match grid items
          child: dashboardActions.first,
        ),
      );
    } else {
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: isSmallScreen ? 2 : 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: dashboardActions,
      );
    }
  }
}
