import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),

      child: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;

          // Responsive horizontal padding
          double horizontalPadding =
              screenWidth > 1200 ? 200 :
              screenWidth > 1000 ? 150 :
              screenWidth > 800 ? 120 :
              screenWidth > 600 ? 70 :
              30; // mobile smallest padding

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(
                  context,
                  index: 0,
                  icon: Icons.home_outlined,
                  label: "Home",
                ),

                _buildNavItem(
                  context,
                  index: 1,
                  icon: Icons.calendar_today_outlined,
                  label: "Appointments",
                ),

                _buildChatItem(context),

                _buildNavItem(
                  context,
                  index: 3,
                  icon: Icons.person_outline,
                  label: "Profile",
                ),

                _buildNavItem(
                  context,
                  index: 4,
                  icon: Icons.show_chart_outlined,
                  label: "Activity",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Normal nav item
  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => _navigate(context, index),
      child: SizedBox(
        width: 80,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: isActive ? Color(0xFF7C3AED) : Color(0xFF64748B),
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? Color(0xFF7C3AED) : Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Chat with green dot
  Widget _buildChatItem(BuildContext context) {
    final bool isActive = currentIndex == 2;

    return GestureDetector(
      onTap: () => _navigate(context, 2),
      child: SizedBox(
        width: 60,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: 28,
                  color: isActive ? Color(0xFF7C3AED) : Color(0xFF64748B),
                ),

                Positioned(
                  right: -6,
                  top: -2,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Color(0xFF16A34A),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            Text(
              "Chat",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? Color(0xFF7C3AED) : Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navigation with pushReplacement
  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/appointments');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/activity');
        break;
    }
  }
}