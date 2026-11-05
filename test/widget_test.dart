import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hachimdev/main.dart';
import 'package:hachimdev/service.dart';
import 'package:hachimdev/home/components/site_chrome.dart';

void main() {
  testWidgets(
    'Floating back to top appears after scrolling and returns to zero',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));
      expect(find.byType(BackToTopButton), findsNothing);
      final headerPosition = tester.getTopLeft(find.byType(SiteHeader));
      final scroll = tester.state<ScrollableState>(
        find.byType(Scrollable).first,
      );
      scroll.position.jumpTo(700);
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(find.byType(SiteHeader)), headerPosition);
      expect(find.byType(BackToTopButton), findsOneWidget);
      await tester.tap(find.byType(BackToTopButton));
      await tester.pumpAndSettle();
      expect(scroll.position.pixels, 0);
      expect(find.byType(BackToTopButton), findsNothing);
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 6));
    },
  );
  testWidgets('Mobile menu opens development page', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MyHomePage()));
    await tester.tap(find.byTooltip('Open navigation'));
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(SiteHeader),
        matching: find.text('Development'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ServicePage), findsOneWidget);
    await tester.tap(find.byTooltip('Back to previous page'));
    await tester.pumpAndSettle();
    expect(find.byType(MyHomePage), findsOneWidget);
    expect(find.byType(ServicePage), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 6));
  });

  testWidgets('Hero development choice opens services', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MyHomePage()));
    final choice = find.text('View website & app services').first;
    await tester.ensureVisible(choice);
    await tester.pumpAndSettle();
    await tester.tap(choice);
    await tester.pumpAndSettle();
    expect(find.byType(ServicePage), findsOneWidget);
  });

  testWidgets('Customer screenshot opens and closes', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: CustomerShowcase())),
      ),
    );
    await tester.tap(find.text('View completed events ↗').first);
    await tester.pumpAndSettle();
    expect(find.byType(InteractiveViewer), findsOneWidget);
    await tester.tap(find.byTooltip('Close image'));
    await tester.pumpAndSettle();
    expect(find.byType(InteractiveViewer), findsNothing);
    expect(find.text('Event clears & event quests'), findsOneWidget);
    expect(find.text('Code redemption & daily tasks'), findsOneWidget);
    expect(find.text('Shiori'), findsOneWidget);
    final shioriImage = find.text('View redeemed rewards ↗');
    await tester.ensureVisible(shioriImage);
    await tester.pumpAndSettle();
    await tester.tap(shioriImage);
    await tester.pumpAndSettle();
    expect(find.byType(InteractiveViewer), findsOneWidget);
    expect(
      tester
          .widget<Image>(
            find.descendant(
              of: find.byType(InteractiveViewer),
              matching: find.byType(Image),
            ),
          )
          .image,
      const AssetImage('assets/shiori-redeem-daily.png'),
    );
  });
  for (final width in [320.0, 375.0, 700.0, 768.0, 1024.0, 1440.0]) {
    for (final scale in [1.0, 1.5]) {
      testWidgets('Home and development at $width, text scale $scale', (
        tester,
      ) async {
        tester.view.physicalSize = Size(width, 900);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        for (final page in [const MyHomePage(), const ServicePage()]) {
          await tester.pumpWidget(
            MaterialApp(
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(scale)),
                child: child!,
              ),
              home: page,
            ),
          );
          await tester.pump();

          final error = tester.takeException();

          expect(error, isNull);
          await tester.pumpWidget(const SizedBox.shrink());
          await tester.pump(const Duration(seconds: 6));
        }
      });
    }
  }
}
