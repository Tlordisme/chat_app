import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 3.0,
            ),
            child: Text('Recent', style: Theme.of(context).textTheme.bodySmall),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(4),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact("Thanh dep trai", context),
                _buildRecentContact("Long", context),
                _buildRecentContact("Dao", context),
                _buildRecentContact("Thai", context),
                _buildRecentContact("Thanh dep trai", context),
                _buildRecentContact("Meo", context),
                _buildRecentContact("Thanh dep trai", context),
                _buildRecentContact("Thanh dep trai", context),
                _buildRecentContact("Thanh dep trai", context),
                _buildRecentContact("Thanh dep trai", context),
                _buildRecentContact("Thanh dep trai", context),
                _buildRecentContact("Thanh dep trai", context),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ListView(
                children: [
                  _buildMessageTile(
                    'Thanh dep trai',
                    "thanh@gmail.com",
                    "08:41",
                  ),
                  _buildMessageTile(
                    'Thanh dep trai',
                    "thanh@gmail.com",
                    "08:41",
                  ),
                  _buildMessageTile(
                    'Thanh dep trai',
                    "thanh@gmail.com",
                    "08:41",
                  ),
                  _buildMessageTile(
                    'Thanh dep trai',
                    "thanh@gmail.com",
                    "08:41",
                  ),
                  _buildMessageTile(
                    'Thanh dep trai',
                    "thanh@gmail.com",
                    "08:41",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          'https://wallpapercave.com/wp/wp3262663.jpg',
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(time, style: TextStyle(color: Colors.grey)),
    );
  }

  Widget _buildRecentContact(String name, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://wallpapercave.com/wp/wp3262663.jpg',
            ),
          ),
          SizedBox(height: 5),
          Text(name, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
