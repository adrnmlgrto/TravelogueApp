// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
// ignore_for_file: prefer_const_constructors

// run "flutter pub get cached_network_image" to install cached_network_image dependency

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class CardItem {
  final String urlImage;
  final String title;

  const CardItem({required this.urlImage, required this.title});
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  List<CardItem> items = [
    CardItem(
      urlImage: 'https://i.imgur.com/3nDbdj9.jpg',
      title: "Italy",
    ),
    CardItem(
      urlImage: 'https://i.imgur.com/ovUxvfv.jpg',
      title: "Greece",
    ),
    CardItem(
      urlImage: 'https://i.imgur.com/xHYTpet.jpg',
      title: "Japan",
    ),
  ];

  final assetImages = [
    'https://i.imgur.com/lmVu6hE.jpg',
    'https://i.imgur.com/AT99xvN.jpg',
    'https://i.imgur.com/UDP5CU8.jpg',
    'https://i.imgur.com/LF7TZtL.jpg',
    'https://i.imgur.com/HAZkdmu.jpg',
    'https://i.imgur.com/qs0gHJD.jpg',
    'https://i.imgur.com/bIECyT1.jpg',
  ];

  List<String> imgURLs = [
    'https://i.imgur.com/8QMxEOk.jpg',
    'https://i.imgur.com/MtjZERb.jpg',
    'https://i.imgur.com/BTfKstm.jpg'
  ];

  List<Widget> countrySheets = [
    Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Australia is abundant with unique experiences and awe-inspiring landscapes. There’s a well-known vibrancy in its natural beauty, but don’t forget to seek out its history and culture as well. There's plenty here to inspire your future travel plans so, go on, take a look around and let yourself dream of all the possibilities.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )),
    Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "India is on the bucket list for many travelers, and it’s no mystery why! The diverse landscape, colorful festivals, and spicy-hot cuisine are already reasons enough to pack your bags to visit Mumbai or Varanasi.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )),
    Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Thailand is a Southeast Asian country. It's known for tropical beaches, opulent royal palaces, ancient ruins and ornate temples displaying figures of Buddha. In Bangkok, the capital, an ultramodern cityscape rises next to quiet canalside communities and the iconic temples of Wat Arun, Wat Pho and the Emerald Buddha Temple (Wat Phra Kaew).",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ))
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                "assets/LOGO.png",
                height: 60,
                width: 60,
              ),
              buildIntro(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView(children: [
                //for carousel slider
                Column(children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 260,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 6),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                    itemCount: assetImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final assetImage = assetImages[index];
                      return buildImage(assetImage, index);
                    },
                  ),
                  const SizedBox(height: 10),
                  buildIndicator(),
                ]),
                SizedBox(height: 50),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        text: "Discover our ",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                        children: const <TextSpan>[
                          TextSpan(
                            text: "destinations",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                for (int i = 0; i < imgURLs.length; i++)
                  buildImageWidgets(
                      context, this.imgURLs[i], this.countrySheets[i]),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        text: "..and many more. ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        children: const <TextSpan>[
                          TextSpan(
                            text: "Book now!",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "Popular",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        children: const <TextSpan>[
                          TextSpan(
                            text: " places",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    )),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (int i = 0; i < items.length; i++)
                          buildRow(context, items[i]),
                      ],
                    )),
              ]))
            ]),
      ));

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: assetImages.length,
      effect: ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          dotColor: Colors.grey,
          activeDotColor: Colors.deepOrange));

  Widget buildIntro() {
    return Stack(children: [
      Column(children: const <Widget>[
        Padding(padding: EdgeInsets.only(top: 35)),
        Text.rich(
          TextSpan(
              text: " Welcome,",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "\n  travel with us today!",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 30.0,
                  ),
                ),
              ]),
        )
      ]),
    ]);
  }

  Widget buildImage(String assetImage, int index) {
    return Container(
      color: Colors.transparent,
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(20),
        child: FadeInImage.assetNetwork(
          placeholder: "assets/loading.gif",
          image: assetImage,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget buildImageWidgets(
      BuildContext context, String imgURLs, Widget countrySheets) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 18),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              //color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(4, 4),
                )
              ]),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )),
                context: context,
                builder: (builder) => countrySheets,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imgURLs,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildRow(BuildContext context, CardItem cardItem) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      width: 200,
      height: 180,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: cardItem.urlImage,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(cardItem.title, style: TextStyle(fontSize: 20)),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
