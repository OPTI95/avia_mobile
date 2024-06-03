import 'package:effective_mobile/features/search/presentation/cubit/texts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: const ReturnIconWidget(
                    staticColor: StaticColors.white,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: InputForm(),
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

class InputForm extends StatefulWidget {
  const InputForm({
    super.key,
  });

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  void initState() {
    context.read<TextsCubit>().setInitial(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextsCubit, TextsState>(
      listener: (context, state) {
        if (state is TextsLoaded) {
          setState(() {});
        }
      },
      builder: (context, state) {
        if (state is TextsLoaded) {
          // ignore: prefer_const_constructors
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              TextFromWidget(),
              const DividerInputTextWidget(),
              // ignore: prefer_const_constructors
              TextToWidget(),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
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
              (context.read<TextsCubit>().state as TextsLoaded).textTo,
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
            (context.read<TextsCubit>().state as TextsLoaded).textFrom,
            style: StaticTextStyles.buttonText1
                .copyWith(color: StaticColors.white),
          ),
          InkWell(
            onTap: () {
              context.read<TextsCubit>().change();
            },
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
