import 'package:flutter/material.dart';
import '../../providers/const.dart';
import '../../common/player/player.dart';
import './categoryButton.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  static const categoryTextList = [
    'Hành Động',
    'Tình Cảm',
    'Hài Hước',
    'Cổ Trang',
    'Tâm Lý',
    'Hình Sự',
    'Chiến Tranh',
    'Võ Thuật',
    'Viễn Tưởng',
    'Phiêu Lưu',
    'Khoa Học',
    'Kinh Dị',
    ' Âm Nhạc',
    'Thần Thoại',
    'Tài Liệu',
    'Gia Đình',
    'Chính Kịch',
    'Bí Ẩn',
    'Học Đường',
    'Kinh điển'
  ];
  static const categoryPathList = [
    'hanh-dong',
    'tinh-cam',
    'hai-huoc',
    'co-trang',
    'tam-ly',
    'hinh-su',
    'chien-tranh',
    'vo-thuat',
    'vien-tuong',
    'phieu-luu',
    'khoa-hoc',
    'kinh-di',
    'am-nhac',
    'than-hoai',
    'tai-lieu',
    'gia-dinh',
    'chinh-kich',
    'bi-an',
    'hoc-duong',
    'kinh-dien'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: Const.screenWidth,
      height: Const.screenHeight,
      child: ListView(
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              for (var e in categoryTextList)
                CategoryButton(e, categoryPathList[categoryTextList.indexOf(e)])
            ],
          )
        ],
      ),
    );
  }
}
