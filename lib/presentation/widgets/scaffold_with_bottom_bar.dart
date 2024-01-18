import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hogwarts_magic_hat_app/presentation/screens/home_screen/home_screen_cubit/home_screen_cubit.dart';

class ScaffoldWithBottomBar extends StatefulWidget {
  const ScaffoldWithBottomBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithBottomBar> createState() => _ScaffoldWithBottomBarState();
}

class _ScaffoldWithBottomBarState extends State<ScaffoldWithBottomBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.navigationShell.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: widget.navigationShell),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black, // Change the color of the top line
                width: 1.0, // Adjust the thickness of the top line
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(0, Icons.home, 'Home'),
                _buildNavItem(1, Icons.list, 'List'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.navigationShell.goBranch(index);
    });
    switch (index) {
      case 0:
        BlocProvider.of<HomeScreenCubit>(context).getRandomCharacter();
        break;
      case 1:
        break;
    }
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    String title,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _onItemTapped(index);
      },
      child: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: _selectedIndex == index ? Colors.black : Colors.grey,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
