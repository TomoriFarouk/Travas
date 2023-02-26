import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:travas/Data/model/bucketlistmodel.dart';
import 'package:travas/Presentation/screens/bucketlist/createBucketList.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';

class BucketList extends StatefulWidget {
  static const String id = 'BucketListPage';

  const BucketList({Key? key}) : super(key: key);

  @override
  State<BucketList> createState() => _BucketListState();
}

class _BucketListState extends State<BucketList> {
  int? bucketListLength;
  UpcomingTour upcomingTour = UpcomingTour();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bucketListLength = Provider.of<UpcomingTour>(context).bucketList.length;

    if (bucketListLength == 0) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              tooltip: 'Add new tour to BucketList',
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const CreateBucketListPage(),
                        type: PageTransitionType.rightToLeft));
              }),
          body: Align(
            alignment: Alignment.center,
            child: ListView(scrollDirection: Axis.vertical, children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.41,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/emptybucketlist.jpg'),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'BucketList is Empty',
                  style: kBoldTextStyleBlack,
                ),
              ),
              addVerticalSpacing(20),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    'Let’s make your dreams come true. Add places/events you woud like to visit/attend. '),
              ),
            ]),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              tooltip: 'Add new tour to BucketList',
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                        context,
                        PageTransition(
                            child: const CreateBucketListPage(),
                            type: PageTransitionType.rightToLeft))
                    .then((value) => setState(() {}));
              }),
          body: Column(
            children: [
              Flexible(
                child: Consumer<UpcomingTour>(
                  builder: (context, UpcomingTour, _) {
                    return ListView(
                      shrinkWrap: true,
                      children: UpcomingTour.bucketList,
                    );
                  },
                ),
              ),
              addVerticalSpacing(10),
              Text(
                  'Number of items in the bucket list is ${context.watch<UpcomingTour>().bucketListCount}'),
              addVerticalSpacing(10),
              ReusableButton(const Text('Clear BucketList'), () {
                context.read<UpcomingTour>().clearBucketList();
              })
            ],
          ),
        ),
      );
    }
  }
}
