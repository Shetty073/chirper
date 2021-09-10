import 'package:chirper/data/models/chirp.dart';
import 'package:flutter/material.dart';

class ChirpCard extends StatefulWidget {
  final Chirp chirp;

  const ChirpCard({Key? key, required this.chirp}) : super(key: key);

  @override
  _ChirpCardState createState() => _ChirpCardState();
}

class _ChirpCardState extends State<ChirpCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.grey,
          ),
        ),
      ),
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          widget.chirp.profilePhoto
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 0, left: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.chirp.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '@${widget.chirp.username}',
                          style: TextStyle(
                            color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                            fontSize: 14,
                          ),
                        ),
                        // TODO: Text('datetime'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.0, top: 6.0),
                    child: Text(
                        widget.chirp.text
                    ),
                  ),
                  widget.chirp.photos == null ? Container() :
                  Container(
                    child: Image.network(
                      widget.chirp.photos![0],
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                  Container(
                    width: 0.8 * MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.reply_outlined,
                                  color: Colors.grey,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  widget.chirp.noOfReplies.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            padding: EdgeInsets.only(left: 5.0, top: 8.0, bottom: 5.0),
                          ),
                          onTap: () {
                            // TODO: type and send reply to this chirp
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.sync_alt_outlined,
                                  color: Colors.grey,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  widget.chirp.noOfReChirps.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            padding: EdgeInsets.only(left: 5.0, top: 8.0, bottom: 5.0),
                          ),
                          onTap: () {
                            // TODO: type and send reply to this chirp
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.grey,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  widget.chirp.noOfLikes.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            padding: EdgeInsets.only(left: 5.0, top: 8.0, bottom: 5.0),
                          ),
                          onTap: () {
                            // TODO: type and send reply to this chirp
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}