import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_beatz/background&miniplayer/miniplayer.dart';
import 'package:heart_beatz/objects.dart';
import 'package:heart_beatz/screens/home_screen/song_tile.dart';
import 'package:heart_beatz/styles&colors/scroll_behaviour.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              shadowColor: Colors.blue,
              elevation: 10,
              expandedHeight: 215,
              floating: true,
              // pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: const Image(
                  image: AssetImage('assets/images/weeknd.webp'),
                ),
                title: Text(
                  'Favourite Songs',
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                  ),
                ),
                centerTitle: true,
              ),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 5,
                  ),
                  child: Text(
                    '20 Songs',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            buildSongTile(),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(left: 11, right: 11, bottom: 11),
        child: MiniPlayer(),
      ),
    );
  }

  buildSongTile() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SongTile(
              liked: true,
              songImage: const Image(image: AssetImage('assets/images/weeknd.webp')),
              subtitle: 'The Weeknd',
              title: 'Blinding Lights',
            );
          },
          primary: false,
          shrinkWrap: true,
          itemCount: 20,
        ),
      ),
    );
  }

  shufflePlayButtonsliver() {
    return SliverToBoxAdapter(
      child: shuffleButtonObj.shuffleButton(),
    );
  }
}
