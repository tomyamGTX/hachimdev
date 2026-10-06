
import 'package:flutter/material.dart';

class Aboutme extends StatelessWidget {
  const Aboutme({super.key});

  static const primaryColor = Color(0xFF7C5CFC);
  static const secondaryColor = Color(0xFF00D9FF);
  static const backgroundColor = Color(0xFF0D0D12);
  static const cardColor = Color(0xFF15151D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'About Me',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth < 700;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 48,
                vertical: 40,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1000,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHero(isMobile),

                      const SizedBox(height: 50),

                      _buildAboutSection(isMobile),

                      const SizedBox(height: 24),

                      _buildSkillsSection(isMobile),

                      const SizedBox(height: 24),

                      _buildFocusSection(isMobile),

                      const SizedBox(height: 50),

                      _buildFooter(),
                    ],
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
  // HERO
  // ============================================================

  Widget _buildHero(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 28 : 42),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.18),
            secondaryColor.withOpacity(0.06),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: primaryColor.withOpacity(0.18),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'ABOUT ME',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 22),

          Text(
            'Hi, I’m Hakimi.',
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Flutter Developer • Web Developer • Creator',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.white.withOpacity(0.65),
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'I enjoy turning ideas into useful, practical and '
            'beautiful digital experiences.',
            style: TextStyle(
              fontSize: isMobile ? 15 : 17,
              height: 1.7,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ABOUT SECTION
  // ============================================================

  Widget _buildAboutSection(bool isMobile) {
    return _buildCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            icon: Icons.person_outline,
            title: 'Who I Am',
          ),

          const SizedBox(height: 20),

          Text(
            'I am a developer who enjoys building applications '
            'that combine functionality, clean design and a good '
            'user experience.',
            style: _bodyTextStyle(),
          ),

          const SizedBox(height: 14),

          Text(
            'My main focus is Flutter development, but I also work '
            'with web technologies, backend services and cloud '
            'platforms when a project requires them.',
            style: _bodyTextStyle(),
          ),

          const SizedBox(height: 14),

          Text(
            'I am also interested in exploring new technologies, '
            'AI, gaming projects and creative digital experiences.',
            style: _bodyTextStyle(),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SKILLS
  // ============================================================

  Widget _buildSkillsSection(bool isMobile) {
    return _buildCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            icon: Icons.code_rounded,
            title: 'Technologies',
          ),

          const SizedBox(height: 24),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _SkillChip(
                icon: Icons.flutter_dash,
                label: 'Flutter',
              ),
              _SkillChip(
                icon: Icons.language,
                label: 'Dart',
              ),
              _SkillChip(
                icon: Icons.web,
                label: 'Web Development',
              ),
              _SkillChip(
                icon: Icons.cloud_outlined,
                label: 'Firebase',
              ),
              _SkillChip(
                icon: Icons.storage_outlined,
                label: 'Database',
              ),
              _SkillChip(
                icon: Icons.smart_toy_outlined,
                label: 'AI',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CURRENT FOCUS
  // ============================================================

  Widget _buildFocusSection(bool isMobile) {
    return _buildCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            icon: Icons.rocket_launch_outlined,
            title: 'What I Do',
          ),

          const SizedBox(height: 20),

          _buildFocusItem(
            icon: Icons.phone_android_outlined,
            title: 'Mobile Applications',
            description:
                'Building responsive and user-friendly Flutter applications.',
          ),

          const SizedBox(height: 18),

          _buildFocusItem(
            icon: Icons.web_outlined,
            title: 'Web Development',
            description:
                'Creating modern websites and web applications.',
          ),

          const SizedBox(height: 18),

          _buildFocusItem(
            icon: Icons.auto_awesome_outlined,
            title: 'Creative Technology',
            description:
                'Experimenting with AI, gaming and new technologies.',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle({
    required IconData icon,
    required String title,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: secondaryColor,
            size: 22,
          ),
        ),

        const SizedBox(width: 14),

        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // FOCUS ITEM
  // ============================================================

  Widget _buildFocusItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: secondaryColor,
          size: 22,
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CARD
  // ============================================================

  Widget _buildCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.07),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }

  // ============================================================
  // BODY TEXT
  // ============================================================

  TextStyle _bodyTextStyle() {
    return TextStyle(
      fontSize: 15,
      height: 1.7,
      color: Colors.white.withOpacity(0.58),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Center(
      child: Text(
        '© ${DateTime.now().year} HachimyDev',
        style: TextStyle(
          color: Colors.white.withOpacity(0.35),
          fontSize: 13,
        ),
      ),
    );
  }
}

// ================================================================
// SKILL CHIP
// ================================================================

class _SkillChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SkillChip({
    required this.icon,
    required this.label,
  });

  static const secondaryColor = Color(0xFF00D9FF);
  static const primaryColor = Color(0xFF7C5CFC);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: primaryColor.withOpacity(0.15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 17,
            color: secondaryColor,
          ),

          const SizedBox(width: 8),

          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

