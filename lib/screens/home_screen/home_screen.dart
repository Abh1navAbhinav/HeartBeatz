import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_beatz/controllers/home_controller.dart';
import 'package:heart_beatz/objects.dart';
import 'package:heart_beatz/screens/favourite_song/favourite_screens.dart';
import 'package:heart_beatz/screens/home_screen/song_tile.dart';

import 'package:heart_beatz/styles&colors/scroll_behaviour.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../background&miniplayer/miniplayer.dart';
import '../../styles&colors/icon_gradient.dart';
import '../player_screen/player_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  playSong(String? uri) {
    try {
      homeController.audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(uri!),
        ),
      );
      homeController.audioPlayer.play();
    } on Exception {
      log('error parsing song');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: coloursObj.cloudyWhite(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Material(
                elevation: 5,
                shadowColor: Colors.blue,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.headphones,
                              size: 40,
                            ),
                            Text(
                              'Heart Beatz',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 45,
                          decoration: BoxDecoration(
                            gradient: coloursObj.premiumBlue(),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const FavouriteScreen(),
                              transition: Transition.cupertino,
                              duration: const Duration(
                                milliseconds: 800,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Favourites',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  RadiantGradientMask(
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 25,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: ((context, index) {
                              return favGridHomeObj.favGrid();
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'All Songs',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            shuffleButtonObj.shuffleButton(),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder<List<SongModel>>(
                          future: homeController.audioQuery.querySongs(
                            sortType: null,
                            orderType: OrderType.ASC_OR_SMALLER,
                            uriType: UriType.EXTERNAL,
                            ignoreCase: true,
                          ),
                          builder: (context, items) {
                            if (items.data == null) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (items.data!.isEmpty) {
                              return const Center(
                                child: Text('No songs found'),
                              );
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: items.data!.length,
                              itemBuilder: ((context, index) {
                                return SongTile(
                                  liked: false,
                                  title: items.data![index].displayNameWOExt,
                                  subtitle: items.data![index].artist
                                              .toString() ==
                                          '<unknown>'
                                      ? 'unknown Artist'
                                      : items.data![index].artist.toString(),
                                  songImage: QueryArtworkWidget(
                                    quality: 100,
                                    artworkFit: BoxFit.cover,
                                    artworkQuality: FilterQuality.high,
                                    id: items.data![index].id,
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget:
                                        const Icon(Icons.music_note),
                                  ),
                                  function: () {
                                    Get.to(
                                      () => PlayerScreen(
                                        songmodal: items.data![index],
                                        audioPlayer: homeController.audioPlayer,
                                      ),
                                      transition: Transition.downToUp,
                                      duration: const Duration(
                                        milliseconds: 600,
                                      ),
                                    );
                                    playSong(items.data![index].uri);
                                  },
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 11,
                  left: 11,
                  right: 11,
                ),
                child: MiniPlayer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
