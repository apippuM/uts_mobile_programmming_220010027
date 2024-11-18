import 'package:flutter/material.dart';
import 'package:uts_mobile_programmming/models/hewan.dart';
import 'package:uts_mobile_programmming/pages/hewan_entry.dart';
import 'package:uts_mobile_programmming/widgets/card_item.dart';
import 'package:collection/collection.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.speciesName,
    required this.onUpdate,
    required this.onDelete,
    });

  final String speciesName;
  final Function(String speciesName) onUpdate;
  final Function(String speciesName) onDelete;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Hewan> hewan = [];

  @override
  void initState() {
    super.initState();
    hewan = List.generate(
      1,
      (index) => Hewan(
        speciesName: 'Felis catus',
        indonesianName: 'Kucing',
        description: 'Sebuah hewan lucu berkaki empat dan memiliki kumis.',
        imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSC4DtHTGprsp7K8u0ZlfSDmIDplvQYH5vniT0I3rpcl6wqBh8b'
      ),
    );
  }

  void _saveHewan(Hewan newHewan) {
    final existingHewan = getHewanBySpeciesName(newHewan.speciesName);
    if (existingHewan == null) {
      setState(() {
        hewan.add(newHewan);
      });
    } else {
      setState(() {
        hewan[hewan.indexOf(existingHewan)] = newHewan;
      });
    }
  }

  void onUpdate(String speciesName) {
    final selectedHewan = hewan.firstWhere((hewan) => hewan.speciesName == speciesName);
    showDialog(context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Update Hewan'),
        content: const Text('Apakah anda yakin ingin mengupdate hewan ini?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Update'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HewanEntry(
                  onSaved: _saveHewan,
                  selectedHewan: selectedHewan
                );
              }));
              
              Navigator.of(context).pop();
            },
          ),
        ]
      );
    });
  }

  void onDelete(String speciesName) {
    final selectedHewan = getHewanBySpeciesName(speciesName);
    showDialog(context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Hewan'),
        content: const Text('Apakah anda yakin ingin menghapus hewan ini?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              setState(() {
                hewan.remove(selectedHewan);
              });
              Navigator.of(context).pop();
            },
          ),
        ]
      );
    });
  }

  Hewan? getHewanBySpeciesName(String speciesName) {
    return hewan.firstWhereOrNull((hewan) => hewan.speciesName == speciesName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamus Hewan'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 200, 97),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: hewan.map((hewan) => CardItem(
            hewan: hewan, onDelete: onDelete, onUpdate: onUpdate
          )).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return HewanEntry(
              onSaved: _saveHewan
            );
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}