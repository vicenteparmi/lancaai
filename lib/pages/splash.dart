import 'package:flutter/material.dart';
import 'package:lancaai/components/material_you_shape.dart';
import 'package:lancaai/pages/home.dart';
import 'package:lancaai/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final TextEditingController _apiKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Center(
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MaterialYouShape(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome,
                      color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  Text('LançaAI',
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              const SizedBox(height: 12),
              Text('Um projeto em memória de Rita Lee com o Google Gemini',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: 32),
              const Text(
                'Criado por Vicente Parmigiani para a Imersão AI Alura + Google',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: () {
                    // Ask user for the API key if it's not set
                    SharedPreferences.getInstance().then((prefs) {
                      if (prefs.getString('api_key') == null) {
                        askAPIKey(context)
                            .then((value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                ));
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      }
                    });
                  },
                  child: const Text('Iniciar')),
            ],
          ),
        )));
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
