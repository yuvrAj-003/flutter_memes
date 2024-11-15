import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:networking/services/apis.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Memes"),
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: API.getMemes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: snapshot.data!.data!.memes!.length,
                      itemBuilder: (context, iteration) {
                        final meme = snapshot.data!.data!.memes![iteration];
                        return GridTile(
                            header: CachedNetworkImage(
                              imageUrl: meme.url!,
                              placeholder: (context, url) {
                                return const CircularProgressIndicator
                                    .adaptive();
                              },
                            ),
                            footer: Text(meme.name!,
                                style: Theme.of(context).textTheme.bodyLarge),
                            child: Text(meme.url!)
                            // subtitle: Text(meme.url!),
                            );
                      });
                } else {
                  return const CircularProgressIndicator.adaptive();
                }
              }),
        ));
  }
}
