import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/env/images_and_icons_path.dart';
import '../../../../core/styles/text_styles.dart';

class ChipButtonsWidget extends StatelessWidget {
  const ChipButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        height: 45,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            CustomCard(
              onTap: () {},
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: ProfileIconWidget(staticColor: StaticColors.grey_5),
                  ),
                  Text(
                    "1, эконом",
                    style: StaticTextStyles.title4
                        .copyWith(color: StaticColors.white),
                  ),
                ],
              ),
            ),
            CustomCard(
              onTap: () {},
              child: Row(
                children: [
                  const AddIconWidget(
                    staticColor: StaticColors.white,
                  ),
                  Text(
                    "обратно",
                    style: StaticTextStyles.title4
                        .copyWith(color: StaticColors.white),
                  ),
                ],
              ),
            ),
            CustomCard(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "24 фев, ",
                    style: StaticTextStyles.title4
                        .copyWith(color: StaticColors.white),
                  ),
                  Text(
                    "cб",
                    style: StaticTextStyles.title4
                        .copyWith(color: StaticColors.grey_6),
                  ),
                ],
              ),
            ),
            CustomCard(
              onTap: () {},
              child: const FiltrIconWidget(staticColor: StaticColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const CustomCard({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: StaticColors.grey_3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: child,
        ),
      ),
    );
  }
}

class AddIconWidget extends StatelessWidget {
  final Color staticColor;
  const AddIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.add),
      color: staticColor,
      size: 32,
    );
  }
}

class ProfileIconWidget extends StatelessWidget {
  final Color staticColor;
  const ProfileIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.profile),
      color: staticColor,
      size: 32,
    );
  }
}

class FiltrIconWidget extends StatelessWidget {
  final Color staticColor;
  const FiltrIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.filtr),
      color: staticColor,
      size: 32,
    );
  }
}
