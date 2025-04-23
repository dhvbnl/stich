import 'package:dart_openai/dart_openai.dart';
import 'package:stich/helpers/constants.dart';

class Generator {
  String model;
  String? _clothes;
  OpenAIChatCompletionChoiceMessageModel? _systemMessage;

  Generator({this.model = "gpt-4.1-nano"});

  set clothes(String clothes) {
    _clothes = clothes;
    _systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          '$kSystemPrompt\n$_clothes',
        ),
      ],
      role: OpenAIChatMessageRole.system,
    );
  }
Future<OpenAIChatCompletionModel> generateOutfit({required String prompt}) async {
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          prompt,
        ),
      ],
      role: OpenAIChatMessageRole.user,
    );
    final requestMessages = [
      _systemMessage!,
      userMessage,
    ];
    Future<OpenAIChatCompletionModel> chatCompletion = OpenAI.instance.chat.create(
      model: model,
      responseFormat: {"type": "json_object"},
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 1500,
    );
    return chatCompletion;
  }
}
