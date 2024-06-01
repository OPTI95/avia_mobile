import 'package:flutter/material.dart';

import 'bottom_buttons_filter_and_diagramma_widget.dart';
import 'list_tickets_widget.dart';
import 'view_information_from_to_widget.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BottomFiltrAndDiagrammButtonsWidget(),
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
