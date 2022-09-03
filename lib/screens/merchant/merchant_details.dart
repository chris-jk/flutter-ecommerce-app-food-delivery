import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MerchDetails extends StatelessWidget {
  const MerchDetails({Key? key, required int pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Menu', 'Info', 'Reviews', 'Deals'];

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
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
      // bottom sheet for add to cart///
      bottomNavigationBar: Container(
        height: Dimensions.bottomAddToBag,
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: Dimensions.height10,
            top: Dimensions.height10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.width20),
            topRight: Radius.circular(Dimensions.width20),
          ),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(Dimensions.width15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            BigText(text: '\$420.00'),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            SmallText(text: ' ̶\$̶5̶2̶0̶.̶0̶0̶'),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.width15),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(Dimensions.width15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.remove,
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            BigText(text: '1'),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            const Icon(
                              Icons.add,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.width15),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      BigText(text: 'Add to cart', color: Colors.white),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
