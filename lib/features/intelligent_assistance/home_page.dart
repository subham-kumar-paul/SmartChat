import 'package:whatsapp_ui/features/intelligent_assistance/feature_box.dart';
import 'package:whatsapp_ui/features/intelligent_assistance/openai_service.dart';
import 'package:whatsapp_ui/features/intelligent_assistance/pallete.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/intelligent-assistance';

  @override
  State<HomePage> createState() => _HomePageState();
}

// class _HomePageState extends State<HomePage> {
//   final speechToText = SpeechToText();
//   final flutterTts = FlutterTts();
//   String lastWords = '';
//   final OpenAIService openAIService = OpenAIService();
//   String? generatedContent;
//   String? generatedImageUrl;
//   int start = 200;
//   int delay = 200;

//   @override
//   void initState() {
//     super.initState();
//     initSpeechToText();
//     initTextToSpeech();
//   }

//   Future<void> initTextToSpeech() async {
//     await flutterTts.setSharedInstance(true);
//     setState(() {});
//   }

//   Future<void> initSpeechToText() async {
//     await speechToText.initialize();
//     setState(() {});
//   }

//   Future<void> startListening() async {
//     await speechToText.listen(onResult: onSpeechResult);
//     setState(() {});
//   }

//   Future<void> stopListening() async {
//     await speechToText.stop();
//     setState(() {});
//   }

//   void onSpeechResult(SpeechRecognitionResult result) {
//     setState(() {
//       lastWords = result.recognizedWords;
//     });
//   }

