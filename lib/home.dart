import 'package:flutter/material.dart';

import 'message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = <Message>[
    Message(text: 'Hi!', isUser: true),
    Message(text: 'Hello!', isUser: false),
    Message(text: 'Hi!', isUser: true),
    Message(text: 'Hello!', isUser: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/gpt-robot.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Gemini Chatbot",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Image.asset(
                  'assets/volume-high.png',
                  color: Colors.blue,
                ),
              ],
            )),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = _messages[index];
                  return ListTile(
                      title: Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color:
                              message.isUser ? Colors.blue : Colors.grey[300],
                          borderRadius: message.isUser
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )
                              : const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                      child: Text(
                        message.text,
                      ),
                    ),
                  ));
                },
              ),
            ),

            // Add a text field and a button here
            Padding(
                padding: const EdgeInsets.only(
                    bottom: 32, left: 16, right: 16, top: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            blurRadius: 7,
                            spreadRadius: 5)
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                                hintText: 'Enter your message',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20))),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Image.asset('assets/send.png'),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
