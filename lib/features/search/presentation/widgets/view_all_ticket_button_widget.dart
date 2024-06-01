import 'package:effective_mobile/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/env/constant_text.dart';
import '../../../../core/styles/text_styles.dart';

class ViewAllTicketButtonWidget extends StatelessWidget {
  const ViewAllTicketButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23),
      child: SizedBox(
        height: 42,
        child: ElevatedButton(
          onPressed: () {
            context.goNamed("ticket");
          },
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(StaticColors.blue),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Text(
            StaticTexts.viewAllTickets,
            style: StaticTextStyles.buttonText1.copyWith(
                color: StaticColors.white, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
