import 'package:flutter/material.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

class FailureWidget extends StatelessWidget {
  final Failure failure;
  final String? message;

  const FailureWidget({
    Key? key,
    required this.failure,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? failure.message ?? "Somenthig went wrong",
      ),
    );
  }
}
