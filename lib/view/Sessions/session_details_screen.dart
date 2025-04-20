import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/top_nav.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/view/Sessions/teeth_chart.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'المريض: تحسين التحسيني',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'نوع المعالجة: سحب عصب',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'تاريخ المعالجة: 22/4/2025',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'الوصف:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: cyan100,
              border: Border.all(
                color: cyan400,
                width: .45,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'قلع جراحي مع تخدير عام لأن المريض بموت اذا شاف نقطة دم :)'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: .5,
            width: double.infinity,
            color: cyan400,
          ),
          ImageGallery(
            imageUrls: [
              'https://traveltodentist.com/wp-content/uploads/2020/04/dinti-noi-zirconiu-ceramica.jpg',
              'https://traveltodentist.com/wp-content/uploads/2020/04/dinti-afectati-de-parodontoza-1.jpg',
              'https://traveltodentist.com/wp-content/uploads/2020/04/caz-clinic-inainte-si-dupa-tratament-parodontoza-moldova.jpg',
            ],
          )
        ],
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
                  width: widget.thumbnailSize,
                  height: widget.thumbnailSize,
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(
                            color: widget.selectedBorderColor,
                            width: 3,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(4),
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
