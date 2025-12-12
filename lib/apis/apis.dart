import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class APIs
{
  // API Key for OpenRouter
  static String apiKey='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';

  //free models that we try in this project
  static final List<String> _freeModels=[
    'mistralai/mistral-7b-instruct:free',
    'google/gemini-pro-1.5-flash-free',
    'nousresearch/nous-hermes-2-mixtral-8x7b-dpo',
  ];

  // Get answer from OpenRouter with a model fallback system
  static Future<String> getAnswer(String question) async
  {
    log('--- Sending New Request ---');

    // Loop through the models until one succeeds
    for (final model in _freeModels)
    {
      log('Attempting model: $model');
      try
      {
        final res=await http.post(
          Uri.parse('https://openrouter.ai/api/v1/chat/completions'),
          headers:
          {
            HttpHeaders.authorizationHeader: 'Bearer $apiKey',
            'HTTP-Referer': 'https://mad-ai.dev', // Required
            'X-Title': 'MAD AI', // Optional
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body:jsonEncode({
            "model": model,
            "messages": [
              {"role": "user", "content": question},
            ]
          }),
        ).timeout(const Duration(seconds: 40));

        final data = jsonDecode(res.body);
        log('Model: $model -- Status Code: ${res.statusCode}');

        if (res.statusCode == 200)
        {
          if (data['choices'] != null && data['choices'].isNotEmpty) {
            final String content = data['choices'][0]['message']?['content'] ?? '';
            if (content.trim().isNotEmpty) {
              log('Success with model: $model');
              return content.trim(); // SUCCESS!
            }
          }
          log('API Warning: Received blank response from $model. Trying next model.');
        }
        else
        {
          final errorMsg = data['error']?['message'] ?? 'An unknown API error occurred.';
          log('API Error with $model: $errorMsg. Trying next model.');
        }

      } on TimeoutException
      {
        log('API Error: Request to $model timed out. Trying next model.');
      } catch (e, s) {
        log('--- FATAL EXCEPTION with $model ---\nException: $e\n$s');
      }
    }

    // This is only returned if all models in the list fail.
    return 'All AI models are currently busy or unavailable. Please try again in a moment.';
  }

  // ... (rest of the file is unchanged)
}
