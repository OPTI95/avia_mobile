import 'package:effective_mobile/core/env/images_and_icons_path.dart';
import 'package:effective_mobile/features/home/presentation/cubit/from_text_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          child: Row(
            children: [
              const SearchIconWidget(
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
  final TextEditingController controller = TextEditingController();
  TextFieldsFromToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FromInput(controller: controller),
            const DividerInputTextWidget(),
            const TextFieldToWidget(),
          ],
        ),
      ),
    );
  }
}

class FromInput extends StatelessWidget {
  const FromInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FromTextCubit, FromTextState>(
      builder: (context, state) {
        if (state is FromTextInitial) {
          context.read<FromTextCubit>().getSaveText();
          return TextFieldFromWidget(
            controller: controller,
          );
        } else if (state is FromTextLoading) {
          controller.text = "Загрузка...";
          return TextFieldFromWidget(
            controller: controller,
          );
        } else if (state is FromTextLoaded) {
          if (state.text != null) {
            controller.text = state.text!;
            return TextFieldFromWidget(
              controller: controller,
            );
          } else {
            controller.text = "";
            return TextFieldFromWidget(
              controller: controller,
            );
          }
        } else {
          controller.text = "Ошибка";
          return TextFieldFromWidget(
            controller: controller,
          );
        }
      },
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
        onTap: () async {
          await context.read<FromTextCubit>().getSaveText();
          await showModalBottomSheet(
            // ignore: use_build_context_synchronously
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
  final TextEditingController controller;

  const TextFieldFromWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FromTextCubit>();
    return SizedBox(
      height: 30,
      child: TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'[\u0400-\u04FF\s]*'),
          )
        ],
        controller: controller,
        onSubmitted: (value) async => await cubit.saveText(value),
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
