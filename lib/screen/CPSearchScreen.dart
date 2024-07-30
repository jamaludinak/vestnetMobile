import 'package:VESTNET3/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'CPDetailProyek.dart';

class CPSearchScreen extends StatefulWidget {
  @override
  CPSearchScreenState createState() => CPSearchScreenState();
}

class CPSearchScreenState extends State<CPSearchScreen> {

  TextEditingController searchController = TextEditingController();

  int tradIndex = 0;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Pencarian",
          style: TextStyle(
            fontSize: 18,
            fontWeight:
                FontWeight.bold, // Mengatur ketebalan teks menjadi sangat tebal
          ),
        ),
        centerTitle: false,
        backgroundColor: context.cardColor,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0x00000000), width: 1)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: searchController,
                obscureText: false,
                onSubmitted: (val) {
                },
                textAlign: TextAlign.left,
                maxLines: 1,
                style: primaryTextStyle(size: 14),
                decoration: CustomInputDecoration.getDecoration(
                        hintText: "Cari Proyek Investasi")
                    .copyWith(
                  prefixIcon: Icon(Icons.search_sharp),
                  filled: true,
                  fillColor: Color(0xFFF2F2F2),
                ),
              ),
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: MaterialButton(
                    onPressed: () {
                      //
                    },
                    color: Color(0xff1e8c45),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      "Kab. Banyumas",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal),
                    ),
                    textColor: Color(0xffffffff),
                    height: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: MaterialButton(
                    onPressed: () {
                      //
                    },
                    color: Color(0xff1e8c45),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      "Kab. Purbalingga",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal),
                    ),
                    textColor: Color(0xffffffff),
                    height: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: MaterialButton(
                    onPressed: () {
                      //
                    },
                    color: Color(0xff1e8c45),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      "Kab. Cilacap",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal),
                    ),
                    textColor: Color(0xffffffff),
                    height: 40,
                  ),
                ),
              ],
            ),
            8.height,
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text("Baru saja dilihat", style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal),)
            ),
            8.height,
            Container(
              // Remove fixed height
              child: ListView.builder(
                shrinkWrap:
                    true, // Allows the ListView to take up only as much space as needed
                physics:
                    NeverScrollableScrollPhysics(), // Prevents ListView from scrolling independently
                itemCount: 6, // Update with the number of ProjectCard items
                itemBuilder: (context, index) {
                  // Replace with actual data source
                  return GestureDetector(
                    onTap: () {
                      // Handle tap gesture here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CPDetailProyek(),
                        ),
                      );
                      // You can also navigate to a new screen or perform other actions here
                    },
                    child: ProjectCard(
                      photo:
                          Image.asset('images/cp_card1.png', fit: BoxFit.cover),
                      title:
                          'Pengembangan Infrastruktur Internet Desa ${index % 2 == 0 ? 'Karangnanas' : 'Karangrau'}',
                      location: index % 2 == 0
                          ? 'Jakarta, Indonesia'
                          : 'Bandung, Indonesia',
                      collectedAmount: 1500000.00,
                      targetAmount: 2000000.00,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
