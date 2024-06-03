import 'package:effective_mobile/core/styles/colors.dart';
import 'package:effective_mobile/core/env/images_and_icons_path.dart';
import 'package:effective_mobile/core/styles/text_styles.dart';
import 'package:effective_mobile/features/home/presentation/cubit/music_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final state = context.read<MusicEventsCubit>().state as LoadedMusicEventState;
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: SizedBox(
        height: 220,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CardMusicWidget(
                  images: images,
                  index: index,
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 67,
                ),
            itemCount: state.list.length),
      ),
    );
  }
}

class CardMusicWidget extends StatelessWidget {
  const CardMusicWidget({
    super.key,
    required this.images,
    required this.index,
  });
  final int index;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final state = context.read<MusicEventsCubit>().state as LoadedMusicEventState;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AlbumPhotoWidget(images: images, index: index),
        NameArtistWidget(
          name: state.list[index].title,
        ),
        PlaceWidget(
          town: state.list[index].town,
        ),
        PriceWidget(
          index: index,
        )
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
  final String name;
  const NameArtistWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        name,
        style: StaticTextStyles.title3.copyWith(color: StaticColors.white),
      ),
    );
  }
}

class PlaceWidget extends StatelessWidget {
  final String town;
  const PlaceWidget({
    super.key,
    required this.town,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        town,
        style: StaticTextStyles.text2.copyWith(color: StaticColors.white),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  final int index;
  const PriceWidget({
    super.key,
    required this.index,
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
          "от ${context.read<MusicEventsCubit>().formatPrice(index)} ₽",
          style: StaticTextStyles.text2.copyWith(color: StaticColors.white),
        )
      ],
    );
  }
}
