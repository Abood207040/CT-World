import 'package:flutter/material.dart';

class NavBox extends StatelessWidget {
  final String title;
  final String route;
  final String imagePath;
  final Color backgroundColor;

  const NavBox({
    super.key,
    required this.title,
    required this.route,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            // Title
            Positioned(
              top: 14,
              left: 14,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Tilted image in the bottom-right
            Positioned(
              bottom: -10,
              right: -10,
              child: Transform.rotate(
                angle: -0.3, // tilt angle
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
