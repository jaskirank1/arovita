import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../utils/responsive.dart';

class AddMemberCard extends StatelessWidget {
  const AddMemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = Responsive.isMobile(constraints.maxWidth);

        final double cardWidth = isMobile ? 161.5 : 453.3;
        final double cardHeight = isMobile ? 98 : 190;

        return DottedBorder(
          color: const Color(0xFF7C3AED),
          strokeWidth: 2,
          dashPattern: const [4, 3],
          borderType: BorderType.RRect,
          radius: Radius.circular(isMobile ? 12 : 8),

          child: Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(isMobile ? 12 : 8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x11000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: isMobile ? 32 : 40,
                    color: const Color(0xFF7C3AED),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Add Member",
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C3AED),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}