import 'package:flutter/material.dart';
import 'package:hachimdev/aboutme.dart';
import 'package:hachimdev/gameservice.dart';
import 'package:hachimdev/service.dart';

// ============================================================
// NAVIGATION SECTIONS
// ============================================================

Widget buildNavigationSection({required bool isMobile}) {
  final cards = [
    _NavigationCardData(
      icon: Icons.person_outline_rounded,
      title: 'About Me',
      subtitle: 'GET TO KNOW ME',
      description:
          'Discover who I am, my background, technical experience, '
          'projects, and my journey as a developer and gamer.',
      features: const [
        'My background',
        'Skills & experience',
        'Personal projects',
      ],
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Aboutme()),
        );
      },
    ),
    _NavigationCardData(
      icon: Icons.sports_esports_rounded,
      title: 'Game Progress Services',
      subtitle: 'I PLAY • YOU PROGRESS',
      description:
          'Need help progressing through a game? '
          'I can handle story quests, side quests, daily tasks, '
          'events, exploration, and other in-game objectives.',
      features: const [
        'Story & quest completion',
        'Daily & event tasks',
        'Exploration & progression',
      ],
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const GameservicePage()),
        );
      },
    ),
    _NavigationCardData(
      icon: Icons.code_rounded,
      title: 'Development Services',
      subtitle: 'FOR BUSINESSES & CREATORS',
      description:
          'Explore my web development capabilities and solutions for '
          'businesses, creators, and personal projects.',
      features: const [
        'Website development',
        'Web applications',
        'Custom digital solutions',
      ],
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ServicePage()),
        );
      },
    ),
  ];

  if (isMobile) {
    return Column(
      children: cards.map((card) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildNavigationCard(card),
        );
      }).toList(),
    );
  }

  return Container(
    width: double.infinity,
    height: 440,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cards.map((card) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildNavigationCard(card),
          ),
        );
      }).toList(),
    ),
  );
}

// ============================================================
// NAVIGATION CARD
// ============================================================

Widget _buildNavigationCard(_NavigationCardData card) {
  return Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      onTap: () {
        // Context is obtained from the card's own build context.
        // Navigation is handled by the callback below.
      },
      borderRadius: BorderRadius.circular(20),
      child: Builder(
        builder: (cardContext) {
          return InkWell(
            onTap: () => card.onTap(cardContext),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              constraints: const BoxConstraints(minHeight: 340),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF15151D),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(card.icon, color: secondaryColor, size: 27),
                  ),

                  const SizedBox(height: 24),

                  // Category label
                  Text(
                    card.subtitle,
                    style: TextStyle(
                      color: secondaryColor.withOpacity(0.9),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Title
                  Text(
                    card.title,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Description
                  Text(
                    card.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.65),
                      height: 1.6,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Features
                  ...card.features.map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle_outline_rounded,
                            size: 17,
                            color: secondaryColor.withOpacity(0.9),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Text(
                              feature,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Explore action
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Explore section',
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                        color: secondaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}

// ============================================================
// NAVIGATION CARD DATA
// ============================================================

class _NavigationCardData {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final List<String> features;
  final void Function(BuildContext context) onTap;

  const _NavigationCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.features,
    required this.onTap,
  });
}
