import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;
  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    super.key,
    required this.isOverdue,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDotWidget(isActive: true, title: 'Confirm order'),
        const CustomDivider(),
        if (currentStatus == 1) ...{
          const _StatusDotWidget(
            isActive: true,
            title: 'Reserved',
            backgroundColor: Colors.orange,
          )
        } else if (isOverdue) ...{
          const _StatusDotWidget(
            isActive: true,
            title: 'Expired payment',
            backgroundColor: Colors.red,
          )
        } else ...{
          _StatusDotWidget(
            isActive: currentStatus >= 2, 
            title: 'Payment'
          ),
          const CustomDivider(),
           _StatusDotWidget(
            isActive: currentStatus >= 3, 
            title: 'Prepare'
          ),
          const CustomDivider(),
           _StatusDotWidget(
            isActive: currentStatus >= 4, 
            title: 'Delivering'
          ),
          const CustomDivider(),
           _StatusDotWidget(
            isActive: currentStatus >= 5, 
            title: 'Delivered'
          ),
        }
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDotWidget extends StatelessWidget {
  const _StatusDotWidget(
      {super.key,
      required this.isActive,
      required this.title,
      this.backgroundColor});

  final bool isActive;
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DOT
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: CustomColor.customSwatchColor),
              color: isActive
                  ? backgroundColor ?? CustomColor.customSwatchColor
                  : Colors.transparent),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        const SizedBox(
          width: 5,
        ),

        //Text
        Expanded(child: Text(title))
      ],
    );
  }
}
