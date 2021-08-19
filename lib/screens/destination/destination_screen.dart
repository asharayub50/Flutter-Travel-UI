import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/activity_model.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({key, this.destination}) : super(key: key);
  final Destination destination;
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Hero(
                  tag: "${widget.destination.imageUrl}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(FontAwesomeIcons.sort),
                          iconSize: 25.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                        fontSize: 35.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 140.0,
                                  child: Text(
                                    activity.name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "\$ ${activity.price}",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'per pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              activity.type,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _buildRatingStars(activity.rating),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(activity.startTimes[0]),
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(activity.startTimes[1]),
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage(activity.imageUrl),
                          width: 110.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
