import 'package:flutter/material.dart';
import 'package:hachimdev/home/components/hero.dart';
import 'package:hachimdev/home/components/navigation.dart';

void main() {
  runApp(const HachimyDevApp());
}

class HachimyDevApp extends StatelessWidget {
  const HachimyDevApp({super.key});

  static const primaryColor = Color(0xFF7C5CFC);
  static const secondaryColor = Color(0xFF00D9FF);
  static const backgroundColor = Color(0xFF0D0D12);

  @override
  Widget build(BuildContext context) {
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const primaryColor = Color(0xFF7C5CFC);
  static const secondaryColor = Color(0xFF00D9FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 700;

            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1200,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 48,
                      vertical: isMobile ? 24 : 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // =================================================
                        // HEADER
                        // =================================================

                        _buildHeader(isMobile),

                        SizedBox(
                          height: isMobile ? 50 : 80,
                        ),

                        // =================================================
                        // HERO
                        // =================================================

                        HeroSection(
                          isMobile: isMobile,
                        ),

                        SizedBox(
                          height: isMobile ? 60 : 90,
                        ),

                        // =================================================
                        // WHAT I DO
                        // =================================================

                        _buildSectionHeading(
                          isMobile: isMobile,
                          eyebrow: 'WHAT I DO',
                          title: 'Explore what I offer.',
                          description:
                              'Choose a section to learn more about my '
                              'gaming services, development work, or '
                              'personal background.',
                        ),

                        const SizedBox(height: 32),

                        buildNavigationSection(
                          isMobile: isMobile,
                        ),

                        SizedBox(
                          height: isMobile ? 60 : 90,
                        ),

                        // =================================================
                        // CTA
                        // =================================================

                        _buildCTA(isMobile),

                        SizedBox(
                          height: isMobile ? 60 : 80,
                        ),

                        // =================================================
                        // FOOTER
                        // =================================================

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
  // HEADER
  // ============================================================

  Widget _buildHeader(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    primaryColor,
                    secondaryColor,
                  ],
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // Desktop tagline
        if (!isMobile)
          Text(
            'Developer  •  Creator  •  Gamer',
            style: TextStyle(
              color: Colors.white.withOpacity(0.45),
              fontSize: 13,
            ),
          ),
      ],
    );
  }

  // ============================================================
  // SECTION HEADING
  // ============================================================

  Widget _buildSectionHeading({
    required bool isMobile,
    required String eyebrow,
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          eyebrow,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: secondaryColor,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 30 : 42,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
        ),

        const SizedBox(height: 14),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 650,
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              height: 1.7,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CTA
  // ============================================================

  Widget _buildCTA(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? 28 : 48,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.15),
            secondaryColor.withOpacity(0.07),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Have a project or need gaming assistance?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Explore the sections above to find out more about '
            'my services and what I can do.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.55),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.white.withOpacity(0.07),
        ),

        const SizedBox(height: 24),

        Text(
          '© ${DateTime.now().year} HachimyDev',
          style: TextStyle(
            color: Colors.white.withOpacity(0.35),
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'Developer • Creator • Gamer',
          style: TextStyle(
            color: Colors.white.withOpacity(0.25),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}