import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import '../chatbots/treatment_bot.dart';
import 'package:zebracakes/constants.dart';

import '../chatbots/diagnose_bot.dart';
import '../chatbots/fitness_bot.dart';
import '../chatbots/mealplan_bot.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 15,
      ),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'John', lastName: 'Smith');
  final ChatUser _gptChatUser =
      ChatUser(id: '2', firstName: 'GPT', lastName: '');

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  bool _isFirstMessageSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        toolbarHeight: 50,
        title: const Text(
          'Health AI (Beta)',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          if (!_isFirstMessageSent) ...[
            SizedBox(height: 80), 
            Center(
                child: Image.asset('assets/LuthiLogo.png',
                    width: 100, height: 100)),
            SizedBox(height: 20), 
            Text('Health AI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('How can I help you today?',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            SizedBox(height: 210), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black, side: BorderSide(color: Colors.black),
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                     Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DiagnosisBot()),
                     );
                    },
                    child: Text(
                      'GPT Function 1',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black, side: BorderSide(color: Colors.black),
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MealBotPage()),
                      );
                    },
                    child: Text(
                      'GPT Function 2',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            




            SizedBox(height: 4), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black, side: BorderSide(color: Colors.black),
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TreatmentBot()),
                      );
                                          
                    },
                    child: Text(
                      'GPT Function 3',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black, side: BorderSide(color: Colors.black),
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FitnessBot()),
                      );
                     },
                    child: Text(
                      'GPT Function 4',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
      // Update the flag when the first message is sent
      _isFirstMessageSent = true;
      _messages.insert(
          0, m); // Insert the user's message at the beginning of the list
      _typingUsers.add(_gptChatUser);
    });

    // Only prepare the latest message for the API request to avoid repeating context
    final Messages latestMessage = Messages(role: Role.user, content: m.text);

    // Make the API request
    final request = ChatCompleteText(
      model: Gpt4ChatModel(),
      messages: [latestMessage], // Only send the latest message for context
      maxToken: 300,
    );
    // Get the response and update the chat
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
            0, // Insert the bot's response at the beginning of the list
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
