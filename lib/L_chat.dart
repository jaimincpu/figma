import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffa692e),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'image/profile_icon.jpg',
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chat",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Boston Bear",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  "200k members ",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Action if required
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                _buildChatBubble(
                  'Here is a simple message, it contains several lines of text',
                  '12:00 PM',
                  true,
                ),
                _buildChatBubble(
                  'It could be continued as a group of messages, so every new message will affect rounding of the previous message corners.',
                  '12:01 PM',
                  false,
                ),
                _buildChatBubble(
                  'This is the message of the user',
                  '12:02 PM',
                  true,
                ),
                _buildChatBubble(
                  'Another message from the other user, continuing the conversation.',
                  '12:03 PM',
                  false,
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String message, String time, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe)
            ClipOval(
              child: Image.asset(
                'image/user2.jpg',
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
            ),
          SizedBox(width: 8),
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[200] : Colors.grey[200],
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                        color: isMe ? Colors.black : Colors.black,
                        fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    time,
                    style: TextStyle(
                        color: isMe ? Colors.black : Colors.black54,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'image/user.jpg',
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.emoji_emotions),
            onPressed: () {
              // Action
            },
          ),
        ],
      ),
    );
  }
}
