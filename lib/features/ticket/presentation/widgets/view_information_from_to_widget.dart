import 'package:effective_mobile/core/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../search/presentation/widgets/input_form_widget.dart';

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