//   Future<void> systemSpeak(String content) async {
//     await flutterTts.speak(content);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     speechToText.stop();
//     flutterTts.stop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: BounceInDown(
//           child: const Text('Allen'),
//         ),
//         leading: const Icon(Icons.menu),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // virtual assistant picture
//             ZoomIn(
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Container(
//                       height: 120,
//                       width: 120,
//                       margin: const EdgeInsets.only(top: 4),
//                       decoration: const BoxDecoration(
//                         color: Pallete.assistantCircleColor,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 123,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage(
//                           'assets/images/virtualAssistant.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // chat bubble
//             FadeInRight(
//               child: Visibility(
//                 visible: generatedImageUrl == null,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 10,
//                   ),
//                   margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
//                     top: 30,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Pallete.borderColor,
//                     ),
//                     borderRadius: BorderRadius.circular(20).copyWith(
//                       topLeft: Radius.zero,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Text(
//                       generatedContent == null
//                           ? 'Good Morning, what task can I do for you?'
//                           : generatedContent!,
//                       style: TextStyle(
//                         fontFamily: 'Cera Pro',
//                         color: Pallete.mainFontColor,
//                         fontSize: generatedContent == null ? 25 : 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (generatedImageUrl != null)
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.network(generatedImageUrl!),
//                 ),
//               ),
//             SlideInLeft(
//               child: Visibility(
//                 visible: generatedContent == null && generatedImageUrl == null,
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   alignment: Alignment.centerLeft,
//                   margin: const EdgeInsets.only(top: 10, left: 22),
//                   child: const Text(
//                     'Here are a few features',
//                     style: TextStyle(
//                       fontFamily: 'Cera Pro',
//                       color: Pallete.mainFontColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // features list
//             Visibility(
//               visible: generatedContent == null && generatedImageUrl == null,
//               child: Column(
//                 children: [
//                   SlideInLeft(
//                     delay: Duration(milliseconds: start),
//                     child: const FeatureBox(
//                       color: Pallete.firstSuggestionBoxColor,
//                       headerText: 'ChatGPT',
//                       descriptionText:
//                           'A smarter way to stay organized and informed with ChatGPT',
//                     ),
//                   ),
//                   SlideInLeft(
//                     delay: Duration(milliseconds: start + delay),
//                     child: const FeatureBox(
//                       color: Pallete.secondSuggestionBoxColor,
//                       headerText: 'Dall-E',
//                       descriptionText:
//                           'Get inspired and stay creative with your personal assistant powered by Dall-E',
//                     ),
//                   ),
//                   SlideInLeft(
//                     delay: Duration(milliseconds: start + 2 * delay),
//                     child: const FeatureBox(
//                       color: Pallete.thirdSuggestionBoxColor,
//                       headerText: 'Smart Voice Assistant',
//                       descriptionText:
//                           'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: ZoomIn(
//         delay: Duration(milliseconds: start + 3 * delay),
//         child: FloatingActionButton(
//           backgroundColor: Pallete.firstSuggestionBoxColor,
//           onPressed: () async {
//             if (await speechToText.hasPermission &&
//                 speechToText.isNotListening) {
//               await startListening();
//             } else if (speechToText.isListening) {
//               final speech = await openAIService.isArtPromptAPI(lastWords);
//               if (speech.contains('https')) {
//                 generatedImageUrl = speech;
//                 generatedContent = null;
//                 setState(() {});
//               } else {
//                 generatedImageUrl = null;
//                 generatedContent = speech;
//                 setState(() {});
//                 await systemSpeak(speech);
//               }
//               await stopListening();
//             } else {
//               initSpeechToText();
//             }
//           },
//           child: Icon(
//             speechToText.isListening ? Icons.stop : Icons.mic,
//           ),
//         ),
//       ),
//     );
//   }
// }

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isSending = false;
  bool _isTextEmpty = true; // Track if the text field is empty

  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  Future<void> _sendTextMessage() async {
    final text = _textEditingController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _isSending = true;
      });

      final response = await openAIService.isArtPromptAPI(text);

      setState(() {
        if (response.contains('https')) {
          generatedImageUrl = response;
          generatedContent = null;
        } else {
          generatedImageUrl = null;
          generatedContent = response;
        }
        _isSending = false;
      });

      if (!response.contains('https')) {
        await systemSpeak(response); // Speak the response if it's not a URL
      }

      _textEditingController.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text('Allen'),
        ),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // virtual assistant picture
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 4),
                      decoration: const BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    height: 123,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/virtualAssistant.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // chat bubble
            FadeInRight(
              child: Visibility(
                visible: generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Pallete.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topLeft: Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      generatedContent == null
                          ? 'Good Morning, what task can I do for you?'
                          : generatedContent!,
                      style: TextStyle(
                        fontFamily: 'Cera Pro',
                        color: Pallete.mainFontColor,
                        fontSize: generatedContent == null ? 25 : 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (generatedImageUrl != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!),
                ),
              ),
            SlideInLeft(
              child: Visibility(
                visible: generatedContent == null && generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 22),
                  child: const Text(
                    'Here are a few features',
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      color: Pallete.mainFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // features list
            Visibility(
              visible: generatedContent == null && generatedImageUrl == null,
              child: Column(
                children: [
                  SlideInLeft(
                    delay: Duration(milliseconds: start),
                    child: const FeatureBox(
                      color: Pallete.firstSuggestionBoxColor,
                      headerText: 'ChatGPT',
                      descriptionText:
                          'A smarter way to stay organized and informed with ChatGPT',
                    ),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + delay),
                    child: const FeatureBox(
                      color: Pallete.secondSuggestionBoxColor,
                      headerText: 'Dall-E',
                      descriptionText:
                          'Get inspired and stay creative with your personal assistant powered by Dall-E',
                    ),
                  ),
                  SlideInLeft(
                    delay: Duration(milliseconds: start + 2 * delay),
                    child: const FeatureBox(
                      color: Pallete.thirdSuggestionBoxColor,
                      headerText: 'Smart Voice Assistant',
                      descriptionText:
                          'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Pallete.borderColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextFormField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Type your message...',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _isTextEmpty = value
                                  .isEmpty; // Update the text field empty status
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  ZoomIn(
                    delay: Duration(milliseconds: start + 3 * delay),
                    child: FloatingActionButton(
                      backgroundColor:
                          _isTextEmpty // Use the empty status to determine the button color
                              ? Pallete.firstSuggestionBoxColor
                              : Pallete.sendButtonColor,
                      onPressed:
                          _isTextEmpty // Use the empty status to determine the button action
                              ? () async {
                                  if (await speechToText.hasPermission &&
                                      speechToText.isNotListening) {
                                    await startListening();
                                  } else if (speechToText.isListening) {
                                    final speech = await openAIService
                                        .isArtPromptAPI(lastWords);
                                    if (speech.contains('https')) {
                                      generatedImageUrl = speech;
                                      generatedContent = null;
                                      setState(() {});
                                    } else {
                                      generatedImageUrl = null;
                                      generatedContent = speech;
                                      setState(() {});
                                      await systemSpeak(speech);
                                    }
                                    await stopListening();
                                  } else {
                                    initSpeechToText();
                                  }
                                }
                              : _isSending
                                  ? null
                                  : _sendTextMessage,
                      child:
                          _isTextEmpty // Use the empty status to determine the button icon
                              ? Icon(speechToText.isListening
                                  ? Icons.stop
                                  : Icons.mic)
                              : _isSending
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Pallete.sendButtonIconColor),
                                    )
                                  : Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
