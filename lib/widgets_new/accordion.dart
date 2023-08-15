import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import '../constants/font.dart';
import '../constants/spacing.dart';
import '../constants/colors.dart';

class Accordion extends StatefulWidget {
  final Widget menu;
  final Function onPressed;

  const Accordion({
    Key? key,
    required this.onPressed,
    required this.menu,
  }) : super(key: key);

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  late Function onPressed;
  late Widget menu;
  bool _first = true;
  bool _droppedDown = false;

  @override
  void initState() {
    menu = widget.menu;
    _droppedDown = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 250),
      firstChild: Material(
        child: InkWell(
          onTap: () {
            setState(() {
              _first = !_first;
            });
          },
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.space4,
              AppSpacing.space3,
              AppSpacing.space4,
              AppSpacing.space3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'click to expand more ...',
                  style: AppFont.smallMedium(),
                ),
                SizedBox(width: AppSpacing.space4),
                Icon(Icons.expand_more),
              ],
            ),
          ),
        ),
      ),
      secondChild: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Material(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _first = !_first;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.space4,
                    AppSpacing.space3,
                    AppSpacing.space4,
                    AppSpacing.space3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'click to see less...',
                        style: AppFont.smallMedium(),
                      ),
                      Icon(Icons.expand_less),
                    ],
                  ),
                ),
              ),
            ),
            menu
          ],
        ),
      ),
      crossFadeState:
          _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
