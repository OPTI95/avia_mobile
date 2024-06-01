import 'package:effective_mobile/core/styles/colors.dart';
import 'package:effective_mobile/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/env/images_and_icons_path.dart';

class ListTicketsWidget extends StatelessWidget {
  const ListTicketsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: 41,
      separatorBuilder: (context, index) => const SizedBox(
        height: 24,
      ),
      itemBuilder: (context, index) => const CardTicketInListWidget(),
    );
  }
}

class CardTicketInListWidget extends StatelessWidget {
  const CardTicketInListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      largeSize: 21,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      backgroundColor: StaticColors.blue,
      label: const Text(
        "Самый удобный",
        style: StaticTextStyles.title4,
      ),
      child: SizedBox(
        height: 120,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: StaticColors.grey_1,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Text(
                        "6954 р",
                        style: StaticTextStyles.title1
                            .copyWith(color: StaticColors.white),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 12,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "17:45",
                              style: StaticTextStyles.title4
                                  .copyWith(color: StaticColors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "VKO",
                              style: StaticTextStyles.title4
                                  .copyWith(color: StaticColors.grey_6),
                            ),
                          ],
                        ),
                        Text(
                          " — ",
                          style: StaticTextStyles.title4
                              .copyWith(color: StaticColors.white),
                        ),
                        Column(
                          children: [
                            Text(
                              "17:45",
                              style: StaticTextStyles.title4
                                  .copyWith(color: StaticColors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "VKO",
                              style: StaticTextStyles.title4
                                  .copyWith(color: StaticColors.grey_6),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Text(
                          "3.5ч в пути / Без пересадок",
                          style: StaticTextStyles.text2
                              .copyWith(color: StaticColors.white),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GraficaIconWidget extends StatelessWidget {
  final Color staticColor;
  const GraficaIconWidget({
    super.key,
    required this.staticColor,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      const AssetImage(StaticPath.grafic),
      color: staticColor,
      size: 32,
    );
  }
}
