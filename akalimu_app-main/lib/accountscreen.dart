import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEBEB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF163a96),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            backgroundColor: Color(0xFF163a96),
            radius: 50,
            child: Text(
              'SN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Shamira Naiga',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'shamiranaiga2@gmail.com',
            style: TextStyle(),
          ),
          SizedBox(height: 32),
          MyAccountCard(
            icon: Icons.edit,
            label: 'Edit Profile',
          ),
          MyAccountCard(
            icon: Icons.star,
            label: 'Rate and Review',
          ),
          MyAccountCard(
            icon: Icons.credit_card,
            label: 'Payment Methods',
          ),
          MyAccountCard(
            icon: Icons.history,
            label: 'Payment History',
          ),
          MyAccountCard(
            icon: Icons.help_outline,
            label: 'Help',
          ),
          MyAccountCard(
            icon: Icons.logout,
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}

class MyAccountCard extends StatefulWidget {
  final IconData icon;
  final String label;

  const MyAccountCard({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  State<MyAccountCard> createState() => _MyAccountCardState();
}

class _MyAccountCardState extends State<MyAccountCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {},
        highlightColor: const Color(0xFF163a96),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(widget.icon),
              const SizedBox(width: 16),
              Text(widget.label),
            ],
          ),
        ),
      ),
    );
  }
}
