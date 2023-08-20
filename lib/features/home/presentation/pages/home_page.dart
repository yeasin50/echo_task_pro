import '../../../../locator.dart';
import 'package:flutter/material.dart';

import '../widgets/on_loaded_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PaLM AI example"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: setup(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const OnLoadedView();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
