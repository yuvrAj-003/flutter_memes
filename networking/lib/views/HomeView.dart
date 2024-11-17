import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:networking/services/apis.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  return GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        const QuiltedGridTile(2, 2),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 2),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: snapshot.data!.data!.memes!.length,
                      (context, index) {
                        final meme = snapshot.data!.data!.memes![index];
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () => launchUrl(Uri.parse(meme.url!)),
                              child: GridTile(
                                  header: CachedNetworkImage(
                                    imageUrl: meme.url!,
                                    placeholder: (context, url) {
                                      return const CircularProgressIndicator
                                          .adaptive();
                                    },
                                  ),
                                  child: Text(meme.url!)
                                  // subtitle: Text(meme.url!),
                                  ),
                            ),
                            Positioned(
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.white.withOpacity(0.5),
                                  child: Text(meme.name!),
                                ))
                          ],
                        );
                      },
                    ),
                    // itemCount: snapshot.data!.data!.memes!.length,
                    // itemBuilder: (context, iteration) {
                  );
                } else {
                  return const CircularProgressIndicator.adaptive();
                }
              }),
        ));
  }
}
