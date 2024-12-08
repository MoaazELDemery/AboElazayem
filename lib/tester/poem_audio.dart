import 'package:com.app.aboelazayem/constants.dart';
import 'package:com.app.aboelazayem/model/poem_model.dart';
import 'package:com.app.aboelazayem/model/quran_voice_model.dart';
import 'package:com.app.aboelazayem/model/tafser_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class PoemAudio extends StatefulWidget {
  final List listenPoem;

  PoemAudio(this.listenPoem);

  @override
  _PoemAudioState createState() => _PoemAudioState();
}

class _PoemAudioState extends State<PoemAudio> {
  List<AudioPlayer>? audioPlayer;
  List<Duration>? duration;
  List<Duration>? position;
  List<bool>? playing;
  List<IconData>? playBtn;
  List<AudioCache>? cache;

  @override
  void initState() {
    super.initState();
    audioPlayer =
        List.generate(widget.listenPoem.length, (index) => AudioPlayer());
    duration = List.generate(widget.listenPoem.length, (index) => Duration());
    position = List.generate(widget.listenPoem.length, (index) => Duration());
    playing = List.generate(widget.listenPoem.length, (index) => false);
    playBtn =
        List.generate(widget.listenPoem.length, (index) => Icons.play_arrow);

    cache = List.generate(widget.listenPoem.length,
        (index) => AudioCache(fixedPlayer: audioPlayer![index]));
    //now let's handle the audioplayer time
  }

  @override
  void dispose() {
    audioPlayer!.forEach((element) {
      element.stop();
    });
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        trailing: Image.asset(
          'assets/icons/07.png',
          color: Colors.white,
        ),
        backgroundColor: Colors.yellow[700],
        title: Text(
          translator.currentLanguage == 'ar'
              ? " الاستماع الى القصيدة   "
              : " listen to Poem",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        children: List.generate(
            widget.listenPoem.length,
            (index) => Column(
                  children: [
                    Slider.adaptive(
                        min: 0.0,
                        value: position![index].inSeconds.toDouble(),
                        max: duration![index].inSeconds.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            audioPlayer![index]
                                .seek(Duration(seconds: value.toInt()));
                          });
                        }),
                    InkWell(
                      onTap: () {
                        var url = "${widget.listenPoem[index].audio_path}";

                        if (!playing![index]) {
                          audioPlayer![index].play(url);

                          setState(() {
                            playBtn![index] = Icons.pause;
                            playing![index] = true;
                          });
                        } else {
                          audioPlayer![index].pause();
                          setState(() {
                            playBtn![index] = Icons.play_arrow;
                            playing![index] = false;
                          });
                        }
                        audioPlayer![index]
                            .onDurationChanged
                            .listen((Duration dd) {
                          setState(() {
                            duration![index] = dd;
                          });
                        });
                        audioPlayer![index]
                            .onAudioPositionChanged
                            .listen((Duration dd) {
                          setState(() {
                            position![index] = dd;
                          });
                        });
                      },
                      child: Icon(
                        playBtn![index],
                        color: kSecondryColor,
                        size: 35,
                      ),
                    ),
                  ],
                )));
    ;
  }
}
