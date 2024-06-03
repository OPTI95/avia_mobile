import 'package:effective_mobile/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
            ReturnDate(),
            const CountPeople(),
            GoDate(),
            const FlitrWidget(),
          ],
        ),
      ),
    );
  }
}

class FlitrWidget extends StatelessWidget {
  const FlitrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {},
      child: const FiltrIconWidget(staticColor: StaticColors.white),
    );
  }
}

// ignore: must_be_immutable
class GoDate extends StatefulWidget {
  String day =
      DateFormat('d MMM', 'ru').format(DateTime.now()).replaceFirst('.', ',');
  String weekday = DateFormat('E', 'ru').format(DateTime.now());
  GoDate({super.key});

  @override
  State<GoDate> createState() => _GoDateState();
}

class _GoDateState extends State<GoDate> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () async {
        final selectedDate = await showDate(context);
        if (selectedDate != null) {
          // ignore: use_build_context_synchronously
          context.read<SearchCubit>().toDate = selectedDate;
          widget.day = DateFormat('d MMM', 'ru')
              .format(selectedDate)
              .replaceFirst('.', ',');
          widget.weekday = DateFormat('E', 'ru').format(selectedDate);
          setState(() {
            
          });
        }
      },
      child: Row(
        children: [
          Text(
            widget.day,
            style: StaticTextStyles.title4.copyWith(color: StaticColors.white),
          ),
          Text(
            widget.weekday,
            style: StaticTextStyles.title4.copyWith(color: StaticColors.grey_6),
          ),
        ],
      ),
    );
  }
}

Future<DateTime?> showDate(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: context.read<SearchCubit>().toDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
    locale: const Locale('ru'),
  );
}

// ignore: must_be_immutable
class ReturnDate extends StatefulWidget {
  String day =
      DateFormat('d MMM', 'ru').format(DateTime.now()).replaceFirst('.', ',');
  String weekday = DateFormat('E', 'ru').format(DateTime.now());
  ReturnDate({
    super.key,
  });

  @override
  State<ReturnDate> createState() => _ReturnDateState();
}

class _ReturnDateState extends State<ReturnDate> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () async {
        context.read<SearchCubit>().returnDate = await showDate(context);
        setState(() {
          if (context.read<SearchCubit>().returnDate != null) {
            widget.day = DateFormat('d MMM', 'ru')
                .format(context.read<SearchCubit>().returnDate!)
                .replaceFirst('.', ',');
            widget.weekday = DateFormat('E', 'ru')
                .format(context.read<SearchCubit>().returnDate!);
          }
        });
        //context.read<SearchCubit>().setReturnDate() = await showDate(context);
      },
      child: Row(
        children: [
          const AddIconWidget(
            staticColor: StaticColors.white,
          ),
          context.read<SearchCubit>().returnDate == null
              ? Text(
                  "обратно",
                  style: StaticTextStyles.title4
                      .copyWith(color: StaticColors.white),
                )
              : Row(
                  children: [
                    Text(
                      widget.day,
                      style: StaticTextStyles.title4
                          .copyWith(color: StaticColors.white),
                    ),
                    Text(
                      widget.weekday,
                      style: StaticTextStyles.title4
                          .copyWith(color: StaticColors.grey_6),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class CountPeople extends StatelessWidget {
  const CountPeople({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () async {},
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ProfileIconWidget(staticColor: StaticColors.grey_5),
          ),
          Text(
            "1, эконом",
            style: StaticTextStyles.title4.copyWith(color: StaticColors.white),
          ),
        ],
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
