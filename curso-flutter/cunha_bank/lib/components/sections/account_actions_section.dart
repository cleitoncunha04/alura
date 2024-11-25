import 'package:cunha_bank/components/box_card_component.dart';
import 'package:flutter/material.dart';

class AccountActionsSection extends StatelessWidget {
  const AccountActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Account actions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: const BoxCardComponent(
                  boxContanet: _AccountActionsContent(
                    icon: Icon(Icons.account_balance_wallet),
                    text: 'Deposit',
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const BoxCardComponent(
                  boxContanet: _AccountActionsContent(
                    icon: Icon(Icons.cached),
                    text: 'Transfer',
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const BoxCardComponent(
                  boxContanet: _AccountActionsContent(
                    icon: Icon(Icons.center_focus_strong),
                    text: 'Scan',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _AccountActionsContent extends StatelessWidget {
  const _AccountActionsContent({
    required this.icon,
    required this.text,
  });

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: icon,
          ),
          Text(text),
        ],
      ),
    );
  }
}
