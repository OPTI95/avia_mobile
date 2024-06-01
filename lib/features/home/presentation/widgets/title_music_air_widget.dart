import 'package:flutter/widgets.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/env/constant_text.dart';
import '../../../../core/styles/text_styles.dart';

class TitleMusicAirWidget extends StatelessWidget {
  const TitleMusicAirWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 0, 25),
        child: Text(
          StaticTexts.titleMusicAir,
          style: StaticTextStyles.title1.copyWith(color: StaticColors.white),
        ),
      ),
    );
  }
}