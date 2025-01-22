import 'package:flutter/material.dart';

import '../../components/buttons.dart';

class ZoneViewPage extends StatelessWidget {
  final List<Map<String, dynamic>> zones = [
    {
      "buttonText": "Mumbai Z",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiNGJhNDhjMDEtOGJkMi00YjQ3LThiZTgtMjM2YTA3Yjc5NWZhIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.location_city
    },
    {
      "buttonText": "TNPTS Z",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiODJjNzdiZWItMDI3NS00N2NmLTllMDYtMzNmOTNmOTRiN2NkIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.pin_drop
    },
    {
      "buttonText": "Gujarat Z",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiZmJiMjE0MzktOGRhNi00OGJkLTkzZjAtYWYwODMwZjM2ZDFkIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.map
    },
    {
      "buttonText": "East",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiNTQwYjBjZjMtZTEzNS00NDExLWE4YmEtMmZjNDJiNTcyMGMyIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.east
    },
    {
      "buttonText": "North",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiYzU3NmQyMGYtZmQzMS00MDFlLTlmMDUtMjA0NjI5ZDdlNDUxIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.north
    },
    {
      "buttonText": "MPCG",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiZGFjMWI2MmYtYTMyMC00MzJiLTkyZDEtZDhhYTk3OTRhMDdiIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.terrain
    },
    {
      "buttonText": "KKG",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiYTQ4OTRlN2UtMzc1Ny00ZTVjLTkzY2EtNWM4NWVmZWUwMjZlIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.landscape
    },
    {
      "buttonText": "ROM",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiZTUwNjI5NzctNjdlNi00ZDIyLTk1ODctOWQ1ZWFiNDNjMGRiIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.location_on
    },
    {
      "buttonText": "Rajasthan",
      "url": "https://app.powerbi.com/view?r=eyJrIjoiNjRjMjQ1ZmEtY2JlZS00YzE3LTg3NzQtZmJjYzZiMWI2ODVkIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
      "icon": Icons.sunny
    },
  ];

  ZoneViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zone View"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Display 2 buttons per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 7, // Make buttons square
          ),
          itemCount: zones.length,
          itemBuilder: (context, index) {
            return BodOptionButtons(
              buttonText: zones[index]["buttonText"],
              url: zones[index]["url"],
              icon: zones[index]["icon"],
            );
          },
        ),
      ),
    );
  }
}