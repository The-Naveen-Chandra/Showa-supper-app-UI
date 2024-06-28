import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:showa_supper_app/components/dashboard_slider.dart';
import 'package:showa_supper_app/components/grid_item.dart';
import 'package:showa_supper_app/components/offer_slider.dart';
import 'package:showa_supper_app/components/product_container.dart';
import 'package:showa_supper_app/constants/constant_colors.dart';
import 'package:showa_supper_app/constants/constant_fontsize_fontweight.dart';
import 'package:showa_supper_app/constants/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DashboardSlider(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore Showa",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.medium,
                      fontWeight: ConstantFontWeight.bold,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    "6 services available",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraSmall,
                      fontWeight: ConstantFontWeight.normal,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: gridItems.length,
                  itemBuilder: (context, index) {
                    return GridItemWidget(item: gridItems[index]);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Container for the offer
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  OfferSlider(),
                  OfferSlider(),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: OfferSlider(),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Selling Items",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.small,
                      fontWeight: ConstantFontWeight.semiBold,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    "See More",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraExtraSmall,
                      fontWeight: ConstantFontWeight.semiBold,
                      color: ConstantColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ProductContainer(),
                  ),
                  ProductContainer(),
                  ProductContainer(),
                  ProductContainer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ProductContainer(),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Items",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.small,
                      fontWeight: ConstantFontWeight.semiBold,
                      color: ConstantColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    "See More",
                    style: GoogleFonts.poppins(
                      fontSize: ConstantFontSize.extraExtraSmall,
                      fontWeight: ConstantFontWeight.semiBold,
                      color: ConstantColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ProductContainer(),
                  ),
                  ProductContainer(),
                  ProductContainer(),
                  ProductContainer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ProductContainer(),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
