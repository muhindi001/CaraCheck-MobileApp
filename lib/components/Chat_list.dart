// import 'package:flutter/material.dart';

// class ChatList extends StatelessWidget {
//   final Map<String, dynamic> chat;
//   final VoidCallback ontap;
//   const ChatList({
//     super.key,
//     required this.chat,
//     required this.ontap,
//     });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//       child: InkWell(
//         onTap: ontap,
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 10,
//                 offset: Offset(0, 5),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

    
//   }
// }