import 'package:flutter/material.dart';
import 'package:lancaai/pages/settings.dart';
import 'package:lancaai/pages/song_info/icons.dart';
import 'package:lancaai/pages/song_info/lyrics.dart';
import 'package:lancaai/pages/song_info/names.dart';
import 'package:lancaai/pages/song_info/song_data.dart';
import 'package:lancaai/pages/song_info/song_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<String> _tabNames = songNames;

  // Icons related to the songs
  final List<IconData> _tabIcons = songIcons;

  @override
  void initState() {
    _tabController = TabController(length: _tabNames.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.auto_awesome,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            const Text('LançaAI'),
          ],
        ),
        actions: [
          // Settings button
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const SettingsPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Material(
            elevation: 1.0, // Adjust this value as needed
            child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: _tabController,
              tabs: _tabNames
                  .map((String name) => Tab(
                      text: name,
                      icon: Icon(
                        _tabIcons[_tabNames.indexOf(name)],
                      )))
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              // Load SongPage for each song
              children: _tabNames
                  .map((String name) => SongPage(
                      name: name,
                      icon: _tabIcons[_tabNames.indexOf(name)],
                      lyrics: songLyrics[_tabNames.indexOf(name)],
                      songData: songData[_tabNames.indexOf(name)]))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
