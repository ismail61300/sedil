import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sedil/screens/dialogs/first_dialog.dart';
import 'package:sedil/screens/dialogs/second_dialog.dart';
import 'package:sedil/utilities/changing_listen_time.dart';
import 'package:sedil/widgets/lortappbar.dart';
import 'package:sedil/screens/listening_screen.dart';

class ThirdDialog extends StatefulWidget {
  @override
  _ThirdDialogState createState() => _ThirdDialogState();
}

class _ThirdDialogState extends State<ThirdDialog> {
  String music = "eylesa.mp3";
  String formatTime(Duration duraiton) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duraiton.inHours);
    final minutes = twoDigits(duraiton.inMinutes.remainder(60));
    final seconds = twoDigits(duraiton.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(".");
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    audioPlayer.onPlayerCompletion.listen((event) {
      ChangeLTime();
      setState(() {
        position = duration;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    final player = AudioCache(prefix: "contents/");
    final url = await player.load(music);
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Listening()));
              },
              icon: Icon(Icons.arrow_back)),
          title: Text("300 Kere Dinleme"),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            LORTAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage("images/300_kere_dinleme.png"),
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        "3. Diyalog",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Slider(
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatTime(position)),
                            Text(formatTime(duration)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios_rounded),
                              iconSize: 35,
                              onPressed: () async {
                                if (isPlaying) {
                                  await audioPlayer.pause();
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SecondDialog()));
                              },
                            ),
                          ),
                          Text("         "),
                          CircleAvatar(
                            radius: 35,
                            child: IconButton(
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                              ),
                              iconSize: 50,
                              onPressed: () async {
                                if (isPlaying) {
                                  await audioPlayer.pause();
                                } else {
                                  await audioPlayer.resume();
                                }
                              },
                            ),
                          ),
                          Text("         "),
                          CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              iconSize: 35,
                              onPressed: () async {
                                if (isPlaying) {
                                  await audioPlayer.pause();
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FirstDialog()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
