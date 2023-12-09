import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/action_appbar.dart';

class StoresDetailsView extends StatelessWidget {
  const StoresDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: const [
          ActionAppBar(),
        ],
      ),
    );
  }
}
