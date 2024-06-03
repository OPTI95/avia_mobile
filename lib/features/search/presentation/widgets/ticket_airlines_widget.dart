import 'package:effective_mobile/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/env/constant_text.dart';
import '../../../../core/env/images_and_icons_path.dart';
import '../../../../core/styles/text_styles.dart';

class TicketsAirLinesWidget extends StatelessWidget {
  const TicketsAirLinesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: StaticColors.grey_3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StaticTexts.straightRails,
                style:
                    StaticTextStyles.title2.copyWith(color: StaticColors.white),
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoaded) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount:
                            (context.read<SearchCubit>().state as SearchLoaded)
                                .list
                                .length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            TicketAirLinesCardWidget(
                          index: index,
                        ),
                      ),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    context.read<SearchCubit>().fetchSearchTickets();
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TicketAirLinesCardWidget extends StatelessWidget {
  final int index;
  const TicketAirLinesCardWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 12,
      ),
      title: Row(
        children: [
          Text(
            (context.read<SearchCubit>().state as SearchLoaded)
                .list[index]
                .title,
            style: StaticTextStyles.title4.copyWith(color: StaticColors.white),
          ),
          const Spacer(),
          Text(
            "${context.read<SearchCubit>().formatPrice(index)} ₽",
            style: StaticTextStyles.title4.copyWith(color: StaticColors.blue),
          ),
          const NextIconWidget(staticColor: StaticColors.blue)
        ],
      ),
      subtitle: Text(
        (context.read<SearchCubit>().state as SearchLoaded)
            .list[index]
            .timerange
            .join(' '),
        softWrap: true,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: StaticTextStyles.text2.copyWith(color: StaticColors.white),
      ),
    );
  }
}

class NextIconWidget extends StatelessWidget {
  final Color staticColor;
  const NextIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.next),
      color: staticColor,
      size: 32,
    );
  }
}
