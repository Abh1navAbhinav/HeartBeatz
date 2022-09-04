import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:heart_beatz/objects.dart';
import 'package:heart_beatz/styles&colors/scroll_behaviour.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../background&miniplayer/miniplayer.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen(
      {Key? key, required this.songmodal, required this.audioPlayer})
      : super(key: key);
  final SongModel songmodal;
  final AudioPlayer audioPlayer;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool isplaying = false;
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void initState() {
    playsong();
    super.initState();
  }

  void playsong() {
    try {
      widget.audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(widget.songmodal.uri!),
        ),
      );
      widget.audioPlayer.play();

      isplaying = true;
    } on Exception {
      log('Cannot parse this song');
    }
    widget.audioPlayer.durationStream.listen(
      (d) {
        setState(() {
          duration = d!;
        });
      },
    );
    widget.audioPlayer.positionStream.listen(
      (p) {
        setState(() {
          position = p;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double value;
    return Container(
      decoration: BoxDecoration(
        gradient: coloursObj.cloudyWhite(),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Column(
                        children: const [
                          Text(
                            'Playing from',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'All songs',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (() {
                          bottomsheetObj.modalBottomSheet(
                            context,
                          );
                        }),
                        child: const Image(
                          image: AssetImage('assets/icons/moon (1).png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Material(
                    elevation: 20,
                    shadowColor: Colors.blue,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(100),

                        child: QueryArtworkWidget(
                          quality: 100,
                          artworkBorder: BorderRadius.circular(10),
                          artworkFit: BoxFit.cover,
                          id: widget.songmodal.id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: const Icon(Icons.music_note),
                        ),
                        
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                ListTile(
                  title: Text(
                    widget.songmodal.displayNameWOExt,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    widget.songmodal.artist.toString() == '<unknown>'
                        ? 'unknown Artist'
                        : widget.songmodal.artist.toString(),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                /*  const SizedBox(
                  height: 50,
                ), */
                SliderTheme(
                  data: const SliderThemeData(
                      thumbColor: Colors.black,
                      inactiveTrackColor: Color.fromARGB(255, 48, 199, 236),
                      activeTrackColor: Colors.black,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10)),
                  child: Slider(
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    min: const Duration(microseconds: 0).inSeconds.toDouble(),
                    onChanged: (val) {
                      setState(() {
                        changetoSeconds(val.toInt());
                        value = val;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(position.toString().split(".")[0]),
                      Text(duration.toString().split(".")[0]),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0263,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconImage(
                      function: () {},
                      image: 'assets/icons/back.png',
                      height: 50,
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: iconImage(
                        function: () {
                          setState(() {
                            if (isplaying) {
                              widget.audioPlayer.pause();
                            } else {
                              widget.audioPlayer.play();
                            }
                            isplaying = !isplaying;
                          });
                          // Get.back();
                        },
                        image: isplaying
                            ? 'assets/icons/pause (1).png'
                            : 'assets/icons/play-button (1).png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    /* Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: iconImage(
                          function: () {},
                          image: 'assets/icons/play-button (1).png',
                           height: 50,
                        width: 50,
                        ),
                    ), */
                    iconImage(
                      function: () {},
                      image: 'assets/icons/next.png',
                      height: 50,
                      width: 50,
                    ),
                    /* const SizedBox(
                      width: 40,
                    ), */
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changetoSeconds(int seconds) {
    Duration secondDuration = Duration(seconds: seconds);
    widget.audioPlayer.seek(secondDuration);
  }
}
