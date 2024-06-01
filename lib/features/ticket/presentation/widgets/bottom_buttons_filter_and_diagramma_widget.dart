import 'package:flutter/material.dart';

import '../../../../core/env/constant_text.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../search/presentation/widgets/chip_buttons_widget.dart';
import 'list_tickets_widget.dart';

class BottomFiltrAndDiagrammButtonsWidget extends StatelessWidget {
  const BottomFiltrAndDiagrammButtonsWidget({
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
            style: StaticTextStyles.title4.copyWith(color: StaticColors.white),
          ),
          const SizedBox(
            width: 16,
          ),
          const GraficaIconWidget(staticColor: StaticColors.white),
          Text(
            StaticTexts.graficPrice,
            style: StaticTextStyles.title4.copyWith(color: StaticColors.white),
          ),
        ],
      ),
    );
  }
}
