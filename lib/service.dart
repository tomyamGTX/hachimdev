import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

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
        title: const Text(
          'My Services',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHero(isMobile),

                      const SizedBox(height: 50),

                      _buildServicesGrid(isMobile),

                      const SizedBox(height: 50),

                      _buildProcessSection(),

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
    return Center(
      child: Column(
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
              'MY SERVICES',
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
            'What I Can Build For You',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 34 : 48,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),

          const SizedBox(height: 18),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
              'From mobile applications to modern websites, '
              'I create digital products focused on functionality, '
              'performance and user experience.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 15 : 17,
                height: 1.7,
                color: Colors.white.withOpacity(0.55),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICES GRID
  // ============================================================

  Widget _buildServicesGrid(bool isMobile) {
    final services = [
      const _ServiceData(
        icon: Icons.phone_android_rounded,
        title: 'Flutter Development',
        description:
            'Build cross-platform mobile and web applications '
            'with Flutter and Dart.',
      ),
      const _ServiceData(
        icon: Icons.web_rounded,
        title: 'Web Development',
        description:
            'Create modern, responsive websites and web '
            'applications for your business or project.',
      ),
      const _ServiceData(
        icon: Icons.design_services_outlined,
        title: 'UI / UX Design',
        description:
            'Design clean, modern and user-friendly interfaces '
            'that are easy to navigate.',
      ),
      const _ServiceData(
        icon: Icons.cloud_outlined,
        title: 'Firebase Integration',
        description:
            'Integrate authentication, databases, storage, '
            'hosting and other Firebase services.',
      ),
      const _ServiceData(
        icon: Icons.auto_awesome_outlined,
        title: 'AI & Automation',
        description:
            'Experiment with AI-powered features and automation '
            'to improve digital products.',
      ),
      const _ServiceData(
        icon: Icons.build_outlined,
        title: 'App Maintenance',
        description:
            'Fix bugs, improve existing applications and add '
            'new features to existing projects.',
      ),
    ];

    if (isMobile) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: services.map((service) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildServiceCard(service),
          );
        }).toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 260,
      ),
      itemBuilder: (context, index) {
        return _buildServiceCard(services[index]);
      },
    );
  }

  // ============================================================
  // SERVICE CARD
  // ============================================================

  Widget _buildServiceCard(_ServiceData service) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.07)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(service.icon, color: secondaryColor, size: 25),
              ),

              const SizedBox(height: 22),

              Text(
                service.title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                service.description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.white.withOpacity(0.52),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PROCESS
  // ============================================================

  Widget _buildProcessSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.rocket_launch_outlined,
                  color: secondaryColor,
                  size: 22,
                ),
              ),

              const SizedBox(width: 14),

              const Text(
                'How I Work',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 28),

          _buildProcessItem(
            number: '01',
            title: 'Understand',
            description:
                'Understand the idea, requirements and goals of the project.',
          ),

          const SizedBox(height: 22),

          _buildProcessItem(
            number: '02',
            title: 'Design',
            description:
                'Plan the structure and create a clean user experience.',
          ),

          const SizedBox(height: 22),

          _buildProcessItem(
            number: '03',
            title: 'Build',
            description: 'Develop the application using suitable technologies.',
          ),

          const SizedBox(height: 22),

          _buildProcessItem(
            number: '04',
            title: 'Improve',
            description:
                'Test, optimize and improve the product based on feedback.',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROCESS ITEM
  // ============================================================

  Widget _buildProcessItem({
    required String number,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            number,
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(width: 16),

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
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Center(
      child: Text(
        '© ${DateTime.now().year} HachimyDev',
        style: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 13),
      ),
    );
  }
}

// ================================================================
// SERVICE DATA
// ================================================================

class _ServiceData {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceData({
    required this.icon,
    required this.title,
    required this.description,
  });
}
