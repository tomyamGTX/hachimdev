import 'package:flutter/material.dart';

// HachimyDev theme colors
const Color backgroundColor = Color(0xFF0D0D12);
const Color cardColor = Color(0xFF15151D);
const Color primaryColor = Color(0xFF7C5CFC);
const Color secondaryColor = Color(0xFF00D9FF);
const Color textPrimaryColor = Color(0xFFF5F5F7);
const Color textSecondaryColor = Color(0xFFA7A7B2);

class GameservicePage extends StatelessWidget {
  const GameservicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: textPrimaryColor,
        elevation: 0,
        title: const Text(
          'Game Services',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHero(context),
                    const SizedBox(height: 60),
                    _buildGamesSection(context),
                    const SizedBox(height: 60),
                    _buildServicesSection(context),
                    const SizedBox(height: 60),
                    _buildGamingContentSection(context),
                    const SizedBox(height: 60),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 28 : 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF19152D), Color(0xFF11151F)],
        ),
        border: Border.all(color: primaryColor.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: secondaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: secondaryColor.withValues(alpha: 0.25)),
            ),
            child: const Text(
              'GAMING & CONTENT',
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
            'Gaming Services &\nContent',
            style: TextStyle(
              color: textPrimaryColor,
              fontSize: isMobile ? 38 : 54,
              height: 1.05,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Exploring games, characters, stories and gameplay '
            'experiences across some of my favourite RPG titles.',
            style: TextStyle(
              color: textSecondaryColor,
              fontSize: 17,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGamesSection(BuildContext context) {
    final games = [
      _GameData(
        title: 'Genshin Impact',
        shortName: 'GI',
        description: 'Open-world exploration, character builds, quests and gameplay content.',
      ),
      _GameData(
        title: 'Zenless Zone Zero',
        shortName: 'ZZZ',
        description:
            'Agent builds, combat gameplay, exploration and new content.',
      ),
      _GameData(
        title: 'Honkai: Star Rail',
        shortName: 'HSR',
        description:
            'Turn-based RPG gameplay, characters, builds and story content.',
      ),
      _GameData(
        title: 'Wuthering Waves',
        shortName: 'WuWa',
        description:
            'Open-world exploration, combat, characters and progression.',
      ),
    ];

    return _buildSection(
      title: 'Games I Explore',
      subtitle: 'Some of the games I enjoy playing, exploring and creating content around.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 700) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < games.length; i++) ...[
                  _buildGameCard(games[i]),
                  if (i < games.length - 1) const SizedBox(height: 16),
                ],
              ],
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: games.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              mainAxisExtent: 190,
            ),
            itemBuilder: (context, index) {
              return _buildGameCard(games[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildGameCard(_GameData game) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [primaryColor, secondaryColor],
              ),
            ),
            child: Center(
              child: Text(
                game.shortName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.title,
                  style: const TextStyle(
                    color: textPrimaryColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  game.description,
                  style: const TextStyle(
                    color: textSecondaryColor,
                    height: 1.5,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    final services = [
      _ServiceData(
        icon: Icons.explore_rounded,
        title: 'Game Exploration',
        description:
            'Explore open-world areas, events, quests and new game content.',
      ),
      _ServiceData(
        icon: Icons.menu_book_rounded,
        title: 'Story Clearing',
        description: 'Play through story quests and experience the latest narrative content.',
      ),
      _ServiceData(
        icon: Icons.groups_rounded,
        title: 'Character Showcase',
        description:
            'Showcase characters, builds, animations and gameplay experiences.',
      ),
      _ServiceData(
        icon: Icons.videocam_rounded,
        title: 'Gaming Content',
        description:
            'Create gaming clips, short-form videos and livestream content.',
      ),
      _ServiceData(
        icon: Icons.auto_awesome_rounded,
        title: 'Game Guides',
        description:
            'Share useful gameplay information, builds, tips and discoveries.',
      ),
      _ServiceData(
        icon: Icons.live_tv_rounded,
        title: 'Live Streaming',
        description: 'Gaming livestreams featuring gameplay, exploration and community interaction.',
      ),
    ];

    return _buildSection(
      title: 'What I Do',
      subtitle: 'Gaming activities and content that fit into my HachimyDev creator portfolio.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth >= 1000
              ? 3
              : constraints.maxWidth >= 650
              ? 2
              : 1;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              mainAxisExtent: 220,
            ),
            itemBuilder: (context, index) {
              return _buildServiceCard(services[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildServiceCard(_ServiceData service) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(service.icon, color: primaryColor, size: 25),
          ),
          const SizedBox(height: 20),
          Text(
            service.title,
            style: const TextStyle(
              color: textPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            service.description,
            style: const TextStyle(
              color: textSecondaryColor,
              height: 1.5,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGamingContentSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gaming + Development',
          style: TextStyle(
            color: textPrimaryColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'HachimyDev combines software development with gaming '
          'and digital content creation. The goal is to build '
          'interesting experiences both inside and outside of games.',
          style: TextStyle(
            color: textSecondaryColor,
            height: 1.6,
            fontSize: 15,
          ),
        ),
      ],
    );

    final tags = Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        _Tag(label: 'Genshin Impact'),
        _Tag(label: 'ZZZ'),
        _Tag(label: 'HSR'),
        _Tag(label: 'WuWa'),
        _Tag(label: 'Gaming'),
        _Tag(label: 'Streaming'),
        _Tag(label: 'Content Creation'),
      ],
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 26 : 38),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: secondaryColor.withValues(alpha: 0.12)),
      ),
      child: isMobile
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [content, const SizedBox(height: 28), tags],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: content),
                const SizedBox(width: 40),
                Expanded(child: tags),
              ],
            ),
    );
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: textPrimaryColor,
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(
            color: textSecondaryColor,
            fontSize: 15,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 26),
        child,
      ],
    );
  }

  Widget _buildFooter() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'HachimyDev',
            style: TextStyle(
              color: textPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Gaming • Development • Content',
            style: TextStyle(color: textSecondaryColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _GameData {
  final String title;
  final String shortName;
  final String description;

  const _GameData({
    required this.title,
    required this.shortName,
    required this.description,
  });
}

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

class _Tag extends StatelessWidget {
  final String label;

  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: primaryColor.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: textPrimaryColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
