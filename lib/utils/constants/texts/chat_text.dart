class TChatText {
  TChatText._();

  // Chat title and participant names.
  static const String customerSupport = 'Customer Support';
  static const String staffAssistance = 'Staff Assistance';
  static const String supportName = 'Support';
  static const String customerName = 'You';

  // Welcome view and message composer.
  static const String welcomeSubtitle =
      'Write your request and our support team will help you with your order.';
  static const String welcomeTitlePrefix = 'How can we ';
  static const String welcomeTitleEmphasis = 'help';
  static const String welcomeTitleSuffix = ' you?';
  static const String composerHint = 'Ask your question...';

  // Ending a conversation and collecting a rating.
  static const String endConversation = 'End conversation';
  static const String endChatTitle = 'End this chat?';
  static const String endChatMessage =
      'Please take a moment to rate our support. You can always start a new chat.';
  static const String endChatConfirm = 'End chat';
  static const String helpTopics = 'Help Topics';
  static const String dialogConfirm = 'Confirm';
  static const String dialogCancel = 'Cancel';
  static const String ratingQuestion = 'How would you rate our support?';
  static const String feedbackHint = 'Tell us more...';
  static const String submitRating = 'Submit';
  static const helpTopicsTitle = 'How can we help?';
  static const conversationEnded = 'Conversation ended';

  static const String ratingPoor = 'Poor';
  static const String ratingFair = 'Fair';
  static const String ratingOkay = 'Okay';
  static const String ratingGood = 'Good';
  static const String ratingGreat = 'Great';

  static const Map<int, String> ratingLabels = {
    1: ratingPoor,
    2: ratingFair,
    3: ratingOkay,
    4: ratingGood,
    5: ratingGreat,
  };

  // Feedback confirmation and automatic staff reply.
  static const String thankYou = 'Thank you!';
  static const String feedbackThanksMessage =
      'Your feedback helps us improve our service.';
  static const String autoReply =
      'Thanks for reaching out. A staff member will be with you shortly.';

  // FAQ suggestion questions.
  static const String faqProductQuestion = 'Product inquiry';
  static const String faqTrackOrderQuestion = 'Track my order';
  static const String faqRefundQuestion = 'Request a refund';
  static const String faqMissingItemQuestion = 'Missing or wrong item';
  static const String faqOrderQuestion = "Where's my order?";

  // FAQ answers for the questions above.
  static const String faqOrderAnswer =
      'Check the Orders tab for updates. If it is delayed, send us your order number and we will look into it.';
  static const String faqMissingItemAnswer =
      'Sorry about that. Send your order number and tell us what was missing or wrong, plus a photo if you have one.';
  static const String faqRefundAnswer =
      'Send your order number and the reason for the refund, and we will review it for you.';
  static const String faqTrackOrderAnswer =
      'Open the Orders tab and tap your active order to see its status and delivery time.';
  static const String faqProductAnswer =
      'Happy to help. Tell us which item you want to know about and we will help you out.';

  // Handoff messages for when the user is connected to a staff member.
  static const handoffDirect =
      'Thanks for reaching out. A staff member will be with you shortly.';
  static const handoffAfterDetails =
      'Hold on a second, our staff will be with you in a minute.';

  // Options Menu
  static const String endChatOption = 'End conversation';
  static const String helpTopicsOption = 'Help topics';
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';
}
