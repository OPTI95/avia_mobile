import 'package:effective_mobile/core/styles/colors.dart';
import 'package:effective_mobile/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../search/presentation/cubit/texts_cubit.dart';
import '../../../search/presentation/widgets/input_form_widget.dart';

class ViewInformationFromToWidget extends StatelessWidget {
  const ViewInformationFromToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("d MMMM", "ru");
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 34),
      child: ColoredBox(
        color: StaticColors.grey_2,
        child: SizedBox(
            height: 56,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child:
                        const ReturnIconWidget(staticColor: StaticColors.blue)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${(context.read<TextsCubit>().state as TextsLoaded).textFrom} - ${(context.read<TextsCubit>().state as TextsLoaded).textTo}",
                      style: StaticTextStyles.title3
                          .copyWith(color: StaticColors.white),
                    ),
                    Text(
                      "${dateFormat.format(context.read<SearchCubit>().toDate!)}, 1 пассажир",
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
