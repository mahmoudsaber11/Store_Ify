import 'package:flutter/material.dart';
import 'package:store_ify/features/home/presentation/widgets/section_upper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 13),
        child: Column(
          children: [SectionUpper()],
        ),
      ),
    );
  }
}
