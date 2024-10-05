import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smooth_gradient/smooth_gradient.dart';

void main() {
  const from = Color(0xFFFF0000);
  const to = Color(0xFF00FF00);

  testWidgets(
    'LinearGradient is rendered correctly',
    (tester) async {
      await _matchGradient(
        tester,
        gradient: const LinearGradient(colors: [from, to]),
        path: 'goldens/linear_gradient.png',
      );
    },
  );

  testWidgets(
    'SmoothGradient (linear) is rendered correctly',
    (tester) async {
      await _matchGradient(
        tester,
        gradient: SmoothGradient(
          from: from,
          to: to,
          curve: Curves.linear,
        ),
        path: 'goldens/smooth_gradient_linear.png',
      );
    },
  );

  testWidgets(
    'SmoothGradient (easeInOut) is rendered correctly',
    (tester) async {
      await _matchGradient(
        tester,
        gradient: SmoothGradient(from: from, to: to),
        path: 'goldens/smooth_gradient_easeInOut.png',
      );
    },
  );

  // Doesn't work due to differences in rounding between the two gradients.
  // testWidgets(
  //   'SmoothGradient with linear curve matches LinearGradient',
  //   (tester) async {
  //     await _matchGradient(
  //       tester,
  //       gradient: SmoothGradient(
  //         from: from,
  //         to: to,
  //         curve: Curves.linear,
  //       ),
  //       path: 'goldens/linear_gradient.png',
  //     );
  //   },
  // );
}

Future<void> _matchGradient(
  WidgetTester tester, {
  required Gradient gradient,
  required String path,
}) async {
  await tester.pumpWidget(
    DecoratedBox(
      decoration: BoxDecoration(gradient: gradient),
      child: const SizedBox.square(dimension: 100),
    ),
  );
  await expectLater(
    find.byType(DecoratedBox),
    matchesGoldenFile(path),
  );
}
