import 'package:chirper/components/chirp_card/chirp_card.dart';
import 'package:chirper/data/models/chirp.dart';
import 'package:chirper/helpers/chirp_helper.dart';
import 'package:chirper/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ChirpHelper _chirpHelper;

  // FPull fresh data
  Future<void> _getNewData() async {
    await _chirpHelper.homeFeed();
  }

  @override
  void initState() {
    _chirpHelper = ChirpHelper();
    _getNewData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder<LazyBox<Chirp>>(
        valueListenable: Boxes.getChirps().listenable(),
        builder: (context, box, widget) {
          return Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: box.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: box.getAt(index),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done) {
                      if(!snapshot.hasError) {
                        final Chirp _chirp = snapshot.data as Chirp;
                        return ChirpCard(
                          chirp: _chirp,
                        );
                      }
                      return Container(
                        child: Center(
                          child: Text(snapshot.error.toString()),
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: SpinKitCircle(
                            size: 10.0,
                            color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

