import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class MaiBeliFeature extends StatelessWidget {
  const MaiBeliFeature({super.key});

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: const Color(0xFF211917),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: const Color(0xFF684338)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/maibeli/feature.png',
          fit: BoxFit.contain,
          semanticLabel: 'MaiBeli — List. Discuss. Review.',
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final copy = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MY ANDROID PROJECT · MARKETPLACE PREVIEW',
                    style: TextStyle(
                      color: Color(0xFFFFAE8E),
                      letterSpacing: 1.2,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'MaiBeli',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Give your items a new home.',
                    style: TextStyle(
                      color: Color(0xFFFFC3A9),
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'A marketplace preview where you can list products, discover items based on your interests, discuss prices and review service experiences.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 20),
                  for (final (icon, label) in [
                    (
                      Icons.storefront_outlined,
                      'Create listings and mark items as sold',
                    ),
                    (
                      Icons.search_rounded,
                      'Personalised picks, search and filters',
                    ),
                    (
                      Icons.chat_bubble_outline,
                      'Messages, price offers and chat labels',
                    ),
                    (
                      Icons.star_outline_rounded,
                      'Service ratings and written reviews',
                    ),
                  ])
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(icon, color: const Color(0xFFFFAE8E), size: 19),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              label,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Current preview: activity stays on your device. Demo profiles let you try buying and selling. Online accounts, shared listings, product photos, payments and delivery are not available yet.',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Link(
                    uri: Uri.parse(
                      'https://play.google.com/store/apps/details?id=hachimy.app.maibeli',
                    ),
                    target: LinkTarget.blank,
                    builder: (context, followLink) => FilledButton(
                      onPressed: followLink,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFB94322),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(18),
                      ),
                      child: const Text('View MaiBeli on Google Play'),
                    ),
                  ),
                ],
              );
              final screenshots = Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  for (final (asset, caption) in [
                    ('explore', 'Personalised discovery'),
                    ('price-discussion', 'Discuss prices'),
                  ])
                    SizedBox(
                      width: constraints.maxWidth < 330
                          ? (constraints.maxWidth - 12) / 2
                          : 142,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/maibeli/$asset.png',
                              fit: BoxFit.contain,
                              semanticLabel: 'MaiBeli: $caption',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            caption,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 11,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
              if (constraints.maxWidth < 850)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [copy, const SizedBox(height: 28), screenshots],
                );
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: copy),
                  const SizedBox(width: 32),
                  SizedBox(width: 296, child: screenshots),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}
