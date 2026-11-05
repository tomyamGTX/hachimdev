import 'package:hachimdev/home/components/contact_actions.dart'
    show DiscordCommunity;
import 'package:flutter/material.dart';
import 'package:hachimdev/home/components/site_chrome.dart';
import 'package:hachimdev/home/components/hero.dart';
import 'package:hachimdev/home/components/landing_details.dart';

void main() {
  runApp(const HachimyDevApp());
}

class HachimyDevApp extends StatelessWidget {
  const HachimyDevApp({super.key});

  static const primaryColor = Color(0xFF7C5CFC);
  static const secondaryColor = Color(0xFF00D9FF);
  static const backgroundColor = Color(0xFF0D0D12);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HachimyDev',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateBackToTop);
  }

  void _updateBackToTop() {
    final show = _scrollController.offset > 400;
    if (show != _showBackToTop) setState(() => _showBackToTop = show);
  }

  void _backToTop() {
    _scrollController.animateTo(
      0,
      duration: MediaQuery.disableAnimationsOf(context)
          ? Duration.zero
          : const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final _topKey = GlobalKey();
  final _testimonialsKey = GlobalKey();
  static const primaryColor = Color(0xFF7C5CFC);
  static const secondaryColor = Color(0xFF00D9FF);

  void _scrollTo(GlobalKey key) {
    final target = key.currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: MediaQuery.disableAnimationsOf(context)
          ? Duration.zero
          : const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: _showBackToTop
        ? BackToTopButton(onTap: _backToTop)
        : null,
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          final horizontal = isMobile ? 20.0 : 48.0;
          return Column(
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      horizontal,
                      12,
                      horizontal,
                      12,
                    ),
                    child: SiteHeader(
                      key: _topKey,
                      onHome: _backToTop,
                      onTestimonials: () => _scrollTo(_testimonialsKey),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1120),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontal,
                          vertical: isMobile ? 24 : 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            HeroSection(isMobile: isMobile),
                            SizedBox(height: isMobile ? 48 : 64),
                            const LandingDetails(),
                            SizedBox(height: isMobile ? 48 : 64),
                            CustomerShowcase(key: _testimonialsKey),
                            SizedBox(height: isMobile ? 48 : 64),
                            const GettingStarted(),
                            const SizedBox(height: 32),
                            const DiscordCommunity(),
                            SizedBox(height: isMobile ? 60 : 80),
                            SiteFooter(
                              onTestimonials: () => _scrollTo(_testimonialsKey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
