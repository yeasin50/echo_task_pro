import '../../../../locator.dart';
import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/on_loaded_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFF1abc9c);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
        title: const Text("PaLM AI example"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: setup(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Stack(
              children: [
                HomePageBackground(),
                OnLoadedView(),
              ],
            );
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
