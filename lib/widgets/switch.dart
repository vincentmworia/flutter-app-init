import 'package:flutter/material.dart';

class CustomSwitchAdaptive extends StatefulWidget {
  const CustomSwitchAdaptive(
      {Key? key, required this.active, required this.secondaryColor})
      : super(key: key);
  final Color secondaryColor;
  final bool active;

  @override
  State<CustomSwitchAdaptive> createState() => _CustomSwitchAdaptiveState();
}

class _CustomSwitchAdaptiveState extends State<CustomSwitchAdaptive> {
  bool? initBnState;

  @override
  void initState() {
    super.initState();
    initBnState = widget.active;
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: initBnState!,
      onChanged: (newState) {
        setState(
          () => initBnState = newState,
        );
      },
      activeColor: widget.secondaryColor,
    );
  }
}
