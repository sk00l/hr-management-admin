import 'package:admin_pannel/core/constants/app_color.dart';
import 'package:admin_pannel/presentation/home/widgets/dialog_container.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';

class NavigationRailWidget extends StatefulWidget {
  const NavigationRailWidget({super.key});

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leading: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => FluidDialog(
              rootPage: FluidDialogPage(
                  alignment: Alignment.center,
                  builder: (context) => const DialogContainer()),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      minWidth: 200,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColor.backgroundColor,
      useIndicator: true,
      elevation: 5,
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle:
          const TextStyle(color: Colors.white, fontSize: 20),
      unselectedLabelTextStyle:
          TextStyle(color: Colors.grey.shade700, fontSize: 16),
      onDestinationSelected: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      selectedIndex: selectedIndex,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(
            Icons.home,
            size: 30,
          ),
          label: Text("home"),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.favorite,
            size: 30,
          ),
          label: Text("favorite"),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.settings,
            size: 30,
          ),
          label: Text("settings"),
        ),
      ],
    );
  }
}
