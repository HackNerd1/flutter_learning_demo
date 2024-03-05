import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {super.key,
      this.colors,
      this.borderRadius,
      this.height,
      this.width,
      this.onPressed,
      required this.child});
// 渐变色数组
  final List<Color>? colors;

  final BorderRadius? borderRadius;

  //点击回调
  final GestureTapCallback? onPressed;

  // 按钮宽高
  final double? width;
  final double? height;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          onTap: onPressed,
          borderRadius: borderRadius,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: const TextStyle(fontWeight: FontWeight.bold),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
