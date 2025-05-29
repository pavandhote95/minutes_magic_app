import 'package:flutter/material.dart';
import 'package:minutes_magic_app/app/modules/payment/views/cart_payment_screen.dart';

class PaymentOptionScreen extends StatelessWidget {
  const PaymentOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Option"),
        leading: const BackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaymentTile(
            label: 'Debit / Credit card',
            icon: Icons.credit_card,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CardPaymentScreen()),
              );
            },
          ),
          PaymentTile(
            label: 'Internet Banking',
            icon: Icons.account_balance,
            onTap: () {},
          ),
          PaymentTile(
            label: 'Paytm',
            iconPath: 'assets/paytm.png',
            upi: true,
            isSelected: true,
            onTap: () {},
          ),
          PaymentTile(
            label: 'Phonepe',
            iconPath: 'assets/phonepe.png',
            upi: true,
            onTap: () {},
          ),
          const Divider(height: 32),
          PaymentTile(
            label: 'Add another option',
            icon: Icons.add_circle_outline,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class PaymentTile extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? iconPath;
  final bool upi;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentTile({
    super.key,
    required this.label,
    this.icon,
    this.iconPath,
    this.upi = false,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          isSelected
              ? RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blue, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              )
              : null,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        leading:
            iconPath != null
                ? Image.asset(iconPath!, width: 28)
                : Icon(icon, size: 28),
        title: Text(label),
        trailing: upi ? Image.asset('assets/upi.png', width: 34) : null,
      ),
    );
  }
}
