export 'customer_showcase.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hachimdev/aboutme.dart';
import 'package:hachimdev/gameservice.dart';
import 'package:hachimdev/service.dart';

const _accent = Color(0xFFB6A6FF);

void openSitePage(BuildContext context, String label) {
  final Widget page = switch (label) {
    'About' => const Aboutme(),
    'Gaming' => const GameservicePage(),
    _ => const ServicePage(),
  };
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
}

class SiteHeader extends StatefulWidget {
  const SiteHeader({
    super.key,
    required this.onHome,
    required this.onTestimonials,
  });
  final VoidCallback onHome;
  final VoidCallback onTestimonials;
  @override
  State<SiteHeader> createState() => _SiteHeaderState();
}

class _SiteHeaderState extends State<SiteHeader> {
  bool _open = false;
  final _menuFocus = FocusNode();
  @override
  void dispose() {
    _menuFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actions = <String, VoidCallback>{
      'Home': widget.onHome,
      'Development': () => openSitePage(context, 'Development'),
      'Gaming': () => openSitePage(context, 'Gaming'),
      'About': () => openSitePage(context, 'About'),
      'Testimonials': widget.onTestimonials,
    };
    final icons = [
      Icons.home_outlined,
      Icons.code_rounded,
      Icons.sports_esports_outlined,
      Icons.person_outline,
      Icons.chat_bubble_outline,
    ];
    void select(VoidCallback action) {
      setState(() => _open = false);
      // Wait for the menu to collapse before measuring the scroll target.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) action();
      });
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact =
            constraints.maxWidth < 940 ||
            MediaQuery.textScalerOf(context).scale(1) > 1.2;
        return TapRegion(
          onTapOutside: (_) {
            if (_open) setState(() => _open = false);
          },
          child: CallbackShortcuts(
            bindings: {
              const SingleActivator(LogicalKeyboardKey.escape): () {
                setState(() => _open = false);
                _menuFocus.requestFocus();
              },
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF15151D),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withValues(alpha: 0.09)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => select(widget.onHome),
                          style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            foregroundColor: Colors.white,
                          ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10,
                            runSpacing: 8,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Color(0xFF7C5CFC), _accent],
                                  ),
                                ),
                                child: const Text(
                                  'H',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const Text(
                                'HachimyDev',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (compact)
                        Semantics(
                          expanded: _open,
                          child: Tooltip(
                            message: _open
                                ? 'Close navigation'
                                : 'Open navigation',
                            child: Material(
                              color: _open
                                  ? const Color(0xFF7C5CFC)
                                  : const Color(0xFF252533),
                              borderRadius: BorderRadius.circular(14),
                              child: InkWell(
                                focusNode: _menuFocus,
                                borderRadius: BorderRadius.circular(14),
                                onTap: () => setState(() => _open = !_open),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Icon(
                                    _open
                                        ? Icons.close_rounded
                                        : Icons.menu_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        ...actions.entries.map(
                          (entry) => TextButton(
                            onPressed: () => select(entry.value),
                            child: Text(entry.key),
                          ),
                        ),
                    ],
                  ),
                  if (compact && _open) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(height: 1, color: Color(0xFF303040)),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'EXPLORE',
                          style: TextStyle(
                            color: _accent,
                            fontSize: 11,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    for (final (index, entry) in actions.entries.indexed)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Material(
                          color: const Color(0xFF1C1C28),
                          borderRadius: BorderRadius.circular(14),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () => select(entry.value),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Icon(icons[index], color: _accent, size: 20),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      entry.key,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_outward_rounded,
                                    color: Colors.white38,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Tooltip(
    message: 'Back to top',
    child: Semantics(
      button: true,
      label: 'Back to top',
      child: Material(
        elevation: 12,
        shadowColor: const Color(0x667C5CFC),
        color: const Color(0xFF7C5CFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Color(0xFFAA97FF)),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          onTap: onTap,
          child: const SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    ),
  );
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key, required this.onTestimonials});
  final VoidCallback onTestimonials;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(top: 32),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HachimyDev',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        const Text(
          'Ideas into apps. More progress in your games.',
          style: TextStyle(color: Colors.white60, height: 1.6),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final label in ['Development', 'Gaming', 'About'])
              TextButton(
                onPressed: () => openSitePage(context, label),
                child: Text(label),
              ),
            TextButton(
              onPressed: onTestimonials,
              child: const Text('Testimonials'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          '© ${DateTime.now().year} HachimyDev · Made with Flutter in Malaysia',
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 12,
            height: 1.6,
          ),
        ),
      ],
    ),
  );
}
