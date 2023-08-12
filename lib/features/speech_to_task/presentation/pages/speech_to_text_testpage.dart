import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

class SpeechToTextTestPage extends StatefulWidget {
  const SpeechToTextTestPage({super.key});

  @override
  State<SpeechToTextTestPage> createState() => _SpeechToTextTestPageState();
}

class _SpeechToTextTestPageState extends State<SpeechToTextTestPage> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: VoiceListeningButton(
        onResult: (text) {
          logger.d(text);
        },
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

/// [_OnResult] is a callback function that will be called when the voice listening is done
typedef _OnResult = void Function(String text);

class VoiceListeningButton extends StatefulWidget {
  const VoiceListeningButton({super.key, this.onResult});

  final _OnResult? onResult;

  @override
  State<VoiceListeningButton> createState() => _VoiceListeningButtonState();
}

class _VoiceListeningButtonState extends State<VoiceListeningButton> {
  bool isListening = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isListening = !isListening;
        });
      },
      child: Icon(isListening ? Icons.mic : Icons.mic_off),
    );
  }
}
