import 'package:flutter/material.dart';
import 'package:lancaai/components/chat.dart';

import '../full_screen_chat.dart';

class SongPage extends StatelessWidget {
  final String name;
  final IconData icon;
  final String lyrics;
  final Map<String, String> songData;

  const SongPage({
    super.key,
    required this.name,
    required this.icon,
    required this.lyrics,
    required this.songData,
  });

  @override
  Widget build(BuildContext context) {
    final List<IconData> songDataIcons = [
      Icons.music_note,
      Icons.album,
      Icons.person,
      Icons.calendar_today,
      Icons.category,
    ];

    return ListView(
      children: [
        // Song name large as title centered
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // Song data
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return Center(
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Icon(Icons.library_music),
                            title: const Text('Letra'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: lyrics
                                  .split('\n')
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int lineNumber = entry.key + 1;
                                String line = entry.value;
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      child: Text(
                                        '$lineNumber',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.2)),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: SelectableText(line),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                            titleAlignment: ListTileTitleAlignment.titleHeight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: songData.entries
                              .map((MapEntry<String, String> entry) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: Icon(songDataIcons[songData.keys
                                          .toList()
                                          .indexOf(entry.key)]),
                                      title: Text(entry.key),
                                      subtitle: Text(entry.value),
                                      tileColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      textColor: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      iconColor: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(Icons.library_music),
                      title: const Text('Letra'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: lyrics.split('\n').asMap().entries.map(
                          (entry) {
                            int lineNumber = entry.key + 1;
                            String line = entry.value;
                            return Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  child: Text(
                                    '$lineNumber',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: SelectableText(line),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      ),
                      titleAlignment: ListTileTitleAlignment.titleHeight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  ...songData.entries.map(
                    (MapEntry<String, String> entry) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: ListTile(
                        leading: Icon(
                          songDataIcons[
                              songData.keys.toList().indexOf(entry.key)],
                        ),
                        title: Text(entry.key),
                        subtitle: Text(entry.value),
                        tileColor: Theme.of(context).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.onSecondary,
                        iconColor: Theme.of(context).colorScheme.onSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 16),
        // Title
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Converse com LançaAI',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Desenvolvido com',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/gemini.png',
                      height: 24,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        // flutter_chat_ui to chat with gemini
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width > 600 ? 200 : 16),
          child: ClipPath(
            clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: SizedBox(
              height: 500,
              width: 300,
              child: ChatScreen(
                // Based on current tab
                songLyrics: lyrics,
                name: name,
                songData: songData,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Open in full screen button
        Center(
          child: TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FullScreenChat(
                      name: name, lyrics: lyrics, songData: songData),
                ),
              );
            },
            icon: const Icon(Icons.open_in_full),
            label: const Text('Abrir em tela cheia'),
          ),
        ),
        const SizedBox(height: 16),
        // Disclaimer of lyrics source and rights
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Letras fornecidas por Genius.com. Todos os direitos reservados.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
