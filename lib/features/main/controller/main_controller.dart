import 'package:flutter/material.dart';

import '../../../core/models/drawer item/drawer_item.dart';
import '../../booking/view/bookings_screen.dart';
import '../../groups/view/group_screen.dart';

class MainController extends ChangeNotifier {
  int _index = 0;
  final List<DrawerItem> _drawerItems = [
    DrawerItem("Bookings", Icons.list_outlined, const BookingsScreen()),
    DrawerItem("Groups", Icons.line_style_rounded, const GroupScreen()),
  ];

  get index => _index;
  List<DrawerItem> get drawerItems => _drawerItems;
  String get title => drawerItems[_index].title;

  void onItemClick(int index) {
    _index = index;
    notifyListeners();
  }
}
