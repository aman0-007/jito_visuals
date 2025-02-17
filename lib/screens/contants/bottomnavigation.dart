import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jito_visuals/screens/admin/Dashboard/dashboard.dart';
import 'package:jito_visuals/screens/admin/profile/profile_screen.dart';
import 'package:jito_visuals/screens/onboard/theme/colors.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class TripLinkBottomNavigation extends StatefulWidget {
  const TripLinkBottomNavigation({super.key});

  @override
  State<TripLinkBottomNavigation> createState() => _TripLinkBottomNavigationState();
}

class _TripLinkBottomNavigationState extends State<TripLinkBottomNavigation> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    Dashboard(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex], // Displays the selected page
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex, // Updates the current index when an item is clicked
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              homeIcon,
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.string(
              homeIcon,
              colorFilter: const ColorFilter.mode(
                SplashColors.lightOrange,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.string(
          //     heartIcon,
          //     colorFilter: const ColorFilter.mode(
          //       inActiveIconColor,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   activeIcon: SvgPicture.string(
          //     heartIcon,
          //     colorFilter: const ColorFilter.mode(
          //       SplashColors.lightOrange,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   label: "Fav",
          // ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.string(
          //     chatIcon,
          //     colorFilter: const ColorFilter.mode(
          //       inActiveIconColor,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   activeIcon: SvgPicture.string(
          //     chatIcon,
          //     colorFilter: const ColorFilter.mode(
          //       SplashColors.lightOrange,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   label: "Chat",
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              userIcon,
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.string(
              userIcon,
              colorFilter: const ColorFilter.mode(
                SplashColors.lightOrange,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

const homeIcon = '''<svg width="22" height="21" viewBox="0 0 22 21" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M19.8727 9.98723C19.8613 9.99135 19.8519 9.99858 19.8416 10.0048C19.5363 10.1967 19.1782 10.3112 18.7909 10.3112C17.7029 10.3112 16.8174 9.43215 16.8174 8.35192C16.8174 8.00938 16.5391 7.73185 16.1955 7.73185C15.8508 7.73185 15.5726 8.00938 15.5726 8.35192C15.5726 9.43215 14.687 10.3112 13.6001 10.3112C12.5121 10.3112 11.6265 9.43215 11.6265 8.35192C11.6265 8.00938 11.3483 7.73185 11.0046 7.73185C10.66 7.73185 10.3817 8.00938 10.3817 8.35192C10.3817 9.43215 9.49617 10.3112 8.4092 10.3112C7.32119 10.3112 6.43563 9.43215 6.43563 8.35192C6.43563 8.00938 6.1574 7.73185 5.81377 7.73185C5.46909 7.73185 5.19086 8.00938 5.19086 8.35192C5.19086 9.43215 4.3053 10.3112 3.21834 10.3112C2.84563 10.3112 2.49992 10.2029 2.20196 10.0275C2.17393 10.012 2.14902 9.99548 2.11891 9.98413C1.59152 9.64056 1.24165 9.06692 1.23646 8.45406L2.17497 2.87958C2.33381 1.92832 3.15397 1.23912 4.1257 1.23912H17.8825C18.8543 1.23912 19.6744 1.92832 19.8333 2.88061L20.7635 8.35192C20.7635 9.03493 20.4084 9.63644 19.8727 9.98723ZM19.4834 17.7965C19.4834 18.8798 18.5968 19.7619 17.5057 19.7619H14.2271V15.2109C14.2271 14.8694 13.9479 14.5919 13.6042 14.5919H8.40401C8.06037 14.5919 7.78111 14.8694 7.78111 15.2109V19.7619H4.50256C3.41144 19.7619 2.52484 18.8798 2.52484 17.7965V11.4709C2.74804 11.5194 2.97956 11.5503 3.21834 11.5503C4.28246 11.5503 5.2272 11.0344 5.81377 10.241C6.3993 11.0344 7.34403 11.5503 8.4092 11.5503C9.47333 11.5503 10.4181 11.0344 11.0046 10.241C11.5902 11.0344 12.5349 11.5503 13.6001 11.5503C14.6642 11.5503 15.6089 11.0344 16.1955 10.241C16.781 11.0344 17.7258 11.5503 18.7909 11.5503C19.0297 11.5503 19.2602 11.5194 19.4834 11.4698V17.7965ZM9.02588 19.7619H12.9824V15.831H9.02588V19.7619ZM21.0625 2.67633C20.8029 1.12563 19.4657 0 17.8825 0H4.1257C2.54249 0 1.20532 1.12563 0.945776 2.67633L0 8.35192C0 9.38882 0.507667 10.3029 1.27903 10.8879V17.7965C1.27903 19.5628 2.7252 21 4.50256 21H17.5057C19.283 21 20.7292 19.5628 20.7292 17.7965V10.8797C21.4995 10.2844 22.0051 9.34652 21.9999 8.24875L21.0625 2.67633Z" fill="#FF7643"/></svg>''';

// const heartIcon = '''<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M11 0C4.92487 0 0 4.92487 0 11C0 17.0751 4.92487 22 11 22C17.0751 22 22 17.0751 22 11C22 4.92487 17.0751 0 11 0ZM11 20C6.02944 20 2 15.9706 2 11C2 6.02944 6.02944 2 11 2C15.9706 2 20 6.02944 20 11C20 15.9706 15.9706 20 11 20ZM18.5 14L15 8L11 13L7 8L3.5 14H18.5ZM11 10.5L12.5 12H9.5L11 10.5Z" fill="#B6B6B6"/></svg>''';
//
// const chatIcon = '''<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M18.5 2H3.5C2.67157 2 2 2.67157 2 3.5V18.5C2 19.3284 2.67157 20 3.5 20H18.5C19.3284 20 20 19.3284 20 18.5V3.5C20 2.67157 19.3284 2 18.5 2ZM3.5 0C1.567 0 0 1.567 0 3.5V18.5C0 20.433 1.567 22 3.5 22H18.5C20.433 22 22 20.433 22 18.5V3.5C22 1.567 20.433 0 18.5 0H3.5ZM5 5H17V7H5V5ZM5 9H17V11H5V9ZM5 13H17V15H5V13ZM5 17H12V19H5V17Z" fill="#B6B6B6"/></svg>''';

const userIcon = '''<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M20.3955 20.1586C20.1123 20.5122 19.6701 20.723 19.2127 20.723H2.78733C2.32989 20.723 1.8877 20.5122 1.60452 20.1586C1.33768 19.8263 1.24619 19.4248 1.3453 19.0275C2.44207 14.678 6.41199 11.6395 11.0005 11.6395C15.588 11.6395 19.5579 14.678 20.6547 19.0275C20.7538 19.4248 20.6623 19.8263 20.3955 20.1586ZM6.35536 5.8203C6.35536 3.31645 8.43888 1.27802 11.0005 1.27802C13.5611 1.27802 15.6446 3.31645 15.6446 5.8203C15.6446 8.32522 13.5611 10.3615 11.0005 10.3615C8.43888 10.3615 6.35536 8.32522 6.35536 5.8203ZM21.9235 18.7219C20.939 14.8154 17.9068 11.8451 14.1035 10.7843C15.8102 9.75979 16.9516 7.91838 16.9516 5.8203C16.9516 2.61141 14.2821 0 11.0005 0C7.71787 0 5.04839 2.61141 5.04839 5.8203C5.04839 7.91838 6.18981 9.75979 7.89649 10.7843C4.09321 11.8451 1.06104 14.8154 0.0764552 18.7219C-0.118501 19.4962 0.0633855 20.3077 0.576371 20.9456C1.11223 21.6166 1.91928 22 2.78733 22H19.2127C20.0807 22 20.8878 21.6166 21.4236 20.9456C21.9366 20.3077 22.1185 19.4962 21.9235 18.7219Z" fill="#B6B6B6"/></svg>''';
