import 'package:domino/utils/constants/texts/chat_text.dart';

class SupportFaq {
  SupportFaq._();

  // Placeholder answers. Replace them with your real policies.
  static const Map<String, String> _answers = {
    TChatText.faqOrderQuestion: TChatText.faqOrderAnswer,
    TChatText.faqMissingItemQuestion: TChatText.faqMissingItemAnswer,
    TChatText.faqRefundQuestion: TChatText.faqRefundAnswer,
    TChatText.faqTrackOrderQuestion: TChatText.faqTrackOrderAnswer,
    TChatText.faqProductQuestion: TChatText.faqProductAnswer,
  };

  // Returns a list of all the questions in the FAQ.
  static List<String> get questions => _answers.keys.toList();

  // Returns the answer for a given question
  static String? answerFor(String question) => _answers[question];
}
