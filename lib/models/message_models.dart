import 'package:carecheck/models/user_models.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  static var length;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread
  });
}

// YOU- current user
final User greg = User(
  id: 0,
  name: "Greg",
  imageUrl: "lib/assets/image01.png"
);
final User muhindi = User(
  id: 1,
  name: "Muhindi",
  imageUrl: "lib/assets/image01.png"
);
final User john = User(
  id: 2,
  name: "John",
  imageUrl: "lib/assets/image01.png"
);
final User asha = User(
  id: 3,
  name: "Asha",
  imageUrl: "lib/assets/image01.png"
);
final User amina = User(
  id: 4,
  name: "Amina",
  imageUrl: "lib/assets/image01.png"
);
final User juma = User(
  id: 5,
  name: "Juma",
  imageUrl: "lib/assets/image01.png"
);
final User joseph = User(
  id: 6,
  name: "Joseph",
  imageUrl: "lib/assets/image01.png"
);
final User athur = User(
  id: 7,
  name: "Athur",
  imageUrl: "lib/assets/image01.png"
);

// FAVORITE CONTACT
List<User> favorite = [muhindi, john, joseph, amina, greg,asha,athur];

// EXAMPLES CHATS ON HOME SCREEN
List<Message> Chats = [
  Message(
    sender: john,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? what is did you do today?',
    isLiked: false,
    unread: true
  ),
  Message(
    sender: joseph,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? what is did you do today?',
    isLiked: false,
    unread: true
  ),
  Message(
    sender: amina,
    time: '5:00 PM',
    text: 'Hey, how\'s it going? what is did you do today?',
    isLiked: false,
    unread: true
  ),
  Message(
    sender: greg,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? what is did you do today?',
    isLiked: false,
    unread: true
  ),
   Message(
    sender: asha,
    time: '5:00 PM',
    text: 'Hey, how\'s it going? what is did you do today?',
    isLiked: false,
    unread: true
  ),
  Message(
    sender: juma,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? what is did you do today?',
    isLiked: false,
    unread: true
  )
];