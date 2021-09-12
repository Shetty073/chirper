import 'package:chirper/data/models/chirp.dart';
import 'package:chirper/helpers/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 6.0, bottom: 6.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(widget.chirp.profilePhoto ??
                          'https://ui-avatars.com/api/?name=N+A&background=0D8ABC&color=fff'),
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
                    width: 0.8 * MediaQuery.of(context).size.width,
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
                          width: 2.0,
                        ),
                        Text(
                          '@${widget.chirp.username}',
                          style: TextStyle(
                            color: Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Text(
                            '${DateTimeHelper.getFormattedDate(widget.chirp.dateTime)}',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor,
                              fontSize: 14,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 0.8 * MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 5.0, top: 6.0),
                    child: Text(
                      widget.chirp.text,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),
                  widget.chirp.photos == null
                      ? Container()
                      : Container(
                          child: Image.network(
                            widget.chirp.photos![0],
                            width: 0.78 * MediaQuery.of(context).size.width,
                          ),
                        ),
                  Container(
                    width: 0.8 * MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 6.0, left: 2.0, right: 2.0),
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
                            padding: EdgeInsets.only(
                                left: 5.0, top: 8.0, bottom: 5.0),
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
                            padding: EdgeInsets.only(
                                left: 5.0, top: 8.0, bottom: 5.0),
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
                            padding: EdgeInsets.only(
                                left: 5.0, top: 8.0, bottom: 5.0),
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
