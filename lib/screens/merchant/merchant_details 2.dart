import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/merchant_items_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/item_card.dart';
import '../../widgets/line_through_small_text.dart';
import '../../widgets/small_text.dart';

class MerchantDetails extends StatefulWidget {
  const MerchantDetails({required int pageId, Key? key}) : super(key: key);

  @override
  State<MerchantDetails> createState() => _MerchantDetailsState();
}

class _MerchantDetailsState extends State<MerchantDetails>
    with TickerProviderStateMixin {
// sliver tutorial https://youtu.be/7dAt-JMSCVQ?t=16506
  @override
  Widget build(BuildContext context) {
    Get.find<MerchantItemsController>().getMerchantItems();

    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://via.placeholder.com/350x150',
                width: double.maxFinite,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: const Text(
                      'Whoops!',
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 70,
                  ),
                ),

                // Tab Bar Tabs menu  deals info reviews
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    indicator:
                        CircleTabIndicator(color: Colors.black54, radius: 3),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "MENU"),
                      Tab(text: "DEALS"),
                      Tab(text: "INFO"),
                    ],
                  ),
                ),
                // Tab Bar Views
                Container(
                  width: double.maxFinite,
                  height: 400,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      GetBuilder<MerchantItemsController>(
                        builder: (itemsData) {
                          return itemsData.isLoaded
                              //--------------- Menu   ---------------- //
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: itemsData.merchantItems[0].length,
                                  itemBuilder: (context, index) {
                                    // main container for each item
                                    return ItemCard(
                                      itemsData: itemsData,
                                    );
                                  },
                                )
                              : const CircularProgressIndicator(
                                  color: AppColors.mainColor,
                                );
                        },
                      ),

                      //--------------- Deals   ---------------- //
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
                                image: NetworkImage(
                                    'https://picsum.photos/250?image=9'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      //----------------  Info  ---------------- //
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
          )
        ],
      ),
    );
  }
}

// extract circle indcator indicator widget to reuse it
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
