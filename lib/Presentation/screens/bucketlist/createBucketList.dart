import 'package:flutter/material.dart';
import 'package:travas/Data/model/bucketlistmodel.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';

class CreateBucketListPage extends StatelessWidget {
  static const String id = 'Createbucketlistpage';
  const CreateBucketListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const BucketListPageContents(),
    );
  }
}

class BucketListPageContents extends StatefulWidget {
  const BucketListPageContents({Key? key}) : super(key: key);

  @override
  State<BucketListPageContents> createState() => _BucketListPageContentsState();
}

class _BucketListPageContentsState extends State<BucketListPageContents> {
  String searchInput = '';
  TextEditingController controller = TextEditingController();
  UpcomingTour upcomingTour = UpcomingTour();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create your explore bucket list',
                style: kBoldTextStyleBlack,
              ),
              addVerticalSpacing(20),
              const Text(
                  'Let’s make your dreams come true. Tell us where you would like to visit or an event you would like to attend and we might just make it happen'),
              addVerticalSpacing(20),
              const Text(
                'Add from upcoming tours',
                style: kBoldTextStyleBlack,
              ),
              addVerticalSpacing(20),
            ],
          ),
          Flexible(
            child: ListView(
              children: upcomingTour.getUpcomingTour(context),
            ),
          ),
          Row(
            children: [
              Expanded(child: ReusableButton(const Text('Add'), () {})),
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: controller,
                  onChanged: (newValue) {
                    newValue = controller.text;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter a place or an event',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
