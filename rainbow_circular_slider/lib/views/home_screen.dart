import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbow_circular_slider/card.dart';
import 'package:rainbow_circular_slider/constants.dart';
import 'package:rainbow_circular_slider/views/circular_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int volume = 0;
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [bgLight, bgDark],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'H o m e p o d'.toUpperCase(),
                ),
                const SizedBox(width: 10.0),
                Text(
                  'M i n i'.toUpperCase(),
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  liked = !liked;
                  setState(() {});
                },
                color: liked ? Colors.red : Colors.white,
                icon: Icon(
                  liked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 340.0,
                width: MediaQuery.of(context).size.width,
                child: CircularSlider(
                  onAngleChanged: (angle) {
                    volume = ((angle / (math.pi * 2)) * 100).toInt();
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              _VolumeRow(volume: volume),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 220.0,
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 20.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: cards.length,
                        itemBuilder: (BuildContext context, int index) {
                          CardModel card = cards[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: _Card(cardModel: card),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _VolumeRow extends StatelessWidget {
  final int volume;

  const _VolumeRow({Key? key, required this.volume}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(CupertinoIcons.speaker_2, size: 30.0),
          const Text(
            'V O L U M E',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '$volume',
            style: const TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '%',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final CardModel cardModel;

  const _Card({Key? key, required this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = cardModel.active ? Colors.white : Colors.white24;
    return Column(
      children: [
        Container(
          height: 200.0,
          width: 150.0,
          decoration: BoxDecoration(
            color: bgDark,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: cardModel.active
                ? [
                    const BoxShadow(
                      color: Color(0xff10017D),
                      offset: Offset(2.0, 2.0),
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cardModel.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
              const SizedBox(height: 10.0),
              Icon(
                cardModel.icon,
                size: 60.0,
                color: color,
              ),
              const SizedBox(height: 10.0),
              Text(
                cardModel.active ? 'A C T I V E' : 'I N A C T I V E',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
