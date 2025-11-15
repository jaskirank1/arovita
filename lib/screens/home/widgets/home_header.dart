import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xFFF5F3FF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT 
          SizedBox(
            width: 213.3,
            height: 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 28,
                  child: Text(
                    "Good Morning, Sarah",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 28 / 20,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    "Here's your health overview today.",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 20 / 14,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // RIGHT
          SizedBox(
            width: 73.5,
            height: 40,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 6,
                  child: SizedBox(
                    width: 17.5,
                    height: 28,
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 24,
                      color: Colors.black87,
                    ),
                  ),
                ),

                // Red dot
                Positioned(
                  top: -8,
                  left: 5.5,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDC2626),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "3",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Profile
                Positioned(
                  left: 33.5,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}