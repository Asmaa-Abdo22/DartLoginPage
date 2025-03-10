import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 68, 199),
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: const Color.fromARGB(255, 253, 253, 253)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit, color: const Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[400],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey[300],
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('Asmaa', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildChatItem('Mahmoud', 'My name is Mahmoud', '03:00 AM'),
                _buildChatItem('Yassin', 'My name is Yassin', '02:00 AM'),
                _buildChatItem('Nour', 'My name is Nour', '01:00 AM'),
                _buildChatItem('Omar', 'My name is Omar', '12:00 AM'),
                _buildChatItem('Fatima', 'My name is Fatima', '11:00 AM'),
                _buildChatItem('Nour', 'My name is Nour', '01:00 AM'),
                _buildChatItem('Omar', 'My name is Omar', '12:00 AM'),
                _buildChatItem('Fatima', 'My name is Fatima', '11:00 AM'),
                _buildChatItem('Nour', 'My name is Nour', '01:00 AM'),
                _buildChatItem('Omar', 'My name is Omar', '12:00 AM'),
                _buildChatItem('Fatima', 'My name is Fatima', '11:00 AM'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(String name, String message, String time) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.white),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(message),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.blue,
          ),
           SizedBox(width: 5),
          Text(
            time,
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ],
      ),
    );
  }
}