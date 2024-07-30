import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../main.dart';

class CPFormulirInvestasi extends StatefulWidget {
  @override
  CPFormulirInvestasiState createState() => CPFormulirInvestasiState();
}

class CPFormulirInvestasiState extends State<CPFormulirInvestasi> {
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
    String dropdownValue1 = 'Option 1';
    String dropdownValue2 = 'Bank 1';
    bool agreeToTerms = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Formulir Investasi', style: boldTextStyle(size: 18)),
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown Form Field 1
            Text('Pilih Proyek'),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: dropdownValue1,
              icon: Icon(Icons.arrow_drop_down),
              decoration: InputDecoration(
                hintText: 'Proyek yang tersedia',
                border: OutlineInputBorder(),
              ),
              items: <String>[
                'Option 1',
                'Option 2',
                'Option 3',
                'Option 4',
                'Option 5'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue!;
                });
              },
            ),
            SizedBox(height: 16),

            // Nama Lengkap
            Text('Nama Lengkap'),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan nama lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Email dan Nomor Telepon
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nomor Telepon'),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan nomor telepon',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Dropdown Form Field 2 (Nama Bank)
            Text('Nama Bank'),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: dropdownValue2,
              icon: Icon(Icons.arrow_drop_down),
              decoration: InputDecoration(
                hintText: 'Pilih bank',
                border: OutlineInputBorder(),
              ),
              items: <String>['Bank 1', 'Bank 2', 'Bank 3', 'Bank 4', 'Bank 5']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue2 = newValue!;
                });
              },
            ),
            SizedBox(height: 16),

            // Nomor Rekening
            Text('Nomor Rekening'),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan nomor rekening',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Nama Pemilik Rekening
            Text('Nama Pemilik Rekening'),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan nama pemilik rekening',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Jumlah Investasi
            Text('Jumlah Investasi'),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan jumlah investasi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // NPWP dan Upload File
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NPWP'),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan NPWP',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upload File (JPG)'),
                      SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          // Handle file upload
                        },
                        child: Text('Pilih File'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Syarat dan Ketentuan\n\n'
              '1. Pengguna harus berusia minimal 18 tahun. Aplikasi ini hanya dapat digunakan oleh individu yang sudah dewasa dan mampu membuat keputusan keuangan sendiri.\n\n'
              '2. Semua investasi adalah final dan tidak ada jaminan keuntungan. Setelah melakukan investasi, dana tidak dapat ditarik kembali, dan VestNet tidak menjamin bahwa pengguna akan mendapatkan keuntungan dari investasi yang dilakukan.\n\n'
              '3. Informasi pribadi pengguna dilindungi sesuai Kebijakan Privasi. VestNet berkomitmen untuk menjaga kerahasiaan dan keamanan data pribadi pengguna sesuai dengan kebijakan privasi yang berlaku.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Checkbox with Text
            Row(
              children: [
                Checkbox(
                  value: agreeToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      agreeToTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Saya setuju dengan syarat dan ketentuan yang berlaku',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit
                },
                child: Text('Kirim'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
