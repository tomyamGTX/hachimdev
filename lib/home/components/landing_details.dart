import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:hachimdev/home/components/contact_actions.dart';
import 'package:hachimdev/home/components/site_chrome.dart';

class LandingDetails extends StatelessWidget {
  const LandingDetails({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'SELECTED PROJECT',
        style: TextStyle(
          color: Color(0xFFB6A6FF),
          fontSize: 11,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 20),
      Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: const Color(0xFF15151D),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF2C2C38)),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final image = Image.asset(
              'assets/maibeli/feature.png',
              fit: BoxFit.contain,
              semanticLabel: 'MaiBeli marketplace preview',
            );
            final copy = Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MaiBeli',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'An Android marketplace preview to list items, discover products, discuss prices and review service.',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Device-only demo. Online transactions are not available.',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Link(
                    uri: Uri.parse(
                      'https://play.google.com/store/apps/details?id=hachimy.app.maibeli',
                    ),
                    target: LinkTarget.blank,
                    builder: (context, followLink) => TextButton(
                      onPressed: followLink,
                      child: const Text('View MaiBeli on Google Play ↗'),
                    ),
                  ),
                  TextButton(
                    onPressed: () => openSitePage(context, 'Development'),
                    child: const Text('More about the project →'),
                  ),
                ],
              ),
            );
            if (constraints.maxWidth < 760)
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [image, copy],
              );
            return Row(
              children: [
                Expanded(child: image),
                Expanded(child: copy),
              ],
            );
          },
        ),
      ),
    ],
  );
}

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'LET’S GET STARTED',
        style: TextStyle(
          color: Color(0xFFB6A6FF),
          fontSize: 11,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 16),
      const Text(
        'Tell me what you need.',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 12),
      const Text(
        'Share your idea or game tasks and any deadline. We’ll agree on the scope and next steps before work begins.',
        style: TextStyle(color: Colors.white60, fontSize: 15, height: 1.7),
      ),
      const SizedBox(height: 24),
      const ContactActions(),
    ],
  );
}
