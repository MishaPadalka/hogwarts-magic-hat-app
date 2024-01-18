import 'package:flutter/material.dart';
import 'package:hogwarts_magic_hat_app/presentation/shared/colors.dart';

class GuessesAmountRow extends StatelessWidget {
  final int total;
  final int success;
  final int failed;

  const GuessesAmountRow({
    super.key,
    required this.total,
    required this.success,
    required this.failed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _totalItem(context, 'Total', total),
          _totalItem(context, 'Success', success),
          _totalItem(context, 'Failed', failed)
        ],
      ),
    );
  }

  Widget _totalItem(BuildContext context, String title, int amount) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.lightGrey,
          border: Border.all(
            color: Colors.black,
            width: 2,
          )),
      child: Column(
        children: [
          Text(amount.toString()),
          Text(title),
        ],
      ),
    );
  }
}
