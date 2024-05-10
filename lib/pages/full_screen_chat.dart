import 'package:flutter/material.dart';
import 'package:lancaai/components/chat.dart';

class FullScreenChat extends StatelessWidget {
  const FullScreenChat({
    super.key,
    required this.name,
    required this.lyrics,
    required this.songData,
  });

  final String name;
  final String lyrics;
  final Map<String, String> songData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  )),
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: ChatScreen(
        songLyrics: lyrics,
        name: name,
        songData: songData,
      ),
    );
  }
}
