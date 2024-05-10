import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final String songLyrics;
  final String name;
  final Map<String, dynamic> songData;

  const ChatScreen(
      {super.key,
      required this.songLyrics,
      required this.name,
      required this.songData});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  // Messages
  List<types.Message> chatMessages = [
    // Initial system message
    types.TextMessage(
        author: const types.User(id: '0', firstName: 'LançaAI'),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '0',
        type: types.MessageType.text,
        text:
            'Bem-vindo ao LançaAI! Aqui você pode entender melhor as letras de RitaLee e conhecer mais sobre sua carreira.'),
  ];

  // Add message to list
  void addMessage(String message) {
    chatMessages.insert(
        0,
        types.TextMessage(
          author: const types.User(id: '1', firstName: 'Você'),
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: randomString(),
          text: message,
          type: types.MessageType.text,
        ));
    setState(() {});

    // Talk to Gemini
    talkToGemini();
  }

  // Talk to gemini
  void talkToGemini() {
    // Send query to Gemini if apiKey is set
    SharedPreferences.getInstance().then((SharedPreferences prefs) async {
      final String apiKey = prefs.getString('apiKey') ?? '';
      if (apiKey.isEmpty) {
        chatMessages.insert(
            0,
            types.TextMessage(
              author: const types.User(id: '0', firstName: 'LançaAI'),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: randomString(),
              text:
                  'Você precisa configurar sua chave de API para usar o LançaAI. Vá até as configurações para defini-la.',
              type: types.MessageType.text,
            ));
      } else {
        String messageID = randomString();

        // Insert loading message
        chatMessages.insert(
            0,
            types.TextMessage(
              author: const types.User(id: '0', firstName: 'LançaAI'),
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: messageID,
              text: 'Digitando...',
              type: types.MessageType.text,
            ));
        setState(() {});

        // Content
        List<String> chatContent = [
          'Isso é um chat, o sistema responde por \'LançaAI\' e você por \'Você\'.\n'
        ];

        // Create content object with each message stored in chatMessages
        if (chatMessages.isNotEmpty && chatMessages[2] is types.TextMessage) {
          var firstElement = chatMessages[2];
          chatContent.add(
              '${firstElement.author.firstName}: ${(firstElement as types.TextMessage).text}');
        }

        if (chatMessages.isNotEmpty && chatMessages[1] is types.TextMessage) {
          var firstElement = chatMessages[1];
          chatContent.add(
              '${firstElement.author.firstName}: ${(firstElement as types.TextMessage).text}');
        }

        // Append custom instructions
        chatContent.add(
            'Utilize como referência a letra da música "${widget.name}". Dados da música: ${jsonEncode(widget.songData)}. Letra: ${widget.songLyrics}". Responda sem mencionar o restante da conversa ou os nomes dos envolvidos.');

        debugPrint('Chat content: ${chatContent.join('\n')}');

        // Send query to Gemini
        await SharedPreferences.getInstance().then((SharedPreferences prefs) {
          // Get api key
          final String apiKey = prefs.getString('apiKey') ?? '';

          // Initialize Gemini

          if (apiKey.isNotEmpty) {
            Gemini.init(apiKey: apiKey);
          } else {
            chatMessages.insert(
                0,
                types.SystemMessage(
                  id: messageID,
                  text:
                      'Você precisa configurar sua chave de API para usar o LançaAI. Vá até as configurações para defini-la.',
                ));
            setState(() {});
            return;
          }
        });
        Gemini.instance.text(
          chatContent.join('\n'),
          safetySettings: [
            SafetySetting(
                category: SafetyCategory.sexuallyExplicit,
                threshold: SafetyThreshold.blockNone),
          ],
        ).then((value) {
          // Remove loading message
          chatMessages.removeWhere((element) => element.id == messageID);

          // Insert Gemini response
          chatMessages.insert(
              0, // Insert at the beginning
              types.TextMessage(
                author: const types.User(id: '0', firstName: 'LançaAI'),
                createdAt: DateTime.now().millisecondsSinceEpoch,
                id: messageID,
                text: value?.output ?? 'Ops! Algo deu errado. Tente novamente.',
                type: types.MessageType.text,
              ));
          setState(() {});
        }).catchError((error) {
          // Remove loading message
          chatMessages.removeWhere((element) => element.id == messageID);

          // Insert error message
          chatMessages.insert(
              0, // Insert at the beginning
              types.SystemMessage(
                id: messageID,
                text: 'Ops! Algo deu errado. Tente novamente.\n$error',
              ));
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Suggestions
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: MediaQuery.of(context).size.width < 600
              ? Theme.of(context).colorScheme.surfaceVariant
              : Color.lerp(Theme.of(context).colorScheme.surfaceTint,
                  Theme.of(context).colorScheme.surfaceVariant, 0.75),
        ),
        child: Scrollbar(
          controller: _scrollController,
          interactive: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                // Suggestion 1
                GestureDetector(
                    onTap: () {
                      addMessage('Me explique a letra dessa música.');
                    },
                    child: const ChipSuggestion(
                        text: 'Me explique a letra dessa música.')),
                // Suggestion 2
                GestureDetector(
                    onTap: () {
                      addMessage('Qual o sentimento dessa música?');
                    },
                    child: const ChipSuggestion(
                        text: 'Qual o sentimento dessa música?')),
                // Suggestion 3
                GestureDetector(
                    onTap: () {
                      addMessage('Escreva uma paródia dessa música.');
                    },
                    child: const ChipSuggestion(
                        text: 'Escreva uma paródia dessa música.')),
                // Suggestion 4
                GestureDetector(
                    onTap: () {
                      addMessage('Qual o contexto histórico?');
                    },
                    child: const ChipSuggestion(
                        text: 'Qual o contexto histórico?')),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: 64.0, top: 16.0, left: 16.0, right: 16.0),
        child: Chat(
          showUserAvatars: false,
          showUserNames: false,
          messages: chatMessages,
          onSendPressed: (p0) async {
            chatMessages.insert(
                0,
                types.TextMessage(
                  author: const types.User(id: '1', firstName: 'Você'),
                  createdAt: DateTime.now().millisecondsSinceEpoch,
                  id: randomString(),
                  text: p0.text,
                  type: types.MessageType.text,
                ));
            setState(() {});

            // Talk to Gemini
            talkToGemini();
          },
          user: const types.User(id: '1', firstName: 'Você'),
          theme: DarkChatTheme(
            primaryColor: Theme.of(context).colorScheme.primary,
            secondaryColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            inputTextColor: Theme.of(context).colorScheme.onTertiaryContainer,
            inputBackgroundColor:
                Theme.of(context).colorScheme.tertiaryContainer,
            inputSurfaceTintColor: Theme.of(context).colorScheme.secondary,
            errorColor: Theme.of(context).colorScheme.error,
            inputTextCursorColor: Theme.of(context).colorScheme.primary,
            inputBorderRadius: BorderRadius.circular(24),
            sentMessageBodyTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            receivedMessageBodyTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          textMessageBuilder:
              (p0, {required messageWidth, required showName}) => TextMessage(
            message: p0,
            emojiEnlargementBehavior: EmojiEnlargementBehavior.never,
            hideBackgroundOnEmojiMessages: true,
            showName: false,
            usePreviewData: false,
          ),
        ),
      ),
    );
  }
}

class ChipSuggestion extends StatelessWidget {
  final String text;

  const ChipSuggestion({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        avatar: const Icon(Icons.auto_awesome_outlined),
        label: Text(text),
        backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        side: BorderSide.none,
      ),
    );
  }
}
