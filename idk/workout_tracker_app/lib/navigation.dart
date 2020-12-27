import 'package:flutter/material.dart';
import 'package:workout_tracker_app/pages/ui_profile.dart';
import 'package:workout_tracker_app/pages/ui_log.dart';
import 'package:workout_tracker_app/pages/ui_workout.dart';
import 'package:workout_tracker_app/pages/ui_diet.dart';
//import 'src/user.dart';
import 'src/model.dart';

class NavigationBar extends StatefulWidget {
  int index;
  final User user;
  NavigationBar(this.index, this.user);
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
            if (widget.index == i) {
              //do nothing
              return;
            } else
              widget.index = i;
            if (widget.index == 0) {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'Home', arguments: widget.user);
            } else if (widget.index == 1) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DietPage(widget.user);
                  },
                ),
              );
            } else if (widget.index == 2) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WorkoutPage(widget.user);
                  },
                ),
              );
            } else if (widget.index == 3) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LogPage(widget.user);
                  },
                ),
              );
            } else if (widget.index == 4) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage(widget.user);
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
          icon: Icon(Icons.local_dining),
          label: 'Diet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Workout',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          label: 'Log',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        )
      ],
    );
  }
}
