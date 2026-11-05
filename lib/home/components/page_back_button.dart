import 'package:flutter/material.dart';

class PageBackButton extends StatelessWidget {
  const PageBackButton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
    child: Tooltip(
      message: 'Back to previous page',
      child: Material(
        color: const Color(0xFF20202D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: Color(0xFF39334F)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => Navigator.of(context).maybePop(),
          child: const SizedBox(
            width: 44,
            height: 44,
            child: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF00D9FF),
              size: 22,
            ),
          ),
        ),
      ),
    ),
  );
}
