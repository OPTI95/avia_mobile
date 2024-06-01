import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/env/images_and_icons_path.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../home/presentation/widgets/card_to_input_widget.dart';
import '../../../home/presentation/widgets/home_input_form_air_from_to_widget.dart';

class InputFormWidget extends StatelessWidget {
  const InputFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 47.0),
      child: SizedBox(
        height: 96,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: StaticColors.grey_3,
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              children: [
                ReturnIconWidget(
                  staticColor: StaticColors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFromWidget(),
                        DividerInputTextWidget(),
                        TextToWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextToWidget extends StatelessWidget {
  const TextToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 29,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Сочи",
              style: StaticTextStyles.buttonText1
                  .copyWith(color: StaticColors.white),
            ),
            const ClearIconWidget(
              staticColor: StaticColors.white,
            ),
          ],
        ));
  }
}

class TextFromWidget extends StatelessWidget {
  const TextFromWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Москва",
            style: StaticTextStyles.buttonText1
                .copyWith(color: StaticColors.white),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: const ChangeIconWidget(
              staticColor: StaticColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ChangeIconWidget extends StatelessWidget {
  final Color staticColor;
  const ChangeIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.change),
      color: staticColor,
      size: 32,
    );
  }
}

class ReturnIconWidget extends StatelessWidget {
  final Color staticColor;
  const ReturnIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.returnIcon),
      color: staticColor,
      size: 32,
    );
  }
}
