import 'package:com.app.aboelazayem/constants.dart';
import 'package:com.app.aboelazayem/model/quran_voice_model.dart';
import 'package:com.app.aboelazayem/model/tafser_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SingleAudioPlayerTester extends StatefulWidget {
  final ShikhNames shikhNames;
  final String value;
  SingleAudioPlayerTester(this.shikhNames, this.value);

  @override
  _SingleAudioPlayerTesterState createState() =>
      _SingleAudioPlayerTesterState();
}

class _SingleAudioPlayerTesterState extends State<SingleAudioPlayerTester> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
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
    return ExpansionTile(
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kSecondryColor,
          ),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
        title: Text(
          "${widget.shikhNames.name} رواية عن :${widget.shikhNames.rewaya} ",
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          Slider.adaptive(
              min: 0.0,
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  audioPlayer.seek(Duration(seconds: value.toInt()));
                });
              }),
          InkWell(
            onTap: () {
              var url = "${widget.shikhNames.server}/${widget.value}.mp3";

              if (!playing) {
                audioPlayer.play(url);

                setState(() {
                  playBtn = Icons.pause;
                  playing = true;
                });
              } else {
                audioPlayer.pause();
                setState(() {
                  playBtn = Icons.play_arrow;
                  playing = false;
                });
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
            },
            child: Icon(
              playBtn,
              color: kSecondryColor,
              size: 35,
            ),
          )
        ]);
    ;
  }
}
