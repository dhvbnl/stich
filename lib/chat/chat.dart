import 'package:openai_dart/openai_dart.dart';
import 'package:stich/env/env.dart';
import 'package:stich/helpers/bottom_type.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/shoes_type.dart';
import 'package:stich/helpers/top_type.dart';

/// A service for interacting with the OpenAI API to generate outfit
/// suggestions and classify clothing items from an image.
class Chat {
  final OpenAIClient _openAIClient;
  final ChatCompletionModel _chatModel;
  List<ChatCompletionMessage> _baseClothes = [];

  Chat({
    String apiKey = Env.apiKey,
    String modelId = 'gpt-4.1-nano',
  })  : _openAIClient = OpenAIClient(apiKey: apiKey),
        _chatModel = ChatCompletionModel.modelId(modelId);

  /// Updates the system prompt with the current wardrobe description.
  set wardrobeDescription(String description) {
    _baseClothes = [
      ChatCompletionMessage.system(
        content: '$kSystemPrompt\n$description',
      ),
    ];
  }

  Future<CreateChatCompletionResponse> getOutfitSuggestions({
    required String userPrompt,
    int maxTokens = 1500,
    double temperature = 0.2,
    int seed = 6,
  }) {
    final messages = <ChatCompletionMessage>[..._baseClothes];
    messages.add(
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string(userPrompt),
      ),
    );

    return _openAIClient.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: _chatModel,
        messages: messages,
        responseFormat: const ResponseFormat.jsonObject(),
        seed: seed,
        temperature: temperature,
        maxTokens: maxTokens,
      ),
    );
  }

  Future<CreateChatCompletionResponse> classifyClothingImage({
    required String imageUrl,
    int maxTokens = 1500,
    double temperature = 0.4,
    int seed = 6,
  }) {
    final messages = <ChatCompletionMessage>[
      // Original classification system prompt
      const ChatCompletionMessage.system(
        content: kSystemPromptClassify,
      ),
      // Hint with valid enumeration values
      ChatCompletionMessage.system(
        content: _validValuesHint(),
      ),
      // User instruction
      const ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.string(
          'Please classify the following image.',
        ),
      ),
      // Image content
      ChatCompletionMessage.user(
        content: ChatCompletionUserMessageContent.parts([
          ChatCompletionMessageContentPart.image(
            imageUrl: ChatCompletionMessageImageUrl(
              url: imageUrl,
            ),
          ),
        ]),
      ),
    ];

    return _openAIClient.createChatCompletion(
      request: CreateChatCompletionRequest(
        model: _chatModel,
        messages: messages,
        responseFormat: const ResponseFormat.jsonObject(),
        seed: seed,
        temperature: temperature,
        maxTokens: maxTokens,
      ),
    );
  }

  /// Constructs a hint string listing all valid clothing enumeration values.
  String _validValuesHint() {
    final colors = ClothingColor.values.map((e) => e.name).join(', ');
    final materials = ClothingMaterial.values.map((e) => e.name).join(', ');
    final topTypes = TopType.values.map((e) => e.name).join(', ');
    final bottomTypes = BottomType.values.map((e) => e.name).join(', ');
    final shoeTypes = ShoesType.values.map((e) => e.name).join(', ');
    return [
      'Valid colors: $colors.',
      'Valid materials: $materials.',
      'Valid top types: $topTypes.',
      'Valid bottom types: $bottomTypes.',
      'Valid shoe types: $shoeTypes.',
    ].join(' ');
  }
}
