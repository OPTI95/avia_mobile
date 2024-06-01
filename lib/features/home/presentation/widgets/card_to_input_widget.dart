import 'package:effective_mobile/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/env/constant_text.dart';
import '../../../../core/env/images_and_icons_path.dart';
import '../../../../core/styles/text_styles.dart';
import 'home_input_form_air_from_to_widget.dart';

class CardToInputWidget extends StatelessWidget {
  const CardToInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: SizedBox(
        height: 90,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: StaticColors.grey_4,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FromInputWidget(),
                Divider(
                  height: 5,
                  thickness: 1,
                ),
                ToInputTextFieldWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FromInputWidget extends StatelessWidget {
  const FromInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PlaneIconWidget(
          staticColor: StaticColors.grey_6,
        ),
        Text(
          "Минск",
          style:
              StaticTextStyles.buttonText1.copyWith(color: StaticColors.white),
        )
      ],
    );
  }
}

class ToInputTextFieldWidget extends StatelessWidget {
  const ToInputTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: TextField(
        onSubmitted: (val) {
          context.goNamed("search");
        },
        style: StaticTextStyles.buttonText1.copyWith(color: StaticColors.white),
        decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints.tight(const Size(30, 20)),
          prefixIcon: const SearchIconWidget(staticColor: StaticColors.white),
          hintText: StaticTexts.hintTextTo,
          hintStyle:
              StaticTextStyles.buttonText1.copyWith(color: StaticColors.grey_6),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const ClearIconWidget(staticColor: StaticColors.grey_6),
          ),
        ),
      ),
    );
  }
}

class PlaneIconWidget extends StatelessWidget {
  final Color staticColor;
  const PlaneIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.plane),
      color: staticColor,
      size: 32,
    );
  }
}

class ClearIconWidget extends StatelessWidget {
  final Color staticColor;
  const ClearIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.clear),
      color: staticColor,
      size: 32,
    );
  }
}
