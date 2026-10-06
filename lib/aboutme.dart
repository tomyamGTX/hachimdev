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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth < 700;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 48,
                vertical: 40,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHero(isMobile),

                      const SizedBox(height: 32),

                      _buildIntroduction(isMobile),

                      const SizedBox(height: 24),

                      _buildSkillsSection(isMobile),

                      const SizedBox(height: 24),

                      _buildExperienceSection(isMobile),

                      const SizedBox(height: 24),

                      _buildInterestSection(isMobile),

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
      padding: EdgeInsets.all(isMobile ? 28 : 48),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x337C5CFC), Color(0x1100D9FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: primaryColor.withOpacity(0.18)),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.06),
            blurRadius: 40,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.14),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: primaryColor.withOpacity(0.20)),
            ),
            child: const Text(
              'ABOUT ME',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Hi, I’m Hakimi.',
            style: TextStyle(
              fontSize: isMobile ? 38 : 56,
              height: 1.05,
              fontWeight: FontWeight.w800,
              letterSpacing: -2,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            'Lead Developer • Flutter Developer • Creator',
            style: TextStyle(
              fontSize: isMobile ? 15 : 20,
              color: Colors.white.withOpacity(0.68),
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 22),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              'I build digital products, applications and web experiences '
              'with a focus on practical solutions, clean interfaces and '
              'real-world usability.',
              style: TextStyle(
                fontSize: isMobile ? 15 : 17,
                height: 1.75,
                color: Colors.white.withOpacity(0.55),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INTRODUCTION
  // ============================================================

  Widget _buildIntroduction(bool isMobile) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            icon: Icons.person_outline_rounded,
            title: 'Who I Am',
          ),

          const SizedBox(height: 22),

          Text(
            'I’m a developer from Malaysia who enjoys turning ideas '
            'into working digital products.',
            style: _bodyTextStyle(fontSize: 16),
          ),

          const SizedBox(height: 14),

          Text(
            'My main experience is with Flutter development, where I build '
            'responsive applications for web and mobile. I also work with '
            'Firebase, databases, APIs, payment systems and modern web '
            'technologies to bring complete products from idea to deployment.',
            style: _bodyTextStyle(),
          ),

          const SizedBox(height: 14),

          Text(
            'One of the projects I have worked extensively on is QuranIrab, '
            'an Islamic educational platform that combines Quran learning, '
            'I‘rab, translation, Tajwid and other learning features.',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            icon: Icons.code_rounded,
            title: 'Skills & Technologies',
          ),

          const SizedBox(height: 24),

          Text(
            'Technologies I use to build and maintain digital products.',
            style: _bodyTextStyle(),
          ),

          const SizedBox(height: 22),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _SkillChip(icon: Icons.flutter_dash, label: 'Flutter'),
              _SkillChip(icon: Icons.code, label: 'Dart'),
              _SkillChip(icon: Icons.web_rounded, label: 'Web Development'),
              _SkillChip(icon: Icons.javascript_rounded, label: 'Next.js'),
              _SkillChip(icon: Icons.cloud_outlined, label: 'Firebase'),
              _SkillChip(icon: Icons.storage_outlined, label: 'Database'),
              _SkillChip(icon: Icons.api_rounded, label: 'REST API'),
              _SkillChip(
                icon: Icons.payment_rounded,
                label: 'Payment Integration',
              ),
              _SkillChip(icon: Icons.smart_toy_outlined, label: 'AI'),
              _SkillChip(
                icon: Icons.design_services_outlined,
                label: 'UI / UX',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EXPERIENCE
  // ============================================================

  Widget _buildExperienceSection(bool isMobile) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            icon: Icons.rocket_launch_outlined,
            title: 'Experience & Focus',
          ),

          const SizedBox(height: 24),

          _buildExperienceItem(
            icon: Icons.phone_android_rounded,
            title: 'Flutter Development',
            description:
                'Building responsive applications for mobile and web '
                'with reusable components, state management and '
                'production-ready integrations.',
          ),

          const SizedBox(height: 22),

          _buildExperienceItem(
            icon: Icons.web_rounded,
            title: 'Web Development',
            description:
                'Creating modern websites and web applications using '
                'technologies such as Next.js, React and modern CSS.',
          ),

          const SizedBox(height: 22),

          _buildExperienceItem(
            icon: Icons.cloud_outlined,
            title: 'Backend & Cloud',
            description:
                'Working with Firebase, databases, APIs, authentication, '
                'hosting and cloud-based services.',
          ),

          const SizedBox(height: 22),

          _buildExperienceItem(
            icon: Icons.credit_card_rounded,
            title: 'Digital Payments',
            description:
                'Integrating payment systems and building practical '
                'payment flows for digital products and services.',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INTERESTS
  // ============================================================

  Widget _buildInterestSection(bool isMobile) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            icon: Icons.auto_awesome_outlined,
            title: 'Beyond Development',
          ),

          const SizedBox(height: 20),

          Text(
            'Technology is not the only thing I enjoy. I also spend time '
            'exploring gaming, content creation and AI.',
            style: _bodyTextStyle(),
          ),

          const SizedBox(height: 22),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _InterestItem(
                icon: Icons.videogame_asset_outlined,
                label: 'Gaming',
              ),
              _InterestItem(
                icon: Icons.live_tv_outlined,
                label: 'Content Creation',
              ),
              _InterestItem(
                icon: Icons.smart_toy_outlined,
                label: 'Artificial Intelligence',
              ),
              _InterestItem(
                icon: Icons.lightbulb_outline_rounded,
                label: 'New Technologies',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle({required IconData icon, required String title}) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: secondaryColor, size: 21),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // EXPERIENCE ITEM
  // ============================================================

  Widget _buildExperienceItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: secondaryColor, size: 19),
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

              const SizedBox(height: 6),

              Text(description, style: _bodyTextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CARD
  // ============================================================

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
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

  TextStyle _bodyTextStyle({double fontSize = 15}) {
    return TextStyle(
      fontSize: fontSize,
      height: 1.7,
      color: Colors.white.withOpacity(0.58),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          Text(
            'Developer • Creator • Gamer',
            style: TextStyle(
              color: Colors.white.withOpacity(0.25),
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '© ${DateTime.now().year} HachimyDev',
            style: TextStyle(
              color: Colors.white.withOpacity(0.35),
              fontSize: 13,
            ),
          ),
        ],
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

  const _SkillChip({required this.icon, required this.label});

  static const secondaryColor = Color(0xFF00D9FF);
  static const primaryColor = Color(0xFF7C5CFC);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: secondaryColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// INTEREST ITEM
// ================================================================

class _InterestItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InterestItem({required this.icon, required this.label});

  static const secondaryColor = Color(0xFF00D9FF);
  static const primaryColor = Color(0xFF7C5CFC);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.025),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: secondaryColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
