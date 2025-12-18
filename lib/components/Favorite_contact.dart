import 'package:carecheck/models/message_models.dart';
import 'package:flutter/material.dart';

class FavoriteContact extends StatelessWidget {
  const FavoriteContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Favorite Contact",
                style: TextStyle(
                  color: Colors.blueGrey, 
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  letterSpacing: 1.0
                  ),
                  ),
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.more_horiz,
                  size: 30,
                  color: Colors.blueGrey,)
                  ),
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorite.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(favorite[index].imageUrl),
                      ),
                      SizedBox(height: 6.0,),
                      Text(favorite[index].name,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),),
                    ],
                  ),
                );
              },)
          )
        ],
      ),
    );
  }
}
