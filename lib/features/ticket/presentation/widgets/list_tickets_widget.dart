import 'package:effective_mobile/core/styles/colors.dart';
import 'package:effective_mobile/core/styles/text_styles.dart';
import 'package:effective_mobile/features/ticket/domain/entities/ticket.dart';
import 'package:effective_mobile/features/ticket/presentation/cubit/ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/env/images_and_icons_path.dart';

class ListTicketsWidget extends StatelessWidget {
  const ListTicketsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketCubit, TicketState>(
      builder: (context, state) {
        if (state is TicketLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount:
                (context.read<TicketCubit>().state as TicketLoaded).list.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 24,
            ),
            itemBuilder: (context, index) => CardTicketInListWidget(
              index: index,
            ),
          );
        } else if (state is TicketLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TicketInitial) {
          context.read<TicketCubit>().fetchTickets();
          return const SizedBox();
        } else {
          return Text((state as TicketError).error);
        }
      },
    );
  }
}

class CardTicketInListWidget extends StatelessWidget {
  final int index;
  const CardTicketInListWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final list =
        (context.read<TicketCubit>().state as TicketLoaded).list[index];
    final cubit = context.read<TicketCubit>();
    return Badge(
      isLabelVisible: list.badge == null ? false : true,
      largeSize: 21,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      backgroundColor: StaticColors.blue,
      label: Text(
        list.badge ?? "",
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
                    PriceWidget(cubit: cubit, index: index),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 12,
                          ),
                        ),
                        DepartureWidget(cubit: cubit, list: list),
                        Text(
                          " — ",
                          style: StaticTextStyles.title4
                              .copyWith(color: StaticColors.white),
                        ),
                        ArrivalWidget(cubit: cubit, list: list),
                        const SizedBox(
                          width: 13,
                        ),
                        Row(
                          children: [
                            TimeFlyWidget(cubit: cubit, list: list),
                            HasTransferWidget(list: list),
                          ],
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

class HasTransferWidget extends StatelessWidget {
  const HasTransferWidget({
    super.key,
    required this.list,
  });

  final Ticket list;

  @override
  Widget build(BuildContext context) {
    return Text(
      list.hasTransfer
          ? "С пересадками"
          : "Без пересадок",
      style: StaticTextStyles.text2
          .copyWith(color: StaticColors.white),
    );
  }
}

class TimeFlyWidget extends StatelessWidget {
  const TimeFlyWidget({
    super.key,
    required this.cubit,
    required this.list,
  });

  final TicketCubit cubit;
  final Ticket list;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${cubit.calculateTime(list.departure.date, list.arrival.date)}ч в пути / ",
      style: StaticTextStyles.text2
          .copyWith(color: StaticColors.white),
    );
  }
}

class ArrivalWidget extends StatelessWidget {
  const ArrivalWidget({
    super.key,
    required this.cubit,
    required this.list,
  });

  final TicketCubit cubit;
  final Ticket list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cubit.getHours(list.arrival.date),
          style: StaticTextStyles.title4
              .copyWith(color: StaticColors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          list.arrival.airport,
          style: StaticTextStyles.title4
              .copyWith(color: StaticColors.grey_6),
        ),
      ],
    );
  }
}

class DepartureWidget extends StatelessWidget {
  const DepartureWidget({
    super.key,
    required this.cubit,
    required this.list,
  });

  final TicketCubit cubit;
  final Ticket list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cubit.getHours(list.departure.date),
          style: StaticTextStyles.title4
              .copyWith(color: StaticColors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          list.departure.airport,
          style: StaticTextStyles.title4
              .copyWith(color: StaticColors.grey_6),
        ),
      ],
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.cubit,
    required this.index,
  });

  final TicketCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Text(
        "${cubit.formatPrice(index)} ₽",
        style: StaticTextStyles.title1
            .copyWith(color: StaticColors.white),
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
