import 'package:flutter/material.dart';

class DoctorInfoCard extends StatelessWidget {
  final String name;
  final String field;
  final String imagePath;
  final bool isMobile;
  final double width;

  const DoctorInfoCard({
    super.key,
    required this.name,
    required this.field,
    required this.imagePath,
    required this.isMobile,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: isMobile ? 80 : 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 12 : 8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(imagePath, height: 48, width: 48),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  field,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),

          if (isMobile)
            const Text(
              "● Available",
              style: TextStyle(color: Color(0xFF16A34A), fontSize: 12),
            )
          else
            const Text(
              "● Available now",
              style: TextStyle(color: Color(0xFF16A34A), fontSize: 12),
            ),
        ],
      ),
    );
  }
}
