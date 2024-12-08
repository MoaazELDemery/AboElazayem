import 'package:com.app.aboelazayem/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SingleAyaAudio extends StatefulWidget {
  final String url;

  const SingleAyaAudio({required this.url});
  @override
  _SingleAyaAudioState createState() => _SingleAyaAudioState();
}

class _SingleAyaAudioState extends State<SingleAyaAudio> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  bool playing = false;
  AudioCache? cache;

  @override
  void initState() {
    super.initState();
    cache = AudioCache(fixedPlayer: audioPlayer);
    //now let's handle the audioplayer time
  }

  @override
  void dispose() {
    audioPlayer.stop();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height / 7,
        child: Column(
          children: [
            slider(),
            InkWell(
              onTap: () {
                getAudio();
                print("uuuuurrrrrlllll ${widget.url}");
              },
              child: Icon(
                playing == false ? Icons.play_arrow : Icons.pause,
                size: 30,
                color: kSecondryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(new Duration(seconds: value.toInt()));
        });
      },
    );
  }

  void getAudio() async {
    String url = widget.url;
    if (playing) {
      var res = await audioPlayer.pause();
      print('res $res');
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url);
      print('res $res');
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
