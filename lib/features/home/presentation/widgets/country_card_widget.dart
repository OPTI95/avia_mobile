import 'package:effective_mobile/core/env/constant_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/env/images_and_icons_path.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/entities/country.dart';
import '../cubit/to_text_cubit.dart';

class CountryCardWidget extends StatelessWidget {
  final List<Country> list = [
    Country(name: "Стамбул", pathToPhoto: StaticPath.stambul),
    Country(name: "Сочи", pathToPhoto: StaticPath.sochi),
    Country(name: "Пхукет", pathToPhoto: StaticPath.phuket),
  ];
  CountryCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Card(
        color: StaticColors.grey_3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => const DividerForCounrty(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => CountryWidget(
              name: list[index].name,
              photoPath: list[index].pathToPhoto,
            ),
          ),
        ),
      ),
    );
  }
}

class DividerForCounrty extends StatelessWidget {
  const DividerForCounrty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 16,
      thickness: 1,
      color: StaticColors.grey_5,
    );
  }
}

class CountryWidget extends StatelessWidget {
  final String name;
  final String photoPath;
  const CountryWidget({
    super.key,
    required this.name,
    required this.photoPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final textCubit = context.read<ToTextCubit>();
        textCubit.addText(name);
        await Future.delayed(Duration(seconds: 3))
            .whenComplete(() => context.goNamed("search"));
      },
      child: Row(
        children: [
          PhotoCounryWidget(photoPath: photoPath),
          const SizedBox(
            width: 8,
          ),
          NameCountryWidget(name: name)
        ],
      ),
    );
  }
}

class PhotoCounryWidget extends StatelessWidget {
  const PhotoCounryWidget({
    super.key,
    required this.photoPath,
  });

  final String photoPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Image.asset(
          photoPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class NameCountryWidget extends StatelessWidget {
  const NameCountryWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: StaticTextStyles.title3.copyWith(color: StaticColors.white),
        ),
        Text(
          StaticTexts.popularityDirection,
          style: StaticTextStyles.text2.copyWith(color: StaticColors.grey_5),
        )
      ],
    );
  }
}
