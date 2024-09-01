import 'package:flutter/material.dart';
import 'package:kalbas_mechine_test/utils/resources/constands.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 7.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.17,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Constants.shimmerbase,
                        highlightColor: Constants.shimmerhighlightColor,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Constants.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(7)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Constants.shimmerbase,
                                  highlightColor:
                                      Constants.shimmerhighlightColor,
                                  child: Container(
                                    color: Constants.grey,
                                    child: const Text(
                                      "fetcheddata.data[index] vav",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Constants.shimmerbase,
                                  highlightColor:
                                      Constants.shimmerhighlightColor,
                                  child: Container(
                                    color: Constants.grey,
                                    child: const Text(
                                      " data is ovet in here ss",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Shimmer.fromColors(
                              baseColor: Constants.shimmerbase,
                              highlightColor: Constants.shimmerhighlightColor,
                              child: Container(
                                color: Constants.grey,
                                child: const Text(
                                  "fetched fetched fetched",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
