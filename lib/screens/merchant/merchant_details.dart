import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/item_card.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/merchant_items_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/circle_tab_indicator.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/item_card.dart';
import '../../widgets/line_through_small_text.dart';
import '../../widgets/small_text.dart';
import 'mechant_info_menu.dart';

class MerchantDetails extends StatefulWidget {
  const MerchantDetails({Key? key, required int pageId}) : super(key: key);

  @override
  State<MerchantDetails> createState() => _MerchantDetailsState();
}

class _MerchantDetailsState extends State<MerchantDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
// get all merchant items
    Get.find<MerchantItemsController>().getMerchantItems();
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://via.placeholder.com/300x200',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 3),
                  labelColor: AppColors.mainColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "MENU"),
                    Tab(text: "INFO"),
                  ],
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.height10, bottom: Dimensions.height10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.width20),
                    topRight: Radius.circular(Dimensions.width20),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.maxFinite,
              height: 800,
              child: TabBarView(
                controller: _tabController,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: double.maxFinite,
                          height: 380,
                          child: GetBuilder<MerchantItemsController>(
                            builder: (itemsData) {
                              return itemsData.isLoaded
                                  // menu items
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: itemsData.merchantItems.length,
                                      itemBuilder: (context, index) {
                                        // main container for each item
                                        return ItemCard(
                                            index: index,
                                            data: itemsData.merchantItems[0]
                                                [index]);
                                      },
                                    )
                                  : const CircularProgressIndicator(
                                      color: AppColors.mainColor,
                                    );
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: double.maxFinite,
                          height: 380,
                          child: GetBuilder<MerchantItemsController>(
                            builder: (itemsData) {
                              return itemsData.isLoaded
                                  // menu items
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: itemsData.merchantItems.length,
                                      itemBuilder: (context, index) {
                                        // main container for each item
                                        return ItemCard(
                                            index: index,
                                            data: itemsData.merchantItems[0]
                                                [index]);
                                      },
                                    )
                                  : const CircularProgressIndicator(
                                      color: AppColors.mainColor,
                                    );
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: double.maxFinite,
                          height: 370,
                          child: GetBuilder<MerchantItemsController>(
                            builder: (itemsData) {
                              return itemsData.isLoaded
                                  // menu items
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: itemsData.merchantItems.length,
                                      itemBuilder: (context, index) {
                                        // main container for each item
                                        return ItemCard(
                                            index: index,
                                            data: itemsData.merchantItems[1]
                                                [index]);
                                      },
                                    )
                                  : const CircularProgressIndicator(
                                      color: AppColors.mainColor,
                                    );
                            },
                          ),
                        ),
                      ),
                      // make padding bottom for the last item
                      const SliverToBoxAdapter(
                        child: Gap(200),
                      ),
                    ],
                  ),
                  MerchantInfo(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
