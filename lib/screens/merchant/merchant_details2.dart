import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/merchant_items_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class MerchDetails2 extends StatefulWidget {
  const MerchDetails2({Key? key, required int pageId}) : super(key: key);

  @override
  State<MerchDetails2> createState() => _MerchDetails2State();
}

class _MerchDetails2State extends State<MerchDetails2>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Get.find<MercahntItemsController>().getMerchantItems();

    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 70,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: BigText(text: "Discover", size: 30)),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              indicator: CircleTabIndicator(color: Colors.black54, radius: 3),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "MENU"),
                Tab(text: "DEALS"),
                Tab(text: "INFO"),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                GetBuilder<MercahntItemsController>(
                  builder: (itmesData) {
                    return itmesData.isLoaded
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: itmesData.merchantItems[0].length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200,
                                height: Dimensions.pageView,
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(itmesData
                                        .merchantItems[0][index].logom),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          )
                        : const CircularProgressIndicator(
                            color: AppColors.mainColor,
                          );
                  },
                ),

                // Deals
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      height: 200,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image:
                              NetworkImage('https://picsum.photos/250?image=9'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // INFO
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                            ),
                            Gap(10),
                            BigText(
                              text: "Sacramnto, CA",
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: BigText(text: "Explore more", size: 20)),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
