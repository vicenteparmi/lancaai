import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _apiKeyController = TextEditingController();

  Future<void> _loadApiKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String apiKey = prefs.getString('apiKey') ?? '';
    setState(() {
      _apiKeyController.text = apiKey;
    });
  }

  @override
  initState() {
    super.initState();
    _loadApiKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Chave de API'),
            subtitle: const Text('Insira sua chave de API do Google AI Studio'),
            leading: const Icon(Icons.vpn_key),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Modal bottom sheet to input the API key
              askAPIKey(context);
            },
          ),
          // Credits
          ListTile(
            title: const Text('Créditos'),
            subtitle: const Text('Desenvolvido por Vicente K. Parmigiani'),
            leading: const Icon(Icons.code),
            onTap: () {
              // Show credits dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Créditos'),
                    // List with social media links
                    content: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                              'Desenvolvido por Vicente K. Parmigiani para a competição Alura e Google sobre Inteligência Artificial. O código fonte está disponível no GitHub.'),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.email),
                                onPressed: () {
                                  // Launch email
                                  launchUrl(Uri.parse(
                                      'mailto:vicenteparmigiani@gmail.com'));
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.link),
                                onPressed: () {
                                  // Launch website
                                  launchUrl(Uri.parse(
                                      'https://linktr.ee/vicenteparmi'));
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.code),
                                onPressed: () {
                                  // Launch GitHub
                                  launchUrl(Uri.parse(
                                      'https://github.com/vicenteparmi'));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Fechar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          // Licenses list tile
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationName: 'LançaAI',
            applicationVersion: '1.0.0',
            applicationLegalese: '© 2024 Vicente K. Parmigiani',
            child: Text('Clique para ver as licenças'),
          )
        ],
      ),
    );
  }

  Future<dynamic> askAPIKey(BuildContext context) {
    return showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return ApiKeyRequest(apiKeyController: _apiKeyController);
      },
    );
  }
}

class ApiKeyRequest extends StatelessWidget {
  const ApiKeyRequest({
    super.key,
    required TextEditingController apiKeyController,
  }) : _apiKeyController = apiKeyController;

  final TextEditingController _apiKeyController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Insira sua chave de API'),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Chave de API',
            ),
            controller: _apiKeyController,
          ),
          const SizedBox(height: 16),
          ButtonBar(
            children: [
              TextButton.icon(
                icon: const Icon(Icons.help),
                onPressed: () {
                  // Show help dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Ajuda'),
                        content: const Text(
                            'Obtenha sua chave de API no Google AI Studio e insira-a aqui. Para acessar, clique no botão abaixo e siga as instruções.'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                // Launch url
                                launchUrl(Uri.parse(
                                    'https://aistudio.google.com/app/apikey'));
                                Navigator.pop(context);
                              },
                              child: const Text('Obter chave de API')),
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Fechar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                label: const Text('Ajuda'),
              ),
              FilledButton(
                onPressed: () {
                  final String apiKey = _apiKeyController.text;
                  SharedPreferences.getInstance()
                      .then((SharedPreferences prefs) {
                    prefs.setString('apiKey', apiKey);
                  });
                  // Restart app
                  Restart.restartApp();
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
              'A chave de API é necessária para acessar os recursos de inteligência artificial do Google. Para obter sua chave, acesse o Google AI Studio e siga as instruções. Você poderá alterar sua chave a qualquer momento nas configurações.',
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
