import 'package:VESTNET3/screen/CPFormulirInvestasi.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../main.dart';

class CPDetailProyek extends StatefulWidget {
  @override
  CPDetailProyekState createState() => CPDetailProyekState();
}

class CPDetailProyekState extends State<CPDetailProyek> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight / 5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Nama Proyek', style: boldTextStyle(size: 18)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
              color: appStore.isDarkModeOn ? white : black),
          iconSize: 18,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image at the top
              Container(
                width: screenWidth,
                height: imageHeight,
                child: Image.asset('images/cp_card1.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 16),
          
              // Padding for the rest of the content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Address Text
                    Text(
                      'Kec. Sokaraja Kab. Banyumas',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
          
                    // Rows with space between
                    for (int i = 0; i < 6; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Label $i:', style: TextStyle(fontSize: 16)),
                          Text('Value $i', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    SizedBox(height: 16),
          
                    // Documentation Text
                    Text(
                      'Dokumentasi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
          
                    // Scrollable Row of images
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(5, (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16),
                            width: screenWidth / 2.5,
                            height: 2 * imageHeight / 3.5,
                            child: Image.asset('images/cp_card1.png', fit: BoxFit.cover),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 16),
          
                    // Centered Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle tap gesture here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CPFormulirInvestasi(),
                            ),
                          );
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
