import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/env/constant_text.dart';
import '../../../../core/env/images_and_icons_path.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/entities/hot_button.dart';

class HotButtonsWidget extends StatelessWidget {
  HotButtonsWidget({
    super.key,
  });
  final List<HotButton> buttonList = [
    HotButton(
      caption: StaticTexts.hardWay,
      iconName: StaticPath.marshrut,
      color: StaticColors.green,
    ),
    HotButton(
      caption: StaticTexts.goToLike,
      iconName: StaticPath.shar,
      color: StaticColors.blue,
    ),
    HotButton(
      caption: StaticTexts.weekends,
      iconName: StaticPath.calendar,
      color: StaticColors.dark_blue,
    ),
    HotButton(
      caption: StaticTexts.hotTikets,
      iconName: StaticPath.fair,
      color: StaticColors.red,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: buttonList.length,
          itemBuilder: (context, index) => HotButtonCardWidget(
                iconName: buttonList[index].iconName,
                caption: buttonList[index].caption,
                color: buttonList[index].color,
              )),
    );
  }
}



class HotButtonCardWidget extends StatelessWidget {
  final String iconName;
  final String caption;
  final Color color;
  const HotButtonCardWidget({
    super.key,
    required this.iconName,
    required this.caption,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconCardHotButtonWidget(color: color, iconName: iconName),
            const SizedBox(
              height: 8,
            ),
            CaptionHotButtonWidget(caption: caption)
          ],
        ),
      ),
    );
  }
}

class CaptionHotButtonWidget extends StatelessWidget {
  const CaptionHotButtonWidget({
    super.key,
    required this.caption,
  });

  final String caption;

  @override
  Widget build(BuildContext context) {
    return Text(
      caption,
      style: StaticTextStyles.text2.copyWith(color: StaticColors.white),
      textAlign: TextAlign.center,
    );
  }
}

class IconCardHotButtonWidget extends StatelessWidget {
  const IconCardHotButtonWidget({
    super.key,
    required this.color,
    required this.iconName,
  });

  final Color color;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 58,
      child: Card(
        color: color,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ImageIcon(
          AssetImage(iconName),
          color: StaticColors.white,
        ),
      ),
    );
  }
}
