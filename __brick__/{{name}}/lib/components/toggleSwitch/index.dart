import 'package:{{name.lowerCase()}}/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class ToggleSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const ToggleSwitch({
    super.key,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  _ToggleSwitch createState() => _ToggleSwitch();
}

class _ToggleSwitch extends State<ToggleSwitch> {
  late bool current;

  @override
  void initState() {
    super.initState();
    current = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    var red = const Color(0xFFD9DBE0);
    var green = Theme.of(context).colors.customColor3;
    const borderWidth = 2.0;
    const height = 20.0;
    const innerIndicatorSize = height;

    return CustomAnimatedToggleSwitch(
      current: current,
      values: const [false, true],
      animationDuration: const Duration(milliseconds: 350),
      animationCurve: Curves.bounceOut,
      iconBuilder: (context, local, global) => const SizedBox(),
      onTap: (_) {
        setState(() => current = !current);
        widget.onChanged(current);
      },
      iconsTappable: false,
      onChanged: (b) {
        setState(() => current = b);
        widget.onChanged(b);
      },
      height: height,
      padding: const EdgeInsets.all(borderWidth),
      indicatorSize: const Size.square(height - 2 * borderWidth),
      foregroundIndicatorBuilder: (context, global) {
        return Container(
          alignment: Alignment.center,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Container(
              width: 50,
              height: innerIndicatorSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              )),
        );
      },
      wrapperBuilder: (context, global, child) {
        final color = Color.lerp(red, green, global.position)!;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: child,
        );
      },
    );
  }
}
