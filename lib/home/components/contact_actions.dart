import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:hachimdev/home/components/site_chrome.dart' show openSitePage;

const contactEmail = 'hakimimdnoor90@gmail.com';
const tiktokLiveUrl = 'https://www.tiktok.com/@hachimy99/live';
const discordInviteUrl = 'https://discord.gg/ZJkeRhcKY8';

class ContactActions extends StatelessWidget {
  const ContactActions({super.key, this.showBanners = false});
  final bool showBanners;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth >= 660
          ? (constraints.maxWidth - 16) / 2
          : constraints.maxWidth;
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          SizedBox(
            width: width,
            child: _ContactCard(
              showBanner: showBanners,
              icon: Icons.mail_outline_rounded,
              title: 'Website & app development',
              description: 'Business websites, web applications and Flutter apps designed and built for your project.',
              detailsLabel: 'View website & app services',
              page: 'Development',
              action: 'Discuss a project by email',
              uri: Uri.parse('mailto:$contactEmail?subject=Project%20enquiry'),
              color: const Color(0xFF7C5CFC),
            ),
          ),
          SizedBox(
            width: width,
            child: _ContactCard(
              showBanner: showBanners,
              icon: Icons.live_tv_rounded,
              title: 'Quest, event & daily completion',
              description: 'Help completing story quests, clearing events, handling daily tasks and redeeming codes in supported games.',
              detailsLabel: 'View game tasks & supported games',
              page: 'Gaming',
              action: 'Request game help on TikTok LIVE',
              uri: Uri.parse(tiktokLiveUrl),
              color: const Color(0xFF7C5CFC),
            ),
          ),
        ],
      );
    },
  );
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.showBanner,
    required this.icon,
    required this.title,
    required this.description,
    required this.detailsLabel,
    required this.page,
    required this.action,
    required this.uri,
    required this.color,
  });
  final bool showBanner;
  final IconData icon;
  final String title, description, detailsLabel, page, action;
  final Uri uri;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF15151D),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFF2C2C38)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showBanner) ...[
          IgnorePointer(
            child: ExcludeSemantics(
              child: _ServiceBanner(isGaming: page == 'Gaming', onTap: () {}),
            ),
          ),
          const SizedBox(height: 20),
        ],
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 14,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 20),
        if (showBanner)
          Material(
            color: const Color(0xFF292337),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () => openSitePage(context, page),
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        detailsLabel,
                        style: const TextStyle(
                          color: Color(0xFFDBD1FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xFFDBD1FF),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (!showBanner)
          Link(
            uri: uri,
            target: uri.scheme == 'mailto' ? LinkTarget.self : LinkTarget.blank,
            builder: (context, followLink) => Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: followLink,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Icon(icon, size: 21, color: Colors.white),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          action,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_outward_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

class _ServiceBanner extends StatelessWidget {
  const _ServiceBanner({required this.isGaming, required this.onTap});
  final bool isGaming;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: isGaming
        ? 'View game tasks and supported games'
        : 'View website and app services',
    child: Material(
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFF272039),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (isGaming)
                Image.asset(
                  'assets/clear2.png',
                  fit: BoxFit.cover,
                  excludeFromSemantics: true,
                )
              else
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF29203F), Color(0xFF171821)],
                    ),
                  ),
                ),
              if (!isGaming)
                Center(
                  child: Container(
                    width: 180,
                    height: 112,
                    decoration: BoxDecoration(
                      color: const Color(0xFF14131C),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF77678E)),
                    ),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFFB6A6FF),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.white24,
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.white24,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Icon(
                              Icons.code_rounded,
                              size: 48,
                              color: Color(0xFFB6A6FF),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              if (isGaming)
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xAA0D0D12)],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

class DiscordCommunity extends StatelessWidget {
  const DiscordCommunity({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: const Color(0xFF15151D),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFF2C2C38)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.forum_outlined, color: Color(0xFFB6A6FF), size: 26),
        const SizedBox(height: 16),
        const Text(
          'Join the community',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        const Text(
          'Connect with me and the community on Discord.',
          style: TextStyle(color: Colors.white60, fontSize: 14, height: 1.7),
        ),
        const SizedBox(height: 18),
        Link(
          uri: Uri.parse(discordInviteUrl),
          target: LinkTarget.blank,
          builder: (context, followLink) => OutlinedButton.icon(
            onPressed: followLink,
            icon: const Icon(Icons.forum_outlined, size: 18),
            label: const Text('Join Discord'),
          ),
        ),
      ],
    ),
  );
}
