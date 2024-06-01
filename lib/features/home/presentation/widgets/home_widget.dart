import 'package:flutter/material.dart';

import 'card_music_widget.dart';
import 'home_input_form_air_from_to_widget.dart';
import 'search_sale_avia_ticket_widget.dart';
import 'title_music_air_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchSaleAviaTicketsTextWidget(),
        HomeInpuFormAirFromToWidget(),
        TitleMusicAirWidget(),
        CardsMusicWidget(),
      ],
    );
  }
}