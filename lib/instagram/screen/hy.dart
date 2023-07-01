import 'package:flutter/material.dart';

class InstagramStoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
      ),
      body: ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemCount: 10, // Replace with the actual number of stories
        itemBuilder: (context, index) {
          return ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  // backgroundImage: AssetImage('path_to_image'), // Replace with the actual image path
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: Text('Username'),
          );
        },
      ),
    );
  }
}

class InstagramPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of posts
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('path_to_image'), // Replace with the actual image path
                ),
                title: Text('DI'),
              ),
              Image.asset(
                'path_to_post_image', // Replace with the actual post image path
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Caption'),
              ),
            ],
          );
        },
      ),
    );
  }
}
