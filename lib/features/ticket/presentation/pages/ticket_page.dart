import 'package:effective_mobile/core/styles/colors.dart';
import 'package:effective_mobile/core/env/constant_text.dart';
import 'package:effective_mobile/core/styles/text_styles.dart';
import 'package:effective_mobile/features/search/presentation/widgets/chip_buttons_widget.dart';
import 'package:effective_mobile/features/search/presentation/widgets/input_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/env/images_and_icons_path.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomScreenFiltrAndGraficButtonWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ViewInformationFromToWidget(),
              ListTicketsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomScreenFiltrAndGraficButtonWidget extends StatelessWidget {
  const BottomScreenFiltrAndGraficButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(StaticColors.blue),
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FiltrIconWidget(staticColor: StaticColors.white),
          Text(
            StaticTexts.filtr,
            style:
                StaticTextStyles.title4.copyWith(color: StaticColors.white),
          ),
          const SizedBox(
            width: 16,
          ),
          const GraficaIconWidget(staticColor: StaticColors.white),
          Text(
            StaticTexts.graficPrice,
            style:
                StaticTextStyles.title4.copyWith(color: StaticColors.white),
          ),
        ],
      ),
    );
  }
}

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

class ViewInformationFromToWidget extends StatelessWidget {
  const ViewInformationFromToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 34),
      child: ColoredBox(
        color: StaticColors.grey_2,
        child: SizedBox(
            height: 56,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                const ReturnIconWidget(staticColor: StaticColors.blue),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Москва - Сочи",
                      style: StaticTextStyles.title3
                          .copyWith(color: StaticColors.white),
                    ),
                    Text(
                      "23 февраля, 1 пассажир",
                      style: StaticTextStyles.title4
                          .copyWith(color: StaticColors.grey_6),
                    ),
                  ],
                )
              ],
            )),
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
