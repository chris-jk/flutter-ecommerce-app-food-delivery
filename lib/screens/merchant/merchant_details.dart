import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/merchant_items_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/item_card.dart';
import '../../widgets/line_through_small_text.dart';
import '../../widgets/small_text.dart';

class MerchantDetails extends StatelessWidget {
  const MerchantDetails({Key? key, required int pageId}) : super(key: key);

  get merchantItem => null;

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Menu', 'Info', 'Reviews', 'Deals'];
// get all merchant items
    Get.find<MerchantItemsController>().getMerchantItems();
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  toolbarHeight: Dimensions.height30 * 2.6,
                  // top buttons
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AppIcon(icon: Icons.clear),
                      AppIcon(icon: Icons.shopping_bag_outlined),
                    ],
                  ),
                  pinned: true,
                  backgroundColor: AppColors.mainColor,
                  expandedHeight: Dimensions.productImageDetail,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/image/food0.png',
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  forceElevated: innerBoxIsScrolled,
                  // Tab Bar
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(20),
                    child: Material(
                      color: Colors.white,
                      child: TabBar(
                        indicatorColor: AppColors.mainColor,
                        labelColor: AppColors.mainColor,
                        unselectedLabelColor: Colors.grey,
                        // These are the widgets to put in each tab in the tab bar.
                        tabs:
                            tabs.map((String name) => Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: tabs.map((String name) {
              return GetBuilder<MerchantItemsController>(
                builder: (itemsData) {
                  return ListView.builder(
                    // make list horizontal
                    scrollDirection: Axis.horizontal,
                    itemCount: itemsData.merchantItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: ItemCard(
                          index: index,
                          data: itemsData.merchantItems[0][index],
                        ),
                      );
                    },
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
      // bottom sheet for add to cart///
    );
  }
}
