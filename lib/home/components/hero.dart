import 'package:flutter/material.dart';
import 'package:hachimdev/gameservice.dart';

// ============================================================
// HERO SECTION WITH ROTATING BACKGROUND
// ============================================================

const List<String> heroImages = ['assets/clear.png', 'assets/clear2.png'];

class HeroSection extends StatefulWidget {
  final bool isMobile;

  const HeroSection({super.key, required this.isMobile});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  int _currentImage = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _startImageRotation();
  }

  Future<void> _startImageRotation() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 5));

      if (!mounted) return;

      setState(() {
        _currentImage = (_currentImage + 1) % heroImages.length;
      });

      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.isMobile;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Rotating background images with fade transition
            Positioned.fill(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    heroImages[(_currentImage + 1) % heroImages.length],
                    fit: BoxFit.cover,
                  ),
                  FadeTransition(
                    opacity: ReverseAnimation(_fadeAnimation),
                    child: Image.asset(
                      heroImages[_currentImage],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            // Dark overlay
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.7)),
            ),

            // Hero content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 48,
                vertical: isMobile ? 64 : 100,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: primaryColor.withOpacity(0.4)),
                    ),
                    child: const Text(
                      'GAME PROGRESS SERVICES  •  WEB DEVELOPMENT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Text(
                      'Game Progress.\n'
                      'Quests & Daily Tasks.\n'
                      'Web Development.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 36 : 64,
                        height: 1.12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.5,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Text(
                      'Need help progressing through a game? '
                      'I provide game progress services by completing story quests, '
                      'side quests, daily tasks, events, exploration, and other '
                      'in-game objectives on your behalf.\n\n'
                      'I also develop modern websites and web applications for '
                      'businesses, creators, and personal projects.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 15 : 18,
                        height: 1.8,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: const [
                      _HeroTag(label: 'Story & Quest Completion'),
                      _HeroTag(label: 'Daily & Event Tasks'),
                      _HeroTag(label: 'Game Exploration'),
                      _HeroTag(label: 'Web Development'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroTag extends StatelessWidget {
  final String label;

  const _HeroTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
