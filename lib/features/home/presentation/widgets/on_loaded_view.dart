import 'package:custom_page_route/custom_page_route.dart';
import '../../../chat/presentation/pages/chat_page.dart';
import 'chat_griditem.dart';
import '../../../text_summarize/presentation/pages/summarize_text_page.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

import 'text_summarize_griditem.dart';

///TODO: add more app features using firebase extensions
class OnLoadedView extends StatelessWidget {
  const OnLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    late Offset tapPosition;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Listener(
                  onPointerDown: (event) {
                    tapPosition = event.position;
                    logger.i("onPointerDown: $event");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox.square(
                        dimension: width * 0.4,
                        child: ChatBotGridItem(
                          onTap: () {
                            final center = constraints
                                .copyWith(
                                  maxHeight: height + kToolbarHeight, //cheating 😅, while having the AppBar
                                )
                                .fractionalOffset(tapPosition);
                            final route = RippleRoute(
                              center: center,
                              page: const ChatPage(),
                              duration: const Duration(seconds: 1),
                              // popPosition: FractionalOffset.topLeft,
                            );
                            logger.i("center: $center");
                            Navigator.of(context).push(route);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox.square(
                        dimension: width * 0.4,
                        child: TextSummarizeGridItem(
                          onTap: () {
                            final center = constraints
                                .copyWith(
                                  maxHeight: height + kToolbarHeight, //cheating 😅, to have the AppBar
                                )
                                .fractionalOffset(tapPosition);
                            final route = RippleRoute(
                              center: center,
                              page: const SummarizeTextPage(),
                              duration: const Duration(seconds: 1),
                            );
                            logger.i("center: $center");
                            Navigator.of(context).push(route);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
