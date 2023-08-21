import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 59, 225, 1),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .2,
            ),
            Text('Edit Profile'),
          ],
        ),
      ),
      body: ProfileEditForm(),
    );
  }
}

class ProfileEditForm extends StatefulWidget {
  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _profileImageUrl = 'https://via.placeholder.com/150';

  void _changeProfileImage() {
    // Add logic to change the profile image
    // For example, show an image picker dialog
  }
  late File _pickedImage; // Use File for selected image

  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _pickedImage = File(''); // Initialize with an empty File
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  // InkWell(
  //               onTap: _pickImage,
  //               child: Container(
  //                 alignment: Alignment.center,
  //                 height: 150.0,
  //                 decoration: BoxDecoration(
  //                   border: Border.all(
  //                       color: const Color.fromRGBO(107, 59, 225, 1)),
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: _pickedImage.path.isEmpty
  //                     ? Icon(Icons.camera_alt,
  //                         size: 60.0, color: Color.fromRGBO(107, 59, 225, 1))
  //                     : Image.file(
  //                         _pickedImage, // Use the File object here
  //                         fit: BoxFit.cover,
  //                       ),
  //               ),
  //             ),

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: _pickImage,
            child: Container(
              alignment: Alignment.center,
              height: 150.0,
              width: 150,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromRGBO(107, 59, 225, 1)),
                borderRadius: BorderRadius.circular(100),
              ),
              child: _pickedImage.path.isEmpty
                  ? Icon(Icons.camera_alt,
                      size: 60.0, color: Color.fromRGBO(107, 59, 225, 1))
                  : Image.file(
                      _pickedImage, // Use the File object here
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _fullNameController,
            cursorColor: const Color.fromRGBO(107, 59, 225, 1),
            decoration: const InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(color: Color.fromRGBO(107, 59, 225, 1)),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1)))),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            controller: _emailController,
            cursorColor: const Color.fromRGBO(107, 59, 225, 1),
            decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color.fromRGBO(107, 59, 225, 1)),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1)))),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 8.0),
          TextFormField(
            controller: _phoneController,
            cursorColor: const Color.fromRGBO(107, 59, 225, 1),
            decoration: const InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Color.fromRGBO(107, 59, 225, 1)),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1)))),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 8.0),
          TextFormField(
            controller: _usernameController,
            cursorColor: const Color.fromRGBO(107, 59, 225, 1),
            decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Color.fromRGBO(107, 59, 225, 1)),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1)))),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            controller: _passwordController,
            cursorColor: const Color.fromRGBO(107, 59, 225, 1),
            decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color.fromRGBO(107, 59, 225, 1)),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(107, 59, 225, 1)))),
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromRGBO(107, 59, 225, 1))),
            onPressed: () {
              // Add logic to save profile changes
              // You can access the edited values using the controllers
              Navigator.pop(context);
            },
            child: const Text('Save Changes'),
          ),
        ],
      )),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 59, 225, 1),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
            ),
            Text('Profile'),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Card(
                child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                      radius: 75,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                      backgroundColor: Color.fromRGBO(107, 59, 225, 1)),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Full Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 8.0),
                      Text('Email Address'),
                      SizedBox(height: 8.0),
                      Text('Phone Number'),
                      SizedBox(height: 8.0),
                      Text('Username'),
                    ],
                  ),
                ],
              ),
            )),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(107, 59, 225, 1))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEditPage()),
                );
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}
