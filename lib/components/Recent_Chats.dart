import 'package:carecheck/Pages/Chat_Screen.dart';
import 'package:carecheck/models/message_models.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({super.key});

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: ListView.separated(
        itemCount: Chats.length,
        separatorBuilder:
            (_, __) => Divider(height: 1, color: Colors.grey.withOpacity(0.15)),
        itemBuilder: (BuildContext context, int index) {
          final Message chat = Chats[index];
          return GestureDetector(
            onTap: () {
              // mark as read when tapping the item
              if (chat.unread) {
                setState(() {
                  Chats[index] = Message(
                    sender: chat.sender,
                    time: chat.time,
                    text: chat.text,
                    isLiked: chat.isLiked,
                    unread: false,
                  );
                });
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(user: chat.sender),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                color: chat.unread ? Colors.greenAccent[100] : Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                leading: CircleAvatar(
                  radius: 26.0,
                  backgroundImage: AssetImage(chat.sender.imageUrl),
                ),
                title: Text(
                  chat.sender.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  chat.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      chat.time,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    if (chat.unread)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                // onTap handled by outer GestureDetector
              ),
            ),
          );
        },
      ),
    );
  }
}
