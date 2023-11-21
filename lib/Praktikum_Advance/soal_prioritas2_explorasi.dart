import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: AdvancePage(),
  ));
}

class AdvancePage extends StatefulWidget {
  const AdvancePage({Key? key}) : super(key: key);

  @override
  State<AdvancePage> createState() => _AdvancePageState();
}

class _AdvancePageState extends State<AdvancePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController fileController = TextEditingController();
  List<Map<String, String>> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Advance Form'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.phone_android, size: 40.0),
            ],
          ),
          const SizedBox(height: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Create New Contact",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "A dialog is a type of modal window that appears in front of app content to provide critical information or prompt for a decision to be made",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Divider(height: 24.0, thickness: 2.0),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: "Insert Your Name",
                    labelText: "Name",
                    icon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    if (!RegExp(r'^[A-Z][a-z]*(?: [A-Z][a-z]*)?$')
                        .hasMatch(value)) {
                      return 'Name must consist of at least 2 words, each starting with a capital letter, and contain only letters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: numberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: "08...",
                    labelText: "Number",
                    icon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Number cannot be empty';
                    }
                    if (!RegExp(r'^08[0-9]{8,15}$').hasMatch(value)) {
                      return 'Number must consist of digits, be at least 8 digits, at most 15 digits, and start with "08"';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: dateController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                              hintText: "Choose Date",
                              labelText: "Date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 6.0,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Choose Date';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectColor(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: colorController,
                            decoration: InputDecoration(
                              hintText: "Choose Color",
                              labelText: "Color",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 6.0,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Choose Color';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text(
                      "File",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectFile(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: fileController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                              hintText: "Choose File",
                              labelText: "File",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 6.0,
                              ),
                            ),
                            validator: (value) {
                              // Menerima input kosong untuk file
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      String name = nameController.text;
                      String number = numberController.text;
                      String date = dateController.text;
                      String color = colorController.text;
                      String file = fileController.text;
                      Map<String, String> contact = {
                        'name': name,
                        'number': number,
                        'date': date,
                        'color': color,
                        'file': file,
                      };
                      setState(() {
                        contacts.add(contact);
                      });
                      // Clear input fields after submission
                      nameController.clear();
                      numberController.clear();
                      dateController.clear();
                      colorController.clear();
                      fileController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            "List Contacts",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: contacts.asMap().entries.map((entry) {
              final contact = entry.value;
              return Container(
                height: 120,
                margin: const EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                  color: contact.containsKey('color')
                      ? Color(int.parse(contact['color']!))
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Ikon di sebelah kanan
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                (contact['name']?.isNotEmpty ?? false)
                                    ? contact['name']![0].toUpperCase()
                                    : '',
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${contact['name']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Number: ${contact['number']}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Date: ${(contact['date'])}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Color: ${(contact['color'])}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "File: ${(contact['file'])}",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 0.1),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                contacts.remove(contact);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2099),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dateController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectColor(BuildContext context) async {
    Color selectedColor = await showDialog(
      context: context,
      builder: (BuildContext context) {
        Color currentColor = Colors.white;
        return AlertDialog(
          title: const Text('Select a Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: (Color color) {
                currentColor = color;
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(currentColor);
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );

    setState(() {
      colorController.text = selectedColor.value.toString();
    });
  }

  Future<void> _selectFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        fileController.text = result.files.first.name;
      });
    }
  }
}
