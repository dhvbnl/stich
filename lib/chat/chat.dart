import 'package:dart_openai/dart_openai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stich/helpers/bottom_type.dart';
import 'package:stich/helpers/clothing_color.dart';
import 'package:stich/helpers/clothing_material.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/shoes_type.dart';
import 'package:stich/helpers/top_type.dart';

class Chat {
  String model;
  String? _clothes;
  OpenAIChatCompletionChoiceMessageModel? _systemMessage;

  Chat({this.model = "gpt-4.1-nano"});

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

  Future<OpenAIChatCompletionModel> generateOutfit(
      {required String prompt}) async {
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
    Future<OpenAIChatCompletionModel> chatCompletion =
        OpenAI.instance.chat.create(
      model: model,
      responseFormat: {"type": "json_object"},
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 1500,
    );
    return chatCompletion;
  }

  Future<OpenAIChatCompletionModel> classifyArticle(
      {required XFile image}) async {
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          kSystemPromptClassify,
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "The valid colors are ${ClothingColor.values.map((e) => e.name).join(", ")}."
          "The valid materials are ${ClothingMaterial.values.map((e) => e.name).join(", ")}."
          "The valid topTypes are ${TopType.values.map((e) => e.name).join(", ")}."
          "The valid bottomTypes are ${BottomType.values.map((e) => e.name).join(", ")}."
          "The valid shoeTypes are ${ShoesType.values.map((e) => e.name).join(", ")}.",
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "Please classify the following image.",
        ),
        OpenAIChatCompletionChoiceMessageContentItemModel.imageUrl(
          "https://i5.walmartimages.com/asr/bbf97f22-1e0c-4611-bdd2-097aae371842_1.ec4fff667532fe9458cb1a350ee5aed5.jpeg",
        ),
      ],
      role: OpenAIChatMessageRole.user,
    );
    final requestMessages = [
      userMessage,
    ];
    Future<OpenAIChatCompletionModel> chatCompletion =
        OpenAI.instance.chat.create(
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
