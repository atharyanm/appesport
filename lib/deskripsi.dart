import 'package:flutter/material.dart';

class PlayerDetail extends StatelessWidget {
  final Map<String, dynamic> player;

  PlayerDetail({required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pemain E-Sport'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${player['nama']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Negara: ${player['negara']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Tim: ${player['tim']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
