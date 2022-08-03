import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  final VoidCallback retryCallback;

  const RetryWidget({required this.retryCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('برجاء المحاولة مرة اخري',
              style: TextStyle(
                fontSize: 18,
                height: 2,
                color: Colors.orange,
              )),
          TextButton(
            onPressed: retryCallback,
            child: Text(
              'حاول مرة اخري',
              style: TextStyle(
                fontSize: 16,
                height: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
