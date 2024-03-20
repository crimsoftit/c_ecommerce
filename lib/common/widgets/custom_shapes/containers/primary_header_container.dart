import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CPrimaryHeaderContainer extends StatelessWidget {
  const CPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CCurvedEdgeWidget(
      child: Container(
        color: RColors.primaryBrown,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400.0,
          child: Stack(
            children: [
              // -- background custom shapes
              Positioned(
                top: -150,
                right: -250,
                child: RCircularContainer(
                  bgColor: RColors.txtWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: RCircularContainer(
                  bgColor: RColors.txtWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}