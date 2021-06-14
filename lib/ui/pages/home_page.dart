import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:track_player_dota_2/constants/base_url.dart';
import 'package:track_player_dota_2/ui/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _playerIdController = TextEditingController();
  final Connectivity _connectivity = Connectivity();

  bool showLoading = false;
  bool _isPlayerIdValid = false;
  String _playerValidateMessage = '';
  bool _isFirstTime = true;

  Map? playerData;

  @override
  void initState() {
    super.initState();
    initConnectivity().then((status) => {checkingConnection(status)});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            height: 80.0,
            child: Center(
              child: Text('Advertisment'),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text('Track Player', style: TextStyle(fontSize: 25.0)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _playerIdController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Theme.of(context).disabledColor),
                          hintText: 'Player ID...',
                          errorText: !_isFirstTime && !_isPlayerIdValid
                              ? _playerValidateMessage
                              : null,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    IconButton(
                        onPressed: () {
                          _isFirstTime = false;

                          setState(() {
                            var playerId = _playerIdController.text;
                            if (playerId.isEmpty || playerId.length < 9) {
                              _isPlayerIdValid = false;
                              _playerValidateMessage =
                                  'Player ID can\'t be null or less than 9';
                            } else {
                              _isPlayerIdValid = true;
                            }
                          });

                          if (_isPlayerIdValid) {
                            setState(() {
                              showLoading = true;
                            });
                            getPlayerDetail(_playerIdController.text);
                          }
                        },
                        icon: Icon(Icons.send))
                  ],
                ),
                showLoading
                    ? Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CircularProgressIndicator(),
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<ConnectivityResult> initConnectivity() async {
    ConnectivityResult connectivityResult;

    try {
      connectivityResult = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      connectivityResult = ConnectivityResult.none;
    }

    return connectivityResult;
  }

  Future<bool> isHasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('You are connected');
        return true;
      }
      return false;
    } on SocketException catch (e) {
      print('SocketException : ' + e.message);
      return false;
    }
  }

  Future tryReconnect() async {
    _connectivity
        .checkConnectivity()
        .then((status) => {checkingConnection(status)});
  }

  Future getPlayerDetail(String playerId) async {
    // @note: get player profile
    var playerJson =
        await http.get(Uri.parse(BaseURL.PLAYER_BASE_URL + playerId));
    var player = json.decode(playerJson.body);

    if (!player.containsKey('profile')) {
      setState(() {
        showLoading = false;
        _isPlayerIdValid = false;
        _playerValidateMessage = 'Player ID not found';
      });
    } else {
      // @note: get player win-lose
      setState(() {
        showLoading = false;
      });
      var playerWLJson =
          await http.get(Uri.parse(BaseURL.PLAYER_BASE_URL + playerId + '/wl'));
      var playerWL = json.decode(playerWLJson.body);

      // @note: get player recentMatches
      var playerRecentMatchesJson = await http.get(
          Uri.parse(BaseURL.PLAYER_BASE_URL + playerId + '/recentMatches'));
      var playerRecentMatches = json.decode(playerRecentMatchesJson.body);

      player["win_lose"] = playerWL;
      player["recent_matches"] = playerRecentMatches;
      // @note: navigate to detail page
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(playerData: player)));
    }
  }

  checkingConnection(status) {
    switch (status) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        isHasConnection()
            .then((value) => {
                  if (!value)
                    {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return ShowConnectivityDialog(
                            message: 'You are not connected',
                            reconnect: () => tryReconnect(),
                          );
                        },
                      )
                    }
                })
            .catchError((e) {
          print('error : ' + e);
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return ShowConnectivityDialog(
                message: 'Something when wrong',
                reconnect: () => tryReconnect(),
              );
            },
          );
        });
        break;
      case ConnectivityResult.none:
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return ShowConnectivityDialog(
              message: 'Currently you are not connected to internet.',
              reconnect: () => tryReconnect(),
            );
          },
        );
        break;
    }
  }
}

class ShowConnectivityDialog extends StatelessWidget {
  final String message;
  final Function reconnect;

  const ShowConnectivityDialog(
      {required this.message, required this.reconnect, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Connection Status',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w900),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }
}
