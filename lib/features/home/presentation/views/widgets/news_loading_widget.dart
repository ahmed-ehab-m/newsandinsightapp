import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsLoadingWidget extends StatelessWidget {
  const NewsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer(
        gradient: LinearGradient(colors: [Colors.white, Colors.grey]),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return _ShimmerPlaceholder();
            },
          ),
        ),
      ),
    );
  }
}

class _ShimmerPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;

    return Container(
      width: width,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Image placeholder
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Title placeholder
                Container(
                  width: width * 0.7,
                  height: 16,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 8),

                // ✅ Subtitle placeholder
                Container(
                  width: width * 0.5,
                  height: 14,
                  color: Colors.grey[300],
                ),

                SizedBox(height: 8),

                // ✅ Description placeholder
                Container(
                  width: width * 0.9,
                  height: 12,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
