import 'package:flutter/material.dart';

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
      height: 290,
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
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      const TicketAirLinesCardWidget(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TicketAirLinesCardWidget extends StatelessWidget {
  const TicketAirLinesCardWidget({
    super.key,
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
            "Уральские авиалинии",
            style: StaticTextStyles.title4.copyWith(color: StaticColors.white),
          ),
          const Spacer(),
          Text(
            "2390р",
            style: StaticTextStyles.title4.copyWith(color: StaticColors.blue),
          ),
          const NextIconWidget(staticColor: StaticColors.blue)
        ],
      ),
      subtitle: Text(
        "07:00 09:10 10:00 11:00 12:00 13:00 12:00 14:00",
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
