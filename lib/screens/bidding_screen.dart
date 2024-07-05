import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/bidding_info.dart';
import '../utils/figma_space_to_percentage.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/google_map_display.dart';

class UserBiddingScreen extends StatefulWidget {
  const UserBiddingScreen({super.key});

  @override
  State<UserBiddingScreen> createState() => _UserBiddingScreenState();
}

class _UserBiddingScreenState extends State<UserBiddingScreen> {
  final bids = [
    {
      'name': 'Workshop 1',
      'price': 1000.0,
      'distance': 1000,
    },
    {
      'name': 'Workshop 2',
      'price': 2300.0,
      'distance': 2300,
    },
    {
      'name': 'Workshop 3',
      'price': 3000.0,
      'distance': 3000,
    },
    {
      'name': 'Workshop 4',
      'price': 3000.0,
      'distance': 3000,
    },
    {
      'name': 'Workshop 5',
      'price': 3000.0,
      'distance': 3000,
    },
    {
      'name': 'Workshop 6',
      'price': 3000.0,
      'distance': 3000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final biddingInfo = context.read<BiddingInfo>();
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: figmaSpaceToPercentageWidth(25, context),
              vertical: figmaSpaceToPercentageHeight(15, context),
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Map',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -1,
              ),
            ),
          ),
          SizedBox(
            height: figmaSpaceToPercentageHeight(300, context),
            child: const GoogleMapDisplay(),
          ),
          SizedBox(height: figmaSpaceToPercentageHeight(20, context)),
          Expanded(
            // child: StreamBuilder<QuerySnapshot>(
            // stream: FirebaseFirestore.instance
            //     .collection('bids')
            //     .doc(carUserInfo.getUid)
            //     .collection('cars')
            //     .snapshots(),
            // builder: (context, snapshot) {
            //   if (!snapshot.hasData) {
            //     return const Center(child: CircularProgressIndicator());
            //   }

            // final bids = snapshot.data!.docs;
            child: ListView.builder(
              itemCount: bids.length,
              itemBuilder: (context, index) {
                final bid = bids[index];
                return BidTile(
                  name: bid['name'] as String,
                  distance: bid['distance'] as int,
                  price: bid['price'] as double,
                );
              },
              //   );
              // },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomElevatedButton(
              text: "Concel",
              buttonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.transparent,
                ),
                elevation: WidgetStateProperty.all<double>(0),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    figmaSpaceToPercentageWidth(20, context)),
                gradient: LinearGradient(
                  begin: const Alignment(0.5, 0),
                  end: const Alignment(0.5, 1),
                  colors: [
                    const Color(0XFF6E7CB9),
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
              onPressed: () async {
                await biddingInfo.deleteBidding();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    title: Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      child: Image.asset(ImageConstant.carcare1, height: 25),
    ),
    actions: [
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 0.5),
              borderRadius: BorderRadius.circular(48),
              shape: BoxShape.rectangle,
            ),
            margin: const EdgeInsets.only(right: 5, top: 5, left: 10),
            width: 60,
            height: 38,
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 0.5),
              borderRadius: BorderRadius.circular(48),
              shape: BoxShape.rectangle,
            ),
            margin: const EdgeInsets.only(
              right: 10,
              top: 5,
              left: 5,
            ),
            width: 60,
            height: 38,
            child: IconButton(
              icon: const Icon(Icons.messenger_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  );
}

class BidTile extends StatelessWidget {
  final String name;
  final int distance;
  final double price;

  const BidTile({
    super.key,
    required this.name,
    required this.distance,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: Colors.lightBlue[100],
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: figmaSpaceToPercentageWidth(130, context),
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          'Distance: ${NumberFormat.compact().format(distance)} km',
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 8.0),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Row(
                  children: [
                    const Text(
                      'Price: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${price.toInt()}',
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {},
                      color: Colors.red,
                    ),
                    IconButton(
                      icon: const Icon(Icons.check_circle),
                      onPressed: () {},
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
