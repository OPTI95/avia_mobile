import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';
import 'card_to_input_widget.dart';
import 'country_card_widget.dart';
import 'divider_for_model_splash_widget.dart';
import 'hot_buttons_widget.dart';

class ChoosingWhereToGoWidget extends StatelessWidget {
  const ChoosingWhereToGoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: StaticColors.grey_2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          primary: false,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const DividerForModelSplashWidget(),
                const CardToInputWidget(),
                HotButtonsWidget(),
                CountryCardWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}