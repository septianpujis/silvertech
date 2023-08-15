import "package:flutter/material.dart";
import "package:silver_tech/area.dart";
import "package:silver_tech/main.dart";
import "package:silver_tech/widgets_new/banner.dart";
import "package:silver_tech/widgets_new/chips.dart";

class SDK extends StatelessWidget {
  const SDK({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Area(light: true),
            OntegoChip(label: "HUHA", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
