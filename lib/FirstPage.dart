import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'FirebaseStoreService.dart';
import 'GridAItems.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();

  List<GridAitems> gridAitems = [];

  //페이지가 생성될 때 한번만 호출되는 함수
  @override
  void initState() {
    super.initState();
    updateGridAItems();
  }

  void updateGridAItems() async {
    List<GridAitems> gridAItems = await _firebaseStoreService.getGridAItems();
    setState(() {
      gridAitems = gridAItems;
    });
  }

  //carousel_slider Image List
  final List<String> _carouselSliderImages = [
    // "https://assets.blog.engoo.com/wp-content/uploads/sites/15/2023/06/09170105/image-12.png",
    // "https://media.snl.no/media/178025/standard_Grumpy_Cat.jpg",
    "https://images.unsplash.com/photo-1503014542219-851cf060c825?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1559416523-140ddc3d238c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dG95b3RhfGVufDB8fDB8fHww",
    "https://images.unsplash.com/flagged/photo-1564153296137-400b51e1ff6d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHRveW90YXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1659649713897-858f54ad348e?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _firebaseStoreService.addGridAItems(
            //샘플 데이터
            GridAitems(
              id: '4',
              name: 'New Item',
              price: '10000',
              image:
                  'https://images.unsplash.com/photo-1659649713897-858f54ad348e?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          );
          updateGridAItems();
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CarouselSlider(
                  items: _carouselSliderImages
                      .map((image) => ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(image, fit: BoxFit.cover),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    aspectRatio: 2.0,
                    initialPage: 0,
                  ),
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: null,
                        child: Text('Category1'),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text('Category2'),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text('Category3'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridA(gridAitems: gridAitems), // 여기에 gridAitems 리스트를 전달
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridA extends StatelessWidget {
  const GridA({super.key, required this.gridAitems});

  final List<GridAitems> gridAitems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 320, //그리드 아이템 박스 높이
      ),
      itemCount: gridAitems.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(gridAitems[index].image,
                    height: 200, width: double.infinity, fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/default_image.png', // 에러 발생 시 대체할 이미지
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      gridAitems[index].name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(gridAitems[index].price),
                    const SizedBox(
                      height: 2,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: null, // '좋아요' 기능 구현
                            icon: Icon(
                              CupertinoIcons.heart,
                            )),
                        IconButton(
                            onPressed: null, // '장바구니에 추가' 기능 구현
                            icon: Icon(
                              CupertinoIcons.cart,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
