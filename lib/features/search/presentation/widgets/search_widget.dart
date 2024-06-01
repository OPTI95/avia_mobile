import 'package:flutter/material.dart';

import 'chip_buttons_widget.dart';
import 'input_form_widget.dart';
import 'ticket_airlines_widget.dart';
import 'view_all_ticket_button_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputFormWidget(),
            ChipButtonsWidget(),
            TicketsAirLinesWidget(),
            ViewAllTicketButtonWidget()
          ],
        ),
      ),
    );
  }
}
