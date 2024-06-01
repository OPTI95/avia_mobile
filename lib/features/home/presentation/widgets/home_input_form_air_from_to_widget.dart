import 'package:effective_mobile/core/env/images_and_icons_path.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/env/constant_text.dart';
import '../../../../core/styles/text_styles.dart';
import 'choosing_where_to_go_widget.dart';

class HomeInpuFormAirFromToWidget extends StatelessWidget {
  const HomeInpuFormAirFromToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      child: SizedBox(
        height: 122,
        width: double.infinity,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: StaticColors.grey_3,
            child: const CardWithInputTextWidget()),
      ),
    );
  }
}

class CardWithInputTextWidget extends StatelessWidget {
  const CardWithInputTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 90,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: StaticColors.grey_4,
          child: const Row(
            children: [
              SearchIconWidget(
                staticColor: StaticColors.black,
              ),
              TextFieldsFromToWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldsFromToWidget extends StatelessWidget {
  const TextFieldsFromToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldFromWidget(),
            DividerInputTextWidget(),
            TextFieldToWidget(),
          ],
        ),
      ),
    );
  }
}

class DividerInputTextWidget extends StatelessWidget {
  const DividerInputTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Divider(color: StaticColors.white, thickness: 1, height: 4),
    );
  }
}

class TextFieldToWidget extends StatelessWidget {
  const TextFieldToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const ChoosingWhereToGoWidget();
            },
          );
        },
        child: TextField(
          enabled: false,
          style:
              StaticTextStyles.buttonText1.copyWith(color: StaticColors.white),
          decoration: InputDecoration(
            hintText: StaticTexts.hintTextTo,
            hintStyle: StaticTextStyles.buttonText1
                .copyWith(color: StaticColors.grey_6),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          ),
        ),
      ),
    );
  }
}

class TextFieldFromWidget extends StatelessWidget {
  const TextFieldFromWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29,
      child: TextField(
        style: StaticTextStyles.buttonText1.copyWith(color: StaticColors.white),
        decoration: InputDecoration(
          hintText: StaticTexts.hintTextFrom,
          hintStyle:
              StaticTextStyles.buttonText1.copyWith(color: StaticColors.grey_6),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
        ),
      ),
    );
  }
}

class SearchIconWidget extends StatelessWidget {
  final Color staticColor;
  const SearchIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.search),
      color: staticColor,
      size: 32,
    );
  }
}
