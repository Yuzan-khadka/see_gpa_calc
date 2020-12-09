import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:see_gpa_generator/screens/history_screen.dart';
import 'package:see_gpa_generator/screens/home_screen.dart';
import 'package:see_gpa_generator/screens/method_screen.dart';
import 'package:see_gpa_generator/shared/constant.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kTileColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: const Text('SEE GPA Calculator'),
              ),
            ),
            _NavTile(
              icon: MdiIcons.calculatorVariant,
              title: 'Calculate',
              route: HomeScreen.route,
            ),
            _NavTile(
              icon: MdiIcons.bookOpenPageVariant,
              title: 'Method',
              route: MethodScreen.route,
            ),
            _NavTile(
              icon: MdiIcons.history,
              title: 'History',
              route: HistoryScreen.route,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  _NavTile({
    @required this.title,
    @required this.icon,
    @required this.route,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _navigate(context, route),
       child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 30.0,
              ),
              child: Icon(
                icon,
                size: 27.0,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Function _navigate(BuildContext context, String route) {
    final String currentRoute = ModalRoute.of(context).settings.name;
    if (route == currentRoute) {
      return () => Navigator.pop(context);
    } else {
      return () => Navigator.of(context).pushReplacementNamed(route);
    }
  }
}
