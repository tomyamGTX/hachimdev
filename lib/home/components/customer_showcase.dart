import 'package:flutter/material.dart';

const _accent = Color(0xFFB6A6FF);

class CustomerShowcase extends StatelessWidget {
  const CustomerShowcase({super.key});

  void _viewImage(BuildContext context, String asset) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: const Color(0xFF0D0D12),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  tooltip: 'Close image',
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ),
              Expanded(
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  child: Center(child: Image.asset(asset, fit: BoxFit.contain)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Pinch or scroll to zoom'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text(
        'CUSTOMER SHOWCASE',
        style: TextStyle(
          color: _accent,
          letterSpacing: 2,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 14),
      const Text(
        'Game progress, in pictures.',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
      ),
      const SizedBox(height: 24),
      _customer(
        context,
        name: 'Klee',
        service: 'Event clears & event quests',
        description:
            'Genshin Impact event completion and event quest services.',
        assets: ['assets/clear.png', 'assets/clear2.png'],
        caption: 'View completed events ↗',
      ),
      const SizedBox(height: 24),
      _customer(
        context,
        name: 'Shiori',
        service: 'Code redemption & daily tasks',
        description: 'Genshin Impact code redemption and daily task services.',
        assets: ['assets/shiori-redeem-daily.png'],
        caption: 'View redeemed rewards ↗',
      ),
    ],
  );

  Widget _customer(
    BuildContext context, {
    required String name,
    required String service,
    required String description,
    required List<String> assets,
    required String caption,
  }) => Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: const Color(0xFF15151D),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF7C5CFC),
              child: Text(name[0], style: const TextStyle(color: Colors.white)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Customer · TikTok',
                  style: TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          service,
          style: const TextStyle(
            color: _accent,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(color: Colors.white60, height: 1.6),
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = assets.length > 1 && constraints.maxWidth >= 640
                ? (constraints.maxWidth - 16) / 2
                : constraints.maxWidth;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                for (final asset in assets)
                  SizedBox(
                    width: width,
                    child: Material(
                      color: const Color(0xFF20202D),
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () => _viewImage(context, asset),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              asset,
                              width: width,
                              fit: BoxFit.contain,
                              semanticLabel: '$service for $name',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Text(
                                caption,
                                style: const TextStyle(color: _accent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
