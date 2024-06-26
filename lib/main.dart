import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'input_pemain.dart';
import 'edit_pemain.dart';
import 'deskripsi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PlayerList(),
        '/input': (context) => InputPlayer(),
      },
    );
  }
}

class PlayerList extends StatefulWidget {
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  List players = [];

  @override
  void initState() {
    super.initState();
    fetchPlayers();
  }

  fetchPlayers() async {
    final response = await http.get(Uri.parse('http://localhost/tampil_pemain.php'));
    if (response.statusCode == 200) {
      setState(() {
        players = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load players');
    }
  }

  deletePlayer(String id) async {
    final response = await http.post(
      Uri.parse('http://localhost/hapus_pemain.php'),
      body: {'id': id},
    );

    if (response.statusCode == 200) {
      fetchPlayers();  // Refresh the list
    } else {
      throw Exception('Failed to delete player');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pemain E-Sport'),
      ),
      body: players.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${players[index]['nama']} (${players[index]['negara']})'),
                  subtitle: Text(players[index]['tim']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditPlayer(player: players[index]),
                            ),
                          ).then((value) => fetchPlayers());
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deletePlayer(players[index]['id']);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerDetail(player: players[index]),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/input').then((value) => fetchPlayers());
        },
        child: Icon(Icons.add),
        tooltip: 'Tambah',
      ),
    );
  }
}
