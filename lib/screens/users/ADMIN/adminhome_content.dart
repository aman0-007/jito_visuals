import 'package:flutter/material.dart';

import '../components/banner.dart';
import '../components/bodtop.dart';
import '../components/buttons.dart';


class HomescreenAdminContent extends StatelessWidget {
  const HomescreenAdminContent({super.key});

  @override
  Widget build(BuildContext context){
    return const Column(
      children: [
        CombinedTextWithImage(),
        TopBanner(imgname: "assets/bod/BOD.jpg"),

        BodOptionButtons(
          buttonText: "Zones & Chapter Events",
          url: "https://app.powerbi.com/view?r=eyJrIjoiNmJmMDU3MDktOGU1Ny00OTEyLTkxYjMtNDRmNzlmMTQ4MGZlIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
          icon: Icons.location_on, // Icon for Zones & Chapter Events
        ),
        BodOptionButtons(
          buttonText: "Project Events",
          url: "https://app.powerbi.com/view?r=eyJrIjoiYmEyY2Y3OWUtYzczYi00YjNmLTg5ODEtMjYwZjNkMWNjYzM1IiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
          icon: Icons.assignment, // Icon for Project Events
        ),
        BodOptionButtons(
          buttonText: "Sameeksha Dashboard",
          url: "https://app.powerbi.com/view?r=eyJrIjoiMmNlMGIzMDQtYjMwMy00ZGQ0LTllZjItNzQxZjEwOGU2MDI0IiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
          icon: Icons.dashboard, // Icon for Sameeksha Dashboard
        ),
        BodOptionButtons(
          buttonText: "Mumbai Zone Events Overview",
          url: "https://app.powerbi.com/view?r=eyJrIjoiNGJhNDhjMDEtOGJkMi00YjQ3LThiZTgtMjM2YTA3Yjc5NWZhIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
          icon: Icons.location_city, // Icon for Mumbai Zone Events Overview
        ),
        BodOptionButtons(
          buttonText: "TNAPTS Zone Events Overview",
          url: "https://app.powerbi.com/view?r=eyJrIjoiODJjNzdiZWItMDI3NS00N2NmLTllMDYtMzNmOTNmOTRiN2NkIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
          icon: Icons.flag, // Icon for TNAPTS Zone Events Overview
        ),
        BodOptionButtons(
          buttonText: "Gujarat Zone Events Overview",
          url: "https://app.powerbi.com/view?r=eyJrIjoiZmJiMjE0MzktOGRhNi00OGJkLTkzZjAtYWYwODMwZjM2ZDFkIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
          icon: Icons.map, // Icon for Gujarat Zone Events Overview
        ),
      ],
    );
  }
}