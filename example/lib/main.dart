import 'package:flutter/material.dart';
import 'package:smooth_gradient/smooth_gradient.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Demo',
      home: _Page(),
    ),
  );
}

class _Page extends StatefulWidget {
  const _Page();

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  Curve _curve = Curves.easeInOut;

  @override
  Widget build(BuildContext context) {
    // Black (100% opacity).
    const from = Color(0xFF000000);

    // Black (0% opacity).
    const to = Color(0x00000000);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smooth Gradient'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: SmoothGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  curve: _curve,
                  from: from,
                  to: to,
                  steps: 8,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: DropdownMenu<Curve>(
                initialSelection: _curve,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    label: 'Curves.easeInOut',
                    value: Curves.easeInOut,
                  ),
                  DropdownMenuEntry(
                    label: 'Curves.easeIn',
                    value: Curves.easeIn,
                  ),
                  DropdownMenuEntry(
                    label: 'Curves.easeOut',
                    value: Curves.easeOut,
                  ),
                  DropdownMenuEntry(
                    label: 'Curves.linear',
                    value: Curves.linear,
                  ),
                ],
                onSelected: (value) => setState(() {
                  _curve = value!;
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
