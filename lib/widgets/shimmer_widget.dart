import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerType {
  dashboard,
  shipment,
}

class ShimmerWidget extends StatelessWidget {
  final ShimmerType type;

  const ShimmerWidget({Key? key, required this.type,}) : super(key: key);

  Widget _textShimmer({
    required double width,
    double height = 14,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: const ShapeDecoration(
        color: Colors.grey,
        shape: StadiumBorder(),
      ),
    );
  }

  Widget _containerShimmer({
    required double height,
    required bool showButtonShimmer,
  }) {
    return Container(
      height: 150,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _textShimmer(width: 120),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textShimmer(width: 80, height: 10),
                  const SizedBox(height: 8),
                  _textShimmer(width: 60, height: 24),
                ],
              ),
              showButtonShimmer
                  ? _textShimmer(width: 80, height: 30)
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _requestCardShimmer() {
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

  Widget _dashboardShimmerBuild() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _containerShimmer(height: 120, showButtonShimmer: true),
        const SizedBox(height: 10),
        _containerShimmer(height: 120, showButtonShimmer: false),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _textShimmer(width: 100),
        ),
        _requestCardShimmer(),
        const SizedBox(height: 12),
        _requestCardShimmer(),
        const SizedBox(height: 12),
        _requestCardShimmer(),
        const SizedBox(height: 12),
        _requestCardShimmer(),
      ],
    );
  }

  Widget _shipmentBuild() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        _requestCardShimmer(),
        const SizedBox(height: 12),
        _requestCardShimmer(),
        const SizedBox(height: 12),
        _requestCardShimmer(),
        const SizedBox(height: 12),
        _requestCardShimmer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: SingleChildScrollView(
        child: type == ShimmerType.dashboard ? _dashboardShimmerBuild() : _shipmentBuild(),
      ),
    );
  }
}
