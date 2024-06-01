import 'package:effective_mobile/core/styles/colors.dart';
import 'package:effective_mobile/core/env/images_and_icons_path.dart';
import 'package:effective_mobile/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CardsMusicWidget extends StatelessWidget {
  const CardsMusicWidget({
    super.key,
  });

  static const List<String> images = [
    StaticPath.musImage1,
    StaticPath.musImage2,
    StaticPath.musImage3,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: SizedBox(
        height: 220,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CardMusicWidget(images: images, index: index,),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 67,
                ),
            itemCount: 3),
      ),
    );
  }
}

class CardMusicWidget extends StatelessWidget {
  const CardMusicWidget({
    super.key,
    required this.images, required this.index,
  });
  final int index;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlbumPhotoWidget(images: images, index: index),
            const NameArtistWidget(),
            const PlaceWidget(),
            const PriceWidget()
          ],
        );
  }
}

class AlbumPhotoWidget extends StatelessWidget {
  const AlbumPhotoWidget({
    super.key,
    required this.images,
    required this.index,
  });

  final List<String> images;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132,
      height: 132,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class NameArtistWidget extends StatelessWidget {
  const NameArtistWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        "Die AntWoord",
        style: StaticTextStyles.title3
            .copyWith(color: StaticColors.white),
      ),
    );
  }
}

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        "Будапешт",
        style: StaticTextStyles.text2
            .copyWith(color: StaticColors.white),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ImageIcon(
          AssetImage(StaticPath.aviaticket),
          color: StaticColors.grey_6,
        ),
        Text(
          "от 22 264Р",
          style: StaticTextStyles.text2
              .copyWith(color: StaticColors.white),
        )
      ],
    );
  }
}