import 'package:flutter/material.dart';
import 'package:hachimdev/aboutme.dart';
import 'package:hachimdev/gameservice.dart';
import 'package:hachimdev/service.dart';

void main() {
  runApp(const HachimyDevApp());
}

class HachimyDevApp extends StatelessWidget {
  const HachimyDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF7C5CFC);
    const backgroundColor = Color(0xFF0D0D12);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HachimyDev',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const primaryColor = Color(0xFF7C5CFC);
  static const secondaryColor = Color(0xFF00D9FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth < 700;

            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : 48,
                      vertical: isMobile ? 32 : 48,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTopBar(isMobile),

                        SizedBox(height: isMobile ? 60 : 100),

                        _buildHeroSection(isMobile),

                        const SizedBox(height: 70),

                        _buildNavigationCards(isMobile),

                        const SizedBox(height: 70),

                        _buildFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [primaryColor, secondaryColor],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'H',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            const Text(
              'HachimyDev',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        if (!isMobile)
          Text(
            'Developer • Creator • Gamer',
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
      ],
    );
  }

  // ============================================================
  // HERO SECTION
  // ============================================================

  Widget _buildHeroSection(bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: primaryColor.withOpacity(0.25)),
          ),
          child: const Text(
            'WELCOME TO HACHIMYDEV',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Building Ideas\nInto Digital Experiences.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 42 : 64,
            height: 1.05,
            fontWeight: FontWeight.w800,
            letterSpacing: -2,
          ),
        ),

        const SizedBox(height: 24),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Text(
            'Hi, I’m Hakimi. I build web and mobile applications, '
            'experiment with new technologies, and create digital '
            'experiences that are useful, functional, and enjoyable.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              height: 1.7,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // NAVIGATION CARDS
  // ============================================================

  Widget _buildNavigationCards(bool isMobile) {
    final cards = [
      _NavigationCardData(
        icon: Icons.person_outline,
        title: 'About Me',
        description: 'Learn more about me, my experience and what I do.',
        onTap: _navigateToAboutMePage,
      ),
      _NavigationCardData(
        icon: Icons.code_rounded,
        title: 'My Services',
        description: 'Explore the development and digital services I provide.',
        onTap: _navigateToServicesPage,
      ),
      _NavigationCardData(
        icon: Icons.sports_esports_outlined,
        title: 'Game Services',
        description: 'Gaming-related services, projects and creative work.',
        onTap: _navigateToGameServicesPage,
      ),
    ];

    // ==========================================================
    // MOBILE
    // ==========================================================

    if (isMobile) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: cards.map((card) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildNavigationCard(card),
          );
        }).toList(),
      );
    }

    // ==========================================================
    // DESKTOP / TABLET
    // ==========================================================

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: cards.map((card) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildNavigationCard(card),
          ),
        );
      }).toList(),
    );
  }

  // ============================================================
  // NAVIGATION CARD
  // ============================================================

  Widget _buildNavigationCard(_NavigationCardData card) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: card.onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          constraints: const BoxConstraints(minHeight: 250),
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: const Color(0xFF15151D),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.07)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),

          // IMPORTANT:
          // No Expanded / Spacer here because this card is
          // inside a SingleChildScrollView.
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ------------------------------------------------
              // ICON
              // ------------------------------------------------

              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(card.icon, color: secondaryColor, size: 25),
              ),

              const SizedBox(height: 24),

              // ------------------------------------------------
              // TITLE
              // ------------------------------------------------
              Text(
                card.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // ------------------------------------------------
              // DESCRIPTION
              // ------------------------------------------------
              Text(
                card.description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.55),
                  height: 1.5,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 24),

              // ------------------------------------------------
              // EXPLORE BUTTON
              // ------------------------------------------------
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: secondaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(height: 1, color: Colors.white.withOpacity(0.07)),

        const SizedBox(height: 24),

        Text(
          '© ${DateTime.now().year} HachimyDev',
          style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 13),
        ),
      ],
    );
  }

  // ============================================================
  // NAVIGATION
  // ============================================================

  void _navigateToGameServicesPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GameservicePage()),
    );
  }

  void _navigateToAboutMePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Aboutme()),
    );
  }

  void _navigateToServicesPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ServicePage()),
    );
  }
}

// ================================================================
// NAVIGATION CARD DATA
// ================================================================

class _NavigationCardData {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _NavigationCardData({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });
}
