import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coinName});

  final String coinName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: SvgPicture.asset(
          'assets/svg/bitcoin-logo.svg',
          width: 32,
          height: 32,
        ),
      ),
      title: Text('Crypto $coinName '),
      subtitle: Text('Price: \$50,000'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.pushNamed(
        context,
        '/coin',
        arguments: {'coinName': coinName},
      ),
    );
  }
}
