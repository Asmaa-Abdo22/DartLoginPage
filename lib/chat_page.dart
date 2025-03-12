import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<dynamic> chatData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchChatData();
  }

  Future<void> fetchChatData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');
      setState(() {
        chatData = response.data['products'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.edit, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                      itemCount: chatData.length >= 6 ? 6 : chatData.length,
                      itemBuilder: (context, index) {
                        var user = chatData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(user['thumbnail']),
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
                              Text(user['title'].split(" ")[0], style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: chatData.length,
                    itemBuilder: (context, index) {
                      var item = chatData[index];
                      return _buildChatItem(item['title'], item['description'], item['thumbnail']);
                    },
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildChatItem(String name, String message, String imageUrl) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
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
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 5, backgroundColor: Colors.blue),
          SizedBox(width: 5),
          Text("Just now", style: TextStyle(color: Colors.blue, fontSize: 12)),
        ],
      ),
    );
  }
}
