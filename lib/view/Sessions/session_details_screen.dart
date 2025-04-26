import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/Sessions/components/teeth_chart.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: cyan100, borderRadius: BorderRadius.circular(30)),
                height: MediaQuery.of(context).size.height / 2.9,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'اسماعيل احمد كنباوي',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: cyan600,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'اسم المريض',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: cyan400,
                          height: .5,
                          width: 250,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'تاريخ المعالجة',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '22/4/2025',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: cyan600,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Container(
                              color: cyan400,
                              width: .5,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'نوع المعالجة',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'سحب عصب',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: cyan600,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: cyan400,
                          height: .5,
                          width: 250,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الوصف',
                                style: TextStyle(fontSize: 16, color: cyan600),
                              ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي سحب عصب مع تخدير موضعي',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: cyan100, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ImageGallery(
                    imageUrls: [
                      'https://traveltodentist.com/wp-content/uploads/2020/04/dinti-noi-zirconiu-ceramica.jpg',
                      'https://traveltodentist.com/wp-content/uploads/2020/04/dinti-afectati-de-parodontoza-1.jpg',
                      'https://traveltodentist.com/wp-content/uploads/2020/04/caz-clinic-inainte-si-dupa-tratament-parodontoza-moldova.jpg',
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageGallery extends StatefulWidget {
  final List<String> imageUrls;
  final double mainImageHeight;
  final double thumbnailSize;
  final double thumbnailSpacing;
  final Color selectedBorderColor;

  const ImageGallery({
    Key? key,
    required this.imageUrls,
    this.mainImageHeight = 300,
    this.thumbnailSize = 60,
    this.thumbnailSpacing = 8,
    this.selectedBorderColor = Colors.blue,
  }) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Main image display
        Container(
          height: widget.mainImageHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.network(
              widget.imageUrls[_selectedIndex],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Thumbnail list
        SizedBox(
          height: widget.thumbnailSize + 8, // Extra space for border
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.imageUrls.length,
            separatorBuilder: (context, index) =>
                SizedBox(width: widget.thumbnailSpacing),
            itemBuilder: (context, index) {
              final isSelected = index == _selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: widget.thumbnailSize,
                  height: widget.thumbnailSize,
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(
                            color: widget.selectedBorderColor,
                            width: 3,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.network(
                      widget.imageUrls[index],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
