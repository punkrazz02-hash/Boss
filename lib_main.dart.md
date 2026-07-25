---
created: 2026-07-25T17:02:55+05:45
modified: 2026-07-25T17:04:30+05:45
---

# lib/main. dart

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Boss App'),
        ),
        body: const Center(
          child: Text('Welcome to Boss App!'),
        ),
      ),
    );
  }
}
