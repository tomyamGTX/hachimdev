import 'package:flutter/material.dart';

// ============================================================
// HACHIMYDEV THEME
// ============================================================

const Color backgroundColor = Color(0xFF0D0D12);
const Color cardColor = Color(0xFF15151D);
const Color primaryColor = Color(0xFF7C5CFC);
const Color secondaryColor = Color(0xFF00D9FF);
const Color textPrimaryColor = Color(0xFFF5F5F7);
const Color textSecondaryColor = Color(0xFFA7A7B2);

// ============================================================
// GAME SERVICES PAGE
// ============================================================

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
          'Game Progress Services',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHero(context),

                    const SizedBox(height: 70),

                    _buildGamesSection(context),

                    const SizedBox(height: 70),

                    _buildServicesSection(context),

                    const SizedBox(height: 70),

                    _buildHowItWorksSection(context),

                    const SizedBox(height: 70),

                    _buildTestimonialSection(context),

                    const SizedBox(height: 70),

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

  // ============================================================
  // HERO
  // ============================================================

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
              'GAME PROGRESS SERVICES',
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
            'You Enjoy the Game.\n'
            'I Handle the Progress.',
            style: TextStyle(
              color: textPrimaryColor,
              fontSize: isMobile ? 38 : 58,
              height: 1.08,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Need help progressing through a game? '
            'I can play and complete selected in-game tasks for you, '
            'including story quests, side quests, daily tasks, events, '
            'exploration and other progression objectives.',
            style: TextStyle(
              color: textSecondaryColor,
              fontSize: 17,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 28),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _Tag(label: 'Story Completion'),
              _Tag(label: 'Quest Completion'),
              _Tag(label: 'Daily Tasks'),
              _Tag(label: 'Event Tasks'),
              _Tag(label: 'Game Exploration'),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // GAMES
  // ============================================================

  Widget _buildGamesSection(BuildContext context) {
    final games = [
      _GameData(
        title: 'Genshin Impact',
        shortName: 'GI',
        description: 'Story quests, side quests, exploration, events and account progression.',
      ),
      _GameData(
        title: 'Zenless Zone Zero',
        shortName: 'ZZZ',
        description:
            'Story progression, commissions, events, dailies and exploration.',
      ),
      _GameData(
        title: 'Honkai: Star Rail',
        shortName: 'HSR',
        description: 'Trailblaze missions, side content, events, dailies and progression.',
      ),
      _GameData(
        title: 'Wuthering Waves',
        shortName: 'WuWa',
        description: 'Story quests, exploration, events, dailies and other progression tasks.',
      ),
    ];

    return _buildSection(
      title: 'Supported Games',
      subtitle: 'Games currently available for game progress and completion services.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 700) {
            return Column(
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

  // ============================================================
  // SERVICES
  // ============================================================

  Widget _buildServicesSection(BuildContext context) {
    final services = [
      _ServiceData(
        icon: Icons.menu_book_rounded,
        title: 'Story Completion',
        description: 'I play through available story missions and help move your account forward.',
      ),
      _ServiceData(
        icon: Icons.task_alt_rounded,
        title: 'Quest Completion',
        description: 'Complete selected main quests, side quests, commissions and other objectives.',
      ),
      _ServiceData(
        icon: Icons.calendar_month_rounded,
        title: 'Daily Tasks',
        description: 'Handle routine daily activities and progression tasks when you are unavailable.',
      ),
      _ServiceData(
        icon: Icons.celebration_rounded,
        title: 'Event Tasks',
        description:
            'Complete eligible event activities and event-related objectives.',
      ),
      _ServiceData(
        icon: Icons.explore_rounded,
        title: 'Exploration',
        description: 'Explore areas, unlock locations and complete exploration-related objectives.',
      ),
      _ServiceData(
        icon: Icons.trending_up_rounded,
        title: 'Account Progress',
        description: 'Work toward specific progression goals based on the service you request.',
      ),
    ];

    return _buildSection(
      title: 'What I Can Complete',
      subtitle: 'Choose the type of game progress you need help with.',
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

  // ============================================================
  // HOW IT WORKS
  // ============================================================

  Widget _buildHowItWorksSection(BuildContext context) {
    final steps = [
      _StepData(
        number: '01',
        title: 'Choose Your Game',
        description: 'Select the game and tell me what progress or tasks you need completed.',
      ),
      _StepData(
        number: '02',
        title: 'Choose the Service',
        description: 'Tell me whether you need story, quests, daily tasks, events, exploration or other progress.',
      ),
      _StepData(
        number: '03',
        title: 'I Complete It',
        description: 'I handle the agreed gameplay tasks and work toward your requested objectives.',
      ),
      _StepData(
        number: '04',
        title: 'Progress Delivered',
        description: 'Once the agreed work is completed, you can continue playing from the updated progress.',
      ),
    ];

    return _buildSection(
      title: 'How It Works',
      subtitle: 'A simple process from requesting a service to completing your game progress.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth >= 1000
              ? 4
              : constraints.maxWidth >= 650
              ? 2
              : 1;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              mainAxisExtent: 230,
            ),
            itemBuilder: (context, index) {
              final step = steps[index];

              return Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.number,
                      style: TextStyle(
                        color: secondaryColor.withValues(alpha: 0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      step.title,
                      style: const TextStyle(
                        color: textPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      step.description,
                      style: const TextStyle(
                        color: textSecondaryColor,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // ============================================================
  // TESTIMONIALS
  // ============================================================

  Widget _buildTestimonialSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return _buildSection(
      title: 'Client Feedback',
      subtitle:
          'Feedback from customers who have used my game progress services.',
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 24 : 36),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: secondaryColor.withValues(alpha: 0.12)),
        ),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTestimonialImage(),
                  const SizedBox(height: 24),
                  _buildTestimonialContent(),
                  const SizedBox(height: 32),
                  _buildTestimonialImage2(),
                  const SizedBox(height: 24),
                  _buildTestimonialContent2(),
                ],
              )
            : Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTestimonialImage(),

                      const SizedBox(width: 32),

                      Expanded(child: _buildTestimonialContent()),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTestimonialImage2(),

                      const SizedBox(width: 32),

                      Expanded(child: _buildTestimonialContent2()),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildTestimonialImage() {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.35),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.15),
            blurRadius: 25,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/clear.png', fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTestimonialImage2() {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.35),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.15),
            blurRadius: 25,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/clear2.png', fit: BoxFit.cover),
      ),
    );
  }

  _buildTestimonialContent2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(
            5,
            (index) => const Icon(
              Icons.star_rounded,
              color: Color(0xFFFFC857),
              size: 20,
            ),
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          '"The service was excellent! '
          'I was able to enjoy the game while my progress was handled efficiently."',
          style: TextStyle(
            color: textPrimaryColor,
            fontSize: 18,
            height: 1.6,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 18),

        const Text(
          'Genshin Impact Client',
          style: TextStyle(
            color: textSecondaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonialContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(
            5,
            (index) => const Icon(
              Icons.star_rounded,
              color: Color(0xFFFFC857),
              size: 20,
            ),
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          '"Great service and smooth progress. '
          'The requested quests and tasks were completed '
          'while I was away."',
          style: TextStyle(
            color: textPrimaryColor,
            fontSize: 18,
            height: 1.6,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 18),

        const Text(
          'Game Progress Service Client',
          style: TextStyle(
            color: textSecondaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SECTION
  // ============================================================

  Widget _buildSection({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Column(
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

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return const Center(
      child: Column(
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
            'Game Progress • Development • Content',
            style: TextStyle(color: textSecondaryColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DATA MODELS
// ============================================================

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

class _StepData {
  final String number;
  final String title;
  final String description;

  const _StepData({
    required this.number,
    required this.title,
    required this.description,
  });
}

// ============================================================
// TAG
// ============================================================

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
