import 'package:flutter/material.dart';

class DailyActivitySummary extends StatelessWidget {
  const DailyActivitySummary({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final iconSize = screenWidth < 500 ? 32.0 : 40.0;
    final progressHeight = screenWidth < 500 ? 6.0 : 8.0;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          const Text(
            "Daily activity summary",
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              height: 28 / 18,
              color: Color(0xFF1E293B),
            ),
          ),

          const SizedBox(height: 16),

          // Card Container 
          Container(
            width: screenWidth,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),

            child: Column(
              children: [
                //Row for Steps / Sleep / Calories
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cardWidth = constraints.maxWidth;

                    final isSmall = cardWidth < 750;

                    return isSmall
                        ? Column(
                            children: [
                              ActivityItem(
                                value: "8,432",
                                label: "Steps",
                                icon: Icons.directions_walk,
                                iconColor: Colors.green,
                                progressColor: Colors.green,
                                progress: 0.75,
                                iconSize: iconSize,
                                progressHeight: progressHeight,
                              ),
                              const SizedBox(height: 20),
                              ActivityItem(
                                value: "7.5h",
                                label: "Sleep",
                                icon: Icons.nightlight_round,
                                iconColor: Colors.purple,
                                progressColor: Colors.purple,
                                progress: 0.82,
                                iconSize: iconSize,
                                progressHeight: progressHeight,
                              ),
                              const SizedBox(height: 20),
                              ActivityItem(
                                value: "425",
                                label: "Calories",
                                icon: Icons.local_fire_department,
                                iconColor: Colors.orange,
                                progressColor: Colors.orange,
                                progress: 0.60,
                                iconSize: iconSize,
                                progressHeight: progressHeight,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ActivityItem(
                                  value: "8,432",
                                  label: "Steps",
                                  icon: Icons.directions_walk,
                                  iconColor: Colors.green,
                                  progressColor: Colors.green,
                                  progress: 0.75,
                                  iconSize: iconSize,
                                  progressHeight: progressHeight,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ActivityItem(
                                  value: "7.5h",
                                  label: "Sleep",
                                  icon: Icons.nightlight_round,
                                  iconColor: const Color(0xFF7C3AED),
                                  progressColor: const Color(0xFF7C3AED),
                                  progress: 0.82,
                                  iconSize: iconSize,
                                  progressHeight: progressHeight,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ActivityItem(
                                  value: "425",
                                  label: "Calories",
                                  icon: Icons.local_fire_department,
                                  iconColor: Colors.orange,
                                  progressColor: Colors.orange,
                                  progress: 0.60,
                                  iconSize: iconSize,
                                  progressHeight: progressHeight,
                                ),
                              ),
                            ],
                          );
                  },
                ),

                const SizedBox(height: 16),

                Text(
                  "View More",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.purple.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color progressColor;
  final double progress;
  final double iconSize;
  final double progressHeight;

  const ActivityItem({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.progressColor,
    required this.progress,
    required this.iconSize,
    required this.progressHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon in circle
        CircleAvatar(
          radius: iconSize / 1.4,
          backgroundColor: iconColor.withOpacity(0.12),
          child: Icon(icon, size: iconSize, color: iconColor),
        ),

        const SizedBox(height: 12),

        // Value
        Text(
          value,
          style: const TextStyle(
            fontFamily: "Inter",
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),

        // Label
        Text(
          label,
          style: const TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: Color(0xFF64748B),
          ),
        ),

        const SizedBox(height: 12),

        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade300,
            color: progressColor,
            minHeight: progressHeight,
          ),
        ),
      ],
    );
  }
}