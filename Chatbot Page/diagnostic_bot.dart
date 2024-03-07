import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:zebracakes/constants.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class MealBotPage extends StatefulWidget {
   MealBotPage({super.key});

  @override
  State<MealBotPage> createState() => _MealBotPageState();
}

class _MealBotPageState extends State<MealBotPage> {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 15,
      ),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'John', lastName: 'Smith');
  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: 'GPT', lastName: '');

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  bool _isFirstMessageSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        toolbarHeight: 50,
        title: const Text(
          'Health AI (Beta)',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          if (!_isFirstMessageSent) ...[
            SizedBox(height: 38),
            Center(child: Image.asset('assets/LuthiLogo.png', width: 100, height: 100)),
            SizedBox(height: 20), 
            Text('Diagnostic AI', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Tell me about your symptoms?', style: TextStyle(fontSize: 18)),
          ],
          Expanded(
            child: DashChat(
              currentUser: _currentUser,
              typingUsers: _typingUsers,
              messageOptions: const MessageOptions(
                currentUserContainerColor: Color.fromARGB(255, 15, 152, 250),
                containerColor: Color.fromRGBO(0, 166, 125, 1),
                textColor: Colors.white,
                showCurrentUserAvatar: true,
                showOtherUsersName: false,
              ),
              onSend: (ChatMessage m) {
                getChatResponse(m);
              },
              messages: _messages,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _isFirstMessageSent = true;
      _messages.insert(0, m);
    _typingUsers.add(_gptChatUser);
  });

    final Messages latestMessage = Messages(role: Role.user, content: m.text);

    final request = ChatCompleteText(
      model: Gpt4ChatModel(),
      messages: [latestMessage],
      maxToken: 300,
    );
      final response = await _openAI.onChatCompletion(request: request);
      for (var element in response!.choices) {
        if (element.message != null) {
          setState(() {
            _messages.insert(0,
              ChatMessage(
                user: _gptChatUser,
                createdAt: DateTime.now(),
                text: element.message!.content,
              ),
            );
          });
        }
      }
      setState(() {
        _typingUsers.remove(_gptChatUser);
      });
  }
}
      
      
