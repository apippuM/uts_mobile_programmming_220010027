import 'package:flutter/material.dart';
import 'package:uts_mobile_programmming/models/hewan.dart';
import 'package:uts_mobile_programmming/resources/dimension.dart';

class HewanEntry extends StatefulWidget {
  const HewanEntry({super.key, required this.onSaved, this.selectedHewan});

  final Function(Hewan newHewan) onSaved;
  final Hewan? selectedHewan;

  @override
  State<HewanEntry> createState() => _HewanEntryState();
}

class _HewanEntryState extends State<HewanEntry> {

  final _formkey = GlobalKey<FormState>();
  final _dataHewan = {};

  // Text Editing Controller
  final _speciesNameController = TextEditingController();
  final _indonesianNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.selectedHewan != null) {
      final selectedHewan = widget.selectedHewan!;
      _speciesNameController.text = widget.selectedHewan!.speciesName;
      _indonesianNameController.text = widget.selectedHewan!.indonesianName;
      _descriptionController.text = widget.selectedHewan!.description;
      _imageUrlController.text = widget.selectedHewan!.imageUrl;
    }
  }

  void _saveHewan() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      final hewan = Hewan(
        speciesName: widget.selectedHewan?.speciesName ?? _speciesNameController.text,
        indonesianName: _indonesianNameController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrlController.text,
      );
      widget.onSaved(hewan);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.selectedHewan != null ? 'Update' : 'Add'} Hewan'
          ),
        centerTitle: true
      ),
      body: Padding(
        padding: const EdgeInsets.all(extraLargeSize),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Species Name'),
                ), 
                TextFormField(
                  controller: _speciesNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(extraLargeSize)
                    ),
                    prefixIcon: const Icon(Icons.catching_pokemon)
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter species name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataHewan['speciesName'] = newValue;
                    }
                  }
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Indonesian Name'),
                ),
                TextFormField(
                  controller: _indonesianNameController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(extraLargeSize)
                    ),
                    prefixIcon: const Icon(Icons.pets)
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Indonesian name';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataHewan['indonesianName'] = newValue;
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Description'),
                ),
                TextFormField(
                  controller: _descriptionController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(extraLargeSize)
                    ),
                    prefixIcon: const Icon(Icons.notes)
                  ),
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter animal description';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataHewan['description'] = newValue;
                    }
                  },
                  minLines: 3,
                  maxLines: null,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Indonesian Name'),
                ),
                TextFormField(
                  controller: _imageUrlController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(extraLargeSize)
                    ),
                    hintText: 'Insert image URL',
                    prefixIcon: const Icon(Icons.image)
                  ),
                  keyboardType: TextInputType.url,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter image URL';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataHewan['imageUrl'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: largeSize,),
                ElevatedButton(
                  onPressed: _saveHewan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 200, 97),
                    foregroundColor: Colors.white
                  ),
                  child: const Text('Send'),
                ),
                const SizedBox(height: mediumSize,),
                OutlinedButton(
                  onPressed: () {
                    // Navigasi ke halaman home
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          )),
      )
    );
  }
}