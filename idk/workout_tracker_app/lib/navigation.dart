import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_profile.dart';
import 'package:workout_tracker_app/pages/ui_log.dart';
import 'package:workout_tracker_app/pages/ui_workout.dart';
import 'package:workout_tracker_app/pages/ui_diet.dart';

class NavigationBar extends StatefulWidget {
  int index;
  String username;
  NavigationBar(this.index);
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.index,
      onTap: (int i) {
        setState(
              () {
            widget.index = i;
            if (widget.index == 0) {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'Home');
            } else if (widget.index == 1) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Diet();
                  },
                ),
              );
            } else if (widget.index == 2) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Workout();
                  },
                ),
              );
            } else if (widget.index == 3) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Log();
                  },
                ),
              );
            } else if (widget.index == 4) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Profile();
                  },
                ),
              );
            }
          },
        );
      },
      fixedColor: Colors.black,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/food-fork-drink.png'),
          label: 'Diet',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/dumbbell.png'),
          label: 'Exercise',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Log',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'Profile',
        )
      ],
    );
  }
}
