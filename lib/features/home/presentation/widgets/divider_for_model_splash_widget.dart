import 'package:flutter/material.dart';

class DividerForModelSplashWidget extends StatelessWidget {
  const DividerForModelSplashWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: SizedBox(
          width: 40,
          height: 5,
          child: Divider(
            thickness: 3,
          )),
    );
  }
}