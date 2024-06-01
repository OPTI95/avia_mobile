import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/env/constant_text.dart';
import '../../../../core/styles/text_styles.dart';

class SearchSaleAviaTicketsTextWidget extends StatelessWidget {
  const SearchSaleAviaTicketsTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(94, 28, 94, 36),
      child: Text(
        StaticTexts.searchSaleAviaTickets,
        textAlign: TextAlign.center,
        style: StaticTextStyles.title1.copyWith(
          color: StaticColors.grey_8,
        ),
      ),
    );
  }
}