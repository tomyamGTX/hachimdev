import 'package:flutter/material.dart';
import 'package:hachimdev/home/components/contact_actions.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'HACHIMY · DEVELOPER & GAMER IN MALAYSIA',
        style: TextStyle(
          color: Color(0xFFB6A6FF),
          fontSize: 11,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        'I build websites & apps.\nI help you progress in games.',
        style: TextStyle(
          fontSize: isMobile ? 34 : 54,
          fontWeight: FontWeight.w700,
          height: 1.15,
          letterSpacing: -1.5,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        'Two services, one person. Find the work you need below, see what is included, then get in touch.',
        style: TextStyle(color: Colors.white60, fontSize: 16, height: 1.7),
      ),
      const SizedBox(height: 28),
      const ContactActions(showBanners: true),
    ],
  );
}
