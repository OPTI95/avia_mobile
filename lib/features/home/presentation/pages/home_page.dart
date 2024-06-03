import 'package:effective_mobile/features/home/presentation/cubit/music_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MusicEventsCubit, MusicEventsState>(
        builder: (context, state) {
          if (state is LoadedMusicEventState) {
            return const HomeWidget();
          } else if (state is LoadingMusicEventState) {
            return const RefreshProgressIndicator();
          } else {
            context.read<MusicEventsCubit>().fetchGetMusicEvents();
            return const SizedBox();
          }
        },
      ),
    );
  }
}
