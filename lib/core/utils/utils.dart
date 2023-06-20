// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';

class MyUtils {
  static bool isKeyboardShowing() {
    if (WidgetsBinding.instance != null) {
      return WidgetsBinding.instance.window.viewInsets.bottom > 0;
    } else {
      return false;
    }
  }

  static closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

class DottedLine extends StatelessWidget {
  const DottedLine({
    Key? key,
    this.direction = Axis.horizontal,
    this.lineLength = double.infinity,
    this.lineThickness = 1.0,
    this.dashLength = 4.0,
    this.dashColor = Colors.black,
    this.dashGapLength = 4.0,
    this.dashGapColor = Colors.transparent,
    this.dashRadius = 0.0,
    this.dashGapRadius = 0.0,
  }) : super(key: key);

  final Axis direction;

  final double lineLength;

  final double lineThickness;

  final double dashLength;

  final Color dashColor;

  final double dashRadius;

  final double dashGapLength;

  final Color dashGapColor;

  final double dashGapRadius;

  @override
  Widget build(BuildContext context) {
    final isHorizontal = direction == Axis.horizontal;

    return SizedBox(
      width: isHorizontal ? lineLength : lineThickness,
      height: isHorizontal ? lineThickness : lineLength,
      child: LayoutBuilder(builder: (context, constraints) {
        final lineLength = _getLineLength(constraints, isHorizontal);
        final dashAndDashGapCount = _calculateDashAndDashGapCount(lineLength);
        final dashCount = dashAndDashGapCount[0];
        final dashGapCount = dashAndDashGapCount[1];

        return Wrap(
          direction: direction,
          children: List.generate(dashCount + dashGapCount, (index) {
            if (index % 2 == 0) {
              final dash = _buildDash(isHorizontal, dashColor);
              return dash;
            } else {
              final dashGap = _buildDashGap(isHorizontal, dashGapColor);
              return dashGap;
            }
          }).toList(growable: false),
        );
      }),
    );
  }

  double _getLineLength(BoxConstraints constraints, bool isHorizontal) {
    return lineLength == double.infinity
        ? isHorizontal
            ? constraints.maxWidth
            : constraints.maxHeight
        : lineLength;
  }

  List<int> _calculateDashAndDashGapCount(double lineLength) {
    var dashAndDashGapLength = dashLength + dashGapLength;
    var dashCount = lineLength ~/ dashAndDashGapLength;
    var dashGapCount = lineLength ~/ dashAndDashGapLength;
    if (dashLength <= lineLength % dashAndDashGapLength) {
      dashCount += 1;
    }
    return [dashCount, dashGapCount];
  }

  Widget _buildDash(bool isHorizontal, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(dashRadius),
      ),
      width: isHorizontal ? dashLength : lineThickness,
      height: isHorizontal ? lineThickness : dashLength,
    );
  }

  Widget _buildDashGap(bool isHorizontal, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(dashGapRadius),
      ),
      width: isHorizontal ? dashGapLength : lineThickness,
      height: isHorizontal ? lineThickness : dashGapLength,
    );
  }
}
