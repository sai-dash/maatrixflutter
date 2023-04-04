import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
   File? _imageFile;
   String? text;

   _captureImage() async {
    print("gfhhfjsdavhjf");
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      // The camera permission has already been granted
      // Open the camera here
      final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
      _imageFile = File(imageFile!.path);
      print(_imageFile.toString());
      setState(() {
        _imageFile = File(imageFile.path);
      });
    } else {
      cameraStatus = await Permission.camera.request();
      if (cameraStatus.isGranted) {
        // The camera permission has already been granted
        // Open the camera here
        final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
        _imageFile = File(imageFile!.path);
        print(_imageFile.toString());
        setState(() {
          _imageFile = File(imageFile.path);
        });
      }
      // The camera permission has not been granted yet
      // Request for the camera permission here
    }




  }
  final PageController _pageController = PageController(viewportFraction: 0.8);
  final List<String> _bannerImages = [
    'https://www.fugenx.com/wp-content/uploads/2018/10/ANDROID-APP-DEVELOPMENT-BANNER-FuGenX-8.jpg',
    'https://shop.amityinfosoft.com/wp-content/uploads/2022/02/android-category-banner-2022-1.webp',
    'https://esetghstore.com/image/catalog/banner_01.jpg',
    'https://eset.ws/Images/Mainbanner-GE-organic.jpg',
    'https://shop.amityinfosoft.com/wp-content/uploads/2020/03/eset-antivirus.jpg',
    'https://www.ht-dist.com/wp-content/uploads/2015/12/sg.en_.110.banner.jpg'
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: (){

            _showBottomSheet();          },
        ),
        title: Text('About My App'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/river.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(


          child: Padding(

            padding: EdgeInsets.all(16.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My App',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Version 1.0',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 16.0),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Author'),
                  subtitle: Text('John Doe'),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text('john.doe@example.com'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Copyright © 2022 My Company. All rights reserved.',
                  style: TextStyle(fontSize: 14.0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: SizedBox(height: 160,
                   child: PageView.builder(
                     controller: _pageController,
                     itemCount: _bannerImages.length,
                     itemBuilder: (BuildContext context, int index) {
                     return Padding(
                       padding: EdgeInsets.symmetric(horizontal: 8),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(8),
                         child: Image.network(_bannerImages[index], fit: BoxFit.cover),
                       ),
                     );
                   },)

                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _captureImage,
                      child: Text('Capture Image'),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      child: ClipOval(
                        child: _imageFile!=null?Image.file(_imageFile!):Image.network(_bannerImages[0]),
                      ),
                    )
                  ],
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
   void _showBottomSheet() {

     showModalBottomSheet(
       context: context,
       builder: (BuildContext context) {
         return Container(
           height: 100.0,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.only(
               topLeft: const Radius.circular(10.0),
               topRight: const Radius.circular(10.0),
             ),
           ),
           child: Stack(
             children: [
               Positioned.fill(
                 child: BackdropFilter(
                   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                   child: Container(color: Colors.transparent),
                 ),
               ),
               // Add your content here
             ],
           ),
         );
       },
     );
   }
}
