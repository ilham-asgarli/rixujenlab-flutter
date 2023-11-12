import 'package:flutter/material.dart';

import '../view-models/test_results_view_model.dart';

class TestResults extends StatelessWidget {
  final TestResultsViewModel testResultsViewModel;

  const TestResults({
    super.key,
    required this.testResultsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
