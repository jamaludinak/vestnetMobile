import 'package:VESTNET3/screen/CPDetailProyek.dart';
import 'package:VESTNET3/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../screen/CPMyWalletScreen.dart';
import '../utils/CPImages.dart';

class CPPortofolioScreen extends StatefulWidget {
  @override
  CPPortofolioScreenState createState() => CPPortofolioScreenState();
}

class CPPortofolioScreenState extends State<CPPortofolioScreen> {
  int tradIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
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
        title: Text("Portofolio",
            style: boldTextStyle(size: 18)),
        centerTitle: false,
        backgroundColor: context.cardColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(cp_frameCard),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Total Investasi Anda",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xfffffcfc),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            CPMyWalletScreen().launch(context,
                                pageRouteAnimation: PageRouteAnimation.Scale);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.history,
                                color: Color(0xffffffff),
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Riwayat",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Rp 50.000.000", // Remove the extra backslash
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Penghasilan",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xfffffcfc),
                          ),
                        ),
                        Text(
                          "Return",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xfffffcfc),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp 50.000.000",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          child: Text(
                            "40%",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            12.height,
            // Container(
            //   margin: EdgeInsets.all(16),
            //   padding: EdgeInsets.all(8),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(cp_frameCard),
            //       fit: BoxFit.cover,
            //     ),
            //     shape: BoxShape.rectangle,
            //     borderRadius: BorderRadius.circular(16.0),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.all(16),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisSize: MainAxisSize.max,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             Text(
            //               "Tagihan Internet",
            //               textAlign: TextAlign.start,
            //               overflow: TextOverflow.clip,
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w400,
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 14,
            //                 color: Color(0xfffffcfc),
            //               ),
            //             ),
            //             GestureDetector(
            //                 onTap: () {
            //                   CPMyWalletScreen().launch(context,
            //                       pageRouteAnimation: PageRouteAnimation.Scale);
            //                 },
            //                 child: Text(
            //                   "Penggunaan Bulan Ini",
            //                   style: TextStyle(
            //                     color: Color(0xffffffff),
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w400,
            //                   ),
            //                 )),
            //           ],
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             Text(
            //               "Rp 166.500", // Remove the extra backslash
            //               textAlign: TextAlign.start,
            //               overflow: TextOverflow.clip,
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w800,
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 18,
            //                 color: Color(0xffffffff),
            //               ),
            //             ),
            //             Text(
            //               "56 GB", // Remove the extra backslash
            //               textAlign: TextAlign.start,
            //               overflow: TextOverflow.clip,
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w800,
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 18,
            //                 color: Color(0xffffffff),
            //               ),
            //             ),
            //           ],
            //         ),
            //         Text(
            //           "Sudah Dibayar",
            //           style: TextStyle(
            //             fontWeight: FontWeight.w700,
            //             fontStyle: FontStyle.normal,
            //             fontSize: 14,
            //             color: Colors.green,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Daftar Proyek Yang Didukung",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                  // Text(
                  //   "Lihat Semua",
                  //   textAlign: TextAlign.start,
                  //   overflow: TextOverflow.clip,
                  //   style: TextStyle(
                  //     color: greenColor,
                  //     fontWeight: FontWeight.w500,
                  //     fontStyle: FontStyle.normal,
                  //     fontSize: 12,
                  //   ),
                  // )
                ],
              ),
            ),
            8.height,
            // Use ListView.builder to handle dynamic heights
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
            12.height,
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    "Daftar Proyek Yang Didukung",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                  // Text(
                  //   "Lihat Semua",
                  //   textAlign: TextAlign.start,
                  //   overflow: TextOverflow.clip,
                  //   style: TextStyle(
                  //     color: greenColor,
                  //     fontWeight: FontWeight.w500,
                  //     fontStyle: FontStyle.normal,
                  //     fontSize: 12,
                  //   ),
                  // )              
            ),
            
          ],
        ),
      ),
    );
  }
}
