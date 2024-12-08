import 'package:com.app.aboelazayem/model/model%20_version_2/audios_model.dart';
import 'package:com.app.aboelazayem/model/model%20_version_2/imam_sons_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AudioTesterv2 extends StatefulWidget {
  final ImamAudioModel audios;
  AudioTesterv2(this.audios);

  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<AudioTesterv2> {
  bool? playing; // at the begining we are not playing any song
  IconData? playBtn; // the main state of the play button icon
  AudioPlayer? _playerList;
  AudioCache? cache;
  Duration? position;
  Duration? musicLength;
  @override
  void dispose() {
    _playerList!.stop();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    playing = false;
    position = Duration();
    musicLength = Duration();
    playBtn = Icons.play_arrow;
    _playerList = AudioPlayer();
    cache = AudioCache(fixedPlayer: _playerList);
    super.initState();
    //now let's handle the audioplayer time
  }

  Widget slider(int audioIndex) {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.green[800],
          inactiveColor: Colors.grey[350],
          value: position!.inSeconds.toDouble(),
          max: musicLength!.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt(), audioIndex);
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec, int audioIndex) {
    Duration newPos = Duration(seconds: sec);
    _playerList!.seek(newPos);
  }

  customOnAudioChange(AudioPlayer item, int itemIndex) {
    item.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    item.onDurationChanged.listen((d) {
      setState(() {
        musicLength = d;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        customOnAudioChange(_playerList!, index);
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.grey[200]!.withOpacity(0.6),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 500.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${position!.inMinutes}:${position!.inSeconds.remainder(60)}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    slider(index),
                    Text(
                      "${musicLength!.inMinutes}:${musicLength!.inSeconds.remainder(60)}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: IconButton(
                  iconSize: 62.0,
                  color: Colors.green[800],
                  onPressed: () {
                    //here we will add the functionality of the play button
                    if (!playing!) {
                      //now let's play the song
                      _playerList!.play("${widget.audios.audio_path}");

                      setState(() {
                        playing = false;
                        playBtn = Icons.pause;
                        playing = true;
                      });
                    } else {
                      _playerList!.pause();
                      setState(() {
                        playBtn = Icons.play_arrow;
                        playing = false;
                      });
                    }
                  },
                  icon: Icon(
                    playBtn,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
