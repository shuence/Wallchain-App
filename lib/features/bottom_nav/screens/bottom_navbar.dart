import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walchain/config/app_constants.dart';
import 'package:walchain/features/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:walchain/features/bottom_nav/bloc/bottom_nav_event.dart';
import 'package:walchain/features/bottom_nav/bloc/bottom_nav_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        int selectedIndex = (state as BottomNavInitial).selectedIndex;

        return BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            context.read<BottomNavBloc>().add(BottomNavTabChanged(index));
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 0 ? AssetPaths.homeFilled : AssetPaths.home,
                width: 24,
                height: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 1 ? AssetPaths.mapFilled : AssetPaths.map,
                width: 24,
                height: 24,
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 2
                    ? AssetPaths.reportFilled
                    : AssetPaths.report,
                width: 24,
                height: 24,
              ),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 3
                    ? AssetPaths.profileFilled
                    : AssetPaths.profile,
                width: 24,
                height: 24,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: const Color(0xFF040F16), // Selected item color
          unselectedItemColor:
              const Color(0xFF040F16).withOpacity(0.6), // Unselected item color
        );
      },
    );
  }
}
