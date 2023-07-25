import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  Widget _textShimmer({required double width}) {
    return Container(
      height: 14,
      width: width,
      decoration: const ShapeDecoration(
        color: Colors.grey,
        shape: StadiumBorder(),
      ),
    );
  }

  Widget _shipmentShimmer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        title: Align(
          alignment: Alignment.topLeft,
          child: _textShimmer(width: 100),
        ),
        subtitle: Align(
          alignment: Alignment.topLeft,
          child: _textShimmer(width: 150),
        ),
        trailing: _textShimmer(width: 100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textShimmer(width: 100),
            const SizedBox(height: 12),
            _shipmentShimmer(),
            const SizedBox(height: 12),
            _shipmentShimmer(),
          ],
        ),
      ),
    );
  }
}
