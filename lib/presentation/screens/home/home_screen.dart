import 'package:flutter/material.dart';

import '../../../data/repositories/blog_post_implementation.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo project'),
        ),
        body: FutureBuilder(
            future: BlogPostImplementation().fetchThumbnails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].title),
                      subtitle: Text(snapshot.data![index].body),
                    );
                  },
                );
              }
              if (snapshot.hasError) {
                return const Center(
                    child: Text(
                  'Something went wrong!',
                  style: TextStyle(color: Colors.red),
                ));
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
