import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walchain/features/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:walchain/features/bottom_nav/bloc/bottom_nav_state.dart';
import 'package:walchain/features/bottom_nav/screens/bottom_navbar.dart';
import 'package:walchain/features/home/screens/home.dart';
import 'package:walchain/features/map/screens/map_screen.dart';
import 'package:walchain/features/profile/screens/profile_screen.dart';
import 'package:walchain/features/report/screens/report_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Scaffold(
        body: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            int selectedIndex = (state as BottomNavInitial).selectedIndex;

            return IndexedStack(
              index: selectedIndex,
              children: const [
                HomePage(name: 'Shuence', role: 'Rehan',),
                MapScreen(),
                ReportScreen(),
                ProfileScreen(),
              ],
            );
          },
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
