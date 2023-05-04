import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  late MediaStream _localStream;
  final _localRenderer = RTCVideoRenderer();
  bool _isTurnOn = false;

  @override
  void initState() {
    super.initState();
    _initRenderers();
  }

  _initRenderers() async {
    await _localRenderer.initialize();
  }

  _turnOn() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {"width": 1280, "height": 720}
    };

    try {
      mediaDevices.getUserMedia(mediaConstraints).then((stream) {
        _localStream = stream;
        _localRenderer.srcObject = _localStream;
      });
    } catch (e) {
      print(e.toString());
    }

    if (!mounted) return;

    setState(() {
      _isTurnOn = true;
    });
  }

  _turnOff() async {
    // try {
    //   await _localStream.dispose();
    //   _localRenderer.srcObject = null;
    // } catch (e) {
    //   print(e.toString());
    // }

    setState(() {
      _isTurnOn = false;
    });
  }

  @override
  void dispose() {
    try {
      _localStream.dispose();
      _localRenderer.srcObject = null;
    } catch (e) {
      print(e.toString());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Media Page'),
        ),
        body: Column(
          children: [
            const Text("來不及搞懂我弄了什麼，總之要按兩次 FAB 會有神秘東西出現"),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: RTCVideoView(_localRenderer),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _isTurnOn ? _turnOff : _turnOn,
          child: Icon(_isTurnOn ? Icons.videocam : Icons.videocam_off),
        ));
  }
}
