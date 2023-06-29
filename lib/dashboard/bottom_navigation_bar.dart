import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarWidget({super.key, 
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white, // Set the background color to white
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.add_home),
            onPressed: () => onTap(0),
            color: currentIndex == 0 ? const Color(0xFF006E21) : const Color(0xFF767873),
          ),
          IconButton(
            icon: const Icon(Icons.local_shipping),
            onPressed: () => onTap(1),
            color: currentIndex == 1 ? const Color(0xFF006E21) : const Color(0xFF767873),
          ),
          IconButton(
            icon: const Icon(Icons.contact_phone),
            onPressed: () => onTap(2),
            color: currentIndex == 2 ? const Color(0xFF006E21) : const Color(0xFF767873),
          ),
        ],
      ),
    );
  }
}
