import 'package:flutter/material.dart';

class ComingSoonSection extends StatelessWidget {
  const ComingSoonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Responsive adjustments
    final iconSize = width < 500 ? 28.0 : 34.0;
    final titleSize = width < 500 ? 16.0 : 18.0;
    final subtitleSize = width < 500 ? 13.0 : 14.0;
    final buttonFont = width < 500 ? 14.0 : 16.0;
    final buttonHeight = width < 500 ? 40.0 : 44.0;
    final buttonWidth = width < 500 ? 140.0 : 160.0;

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E8FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.hourglass_empty,
            size: iconSize,
            color: const Color(0xFF7C3AED),
          ),
          const SizedBox(height: 16),

          Text(
            "Coming Soon",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              fontSize: titleSize,
              height: 1.0,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            "We’re adding something exciting. Stay tuned!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              fontSize: subtitleSize,
              height: 1.0,
              color: const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF7C3AED), width: 2),
            ),
            child: Center(
              child: Text(
                "Notify Me",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: buttonFont,
                  color: const Color(0xFF7C3AED),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}