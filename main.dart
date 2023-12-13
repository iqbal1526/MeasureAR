import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MeasureARChatScreen(),
    );
  }
}

class MeasureARChatScreen extends StatefulWidget {
  @override
  _MeasureARChatScreenState createState() => _MeasureARChatScreenState();
}

class _MeasureARChatScreenState extends State<MeasureARChatScreen> {
  TextEditingController userInputController = TextEditingController();
  List<ChatMessage> chatMessages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MeasureAR Support Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return chatMessages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: userInputController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    sendMessage();
                  },
                  child: Text('Send'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    goToForum(context);
                  },
                  child: Text('Go to Forum'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    String userMessage = userInputController.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      chatMessages.add(ChatMessage(sender: 'You', message: userMessage));
    });

    // Simulate a customer support response related to MeasureAR application.
    Future.delayed(Duration(milliseconds: 500), () {
      String supportResponse = '';

      if (userMessage.toLowerCase().contains('measurement tools')) {
        supportResponse +=
        'Measurement Tools allow you to measure dimensions and volume of objects. Follow these steps:\n';
        supportResponse +=
        '1. Open the MeasureAR app and go to the Measurement Tools section.\n';
        supportResponse += '2. Choose the desired measurement tool (e.g., length, area, volume).\n';
        supportResponse +=
        '3. Use your device\'s camera to capture the object you want to measure.\n';
        supportResponse +=
        '4. Follow on-screen instructions to complete the measurement.\n';
        supportResponse +=
        'If you have specific questions or need further assistance, feel free to ask!';
      } else if (userMessage.toLowerCase().contains('ar integration')) {
        supportResponse +=
        'AR Integration lets you overlay measurements data on real-world environments. Make sure your device supports AR. To use, navigate to AR Integration, point your camera, and interact with the AR overlay.';
      } else if (userMessage.toLowerCase().contains('space outline builder')) {
        supportResponse +=
        'Space Outline Builder enables you to create virtual outlines of objects and rooms for space optimization. To start, select Space Outline Builder and follow the on-screen instructions.';
      } else if (userMessage.toLowerCase().contains('measurement visualization')) {
        supportResponse +=
        'Measurement Visualization presents data in a user-friendly manner. To view visualizations, go to Measurement Visualization and explore the available options.';
      } else {
        supportResponse +=
        'I apologize, but I may need more details to provide specific assistance. Feel free to ask about any MeasureAR module, and I will do my best to help! Here are the main highlights of the application: 1. Measurement Tools \n 2. AR integration \n 3. Space Outline Builder \n 4. Measurement Visualization \n';
      }

      setState(() {
        chatMessages.add(ChatMessage(sender: 'Support', message: supportResponse));
      });
    });

    userInputController.clear();
  }

  void goToForum(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeasureARForumScreen()),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;

  ChatMessage({required this.sender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$sender: $message',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MeasureARForumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MeasureAR Community Forum'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          ForumSection(
            title: 'Measurement Tools',
            posts: [
              ForumPost(
                sender: 'User123',
                message: 'How do I measure the volume of an irregular object using Measurement Tools?',
              ),
              ForumPost(
                sender: 'SupportTeam',
                message:
                'To measure the volume of an irregular object, select the "Volume" tool, capture the object with your device\'s camera, and follow the on-screen instructions.',
              ),
            ],
          ),
          ForumSection(
            title: 'AR Integration',
            posts: [
              ForumPost(
                sender: 'User456',
                message: 'Is AR Integration available on all devices?',
              ),
              ForumPost(
                sender: 'SupportTeam',
                message: 'AR Integration is available on devices that support Augmented Reality (AR). Check your device specifications to ensure compatibility.',
              ),
            ],
          ),
          ForumSection(
            title: 'Space Outline Builder',
            posts: [
              ForumPost(
                sender: 'User789',
                message: 'Can I use Space Outline Builder to plan the layout of my living room furniture?',
              ),
              ForumPost(
                sender: 'SupportTeam',
                message:
                'Absolutely! Space Outline Builder is perfect for optimizing furniture layout. Simply select the tool, outline your furniture, and experiment with different arrangements.',
              ),
            ],
          ),
          ForumSection(
            title: 'Measurement Visualization',
            posts: [
              ForumPost(
                sender: 'User101',
                message: 'What types of visualizations are available in Measurement Visualization?',
              ),
              ForumPost(
                sender: 'SupportTeam',
                message: 'Measurement Visualization offers various visualizations like charts, graphs. Explore the options in the Visualization section for a detailed overview.',
              ),
            ],
          ),
          ForumSection(
            title: 'User Account Management',
            posts: [
              ForumPost(
                sender: 'User202',
                message: 'How can I update my profile information in User Account Management?',
              ),
              ForumPost(
                sender: 'SupportTeam',
                message: 'To update your profile, go to the User Account Management section, and look for the profile settings. You can modify your information there.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ForumSection extends StatelessWidget {
  final String title;
  final List<ForumPost> posts;

  ForumSection({required this.title, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Column(
            children: posts,
          ),
        ],
      ),
    );
  }
}

class ForumPost extends StatelessWidget {
  final String sender;
  final String message;

  ForumPost({required this.sender, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text('$sender: $message'),
    );
  }
}
