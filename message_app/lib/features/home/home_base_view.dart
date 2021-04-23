import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:message_app/core/widgets/switch_case_widget.dart';
import 'package:message_app/features/home/messages/view/messages_view.dart';

class HomeBaseView extends StatefulWidget {
  @override
  _HomeBaseViewState createState() => _HomeBaseViewState();
}

class _HomeBaseViewState extends State<HomeBaseView> {

  var _currentIndex = HomeViewItems.MESSAGES.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentView,
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget get _buildCurrentView {
    return SwitchCase(
      value: _currentIndex,
      cases: [
        Case(widget: MessagesView(), value: HomeViewItems.MESSAGES.index),
        // (Other views)
        // Case(widget: CallView(), value: HomeViewItems.CALL)
      ],
      elseWidget: SizedBox(),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: ClipRRect(
        borderRadius: BorderRadius.all(context.normalRadius),
        child: BottomNavigationBar(
          onTap: onChangeBottomNavItem,
          iconSize: 36,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Messages',
              icon: Icon(CupertinoIcons.chat_bubble),
              activeIcon: Icon(CupertinoIcons.chat_bubble_fill)
            ),
            BottomNavigationBarItem(
              label: 'Call',
              icon: Icon(CupertinoIcons.phone),
              activeIcon: Icon(CupertinoIcons.phone_fill),
            ),
            BottomNavigationBarItem(
              label: 'Camera',
              icon: Icon(CupertinoIcons.camera),
              activeIcon: Icon(CupertinoIcons.camera_fill),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(CupertinoIcons.settings),
              activeIcon: Icon(CupertinoIcons.settings_solid),
            ),
          ],
        ),
      ),
    );
  }

  void onChangeBottomNavItem(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}

enum HomeViewItems {
  MESSAGES,
  CALL,
  CAMERA,
  SETTINGS
}
