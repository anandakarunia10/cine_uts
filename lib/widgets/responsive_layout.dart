import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget compactBody;
  final Widget wideBody;

  const ResponsiveLayout({
    super.key,
    required this.compactBody,
    required this.wideBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Breakpoint: jika lebar layar >= 600px, tampilkan wide layout (Tablet/Desktop/Landscape)
        if (constraints.maxWidth >= 600) {
          return wideBody;
        } else {
          return compactBody;
        }
      },
    );
  }
}