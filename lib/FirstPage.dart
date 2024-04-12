import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'GridAItems.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //carousel_slider Image List
  final List<String> _carouselSliderImages = [
    // "https://assets.blog.engoo.com/wp-content/uploads/sites/15/2023/06/09170105/image-12.png",
    // "https://media.snl.no/media/178025/standard_Grumpy_Cat.jpg",
    "https://images.unsplash.com/photo-1503014542219-851cf060c825?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1559416523-140ddc3d238c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dG95b3RhfGVufDB8fDB8fHww",
    "https://images.unsplash.com/flagged/photo-1564153296137-400b51e1ff6d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHRveW90YXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1659649713897-858f54ad348e?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  //비동기 문제로 로컬 이미지 업로드 테스트
  // final List<String> _carouselSliderImages = [
  //   "assets/images/gebaljaga.png",
  //   "assets/images/nyang.jpg",
  //   "assets/images/pepe.jpeg",
  //   "assets/images/systemexit.webp",
  //   "assets/images/wang.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CarouselSlider(
                  items: _carouselSliderImages.map((image) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(image, fit: BoxFit.cover),
                  )).toList(),
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
                      SizedBox(width: 12,),
                      ElevatedButton(
                        onPressed: null,
                        child: Text('Category2'),
                      ),
                      SizedBox(width: 12,),
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
                child: GridA(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridA extends StatelessWidget {
  GridA({
    super.key,
  });

  //GridView Item List with DTO
  final List<GridAitems> gridAItemList2= [
    GridAitems(id: "id", name: "name", price: "price", image: "imageSrc"),
    GridAitems(id: "id", name: "name", price: "price", image: "imageSrc"),
    GridAitems(id: "id", name: "name", price: "price", image: "imageSrc"),
  ];

//GridView Item List
  final List<Map<String, dynamic>> gridAItemList = [
    {
      "name": "Item1",
      "price": "100万円",
      "image":
      "https://images.unsplash.com/photo-1591439346108-fde5b9556865?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Item2",
      "price": "200万円",
      "image":
      "https://images.unsplash.com/photo-1619682817481-e994891cd1f5?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Item3",
      "price": "300万円",
      "image":
      "https://images.unsplash.com/photo-1613816493575-b180590d69a9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Item4",
      "price": "400万円",
      "image":
      "https://images.unsplash.com/photo-1606016159991-dfe4f2746ad5?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Item5",
      "price": "500万円",
      "image":
      "https://images.unsplash.com/photo-1579632091221-3347e201bc99?q=80&w=1915&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Item6",
      "price": "600万円",
      "image":
      "https://images.unsplash.com/photo-1587334096951-1523ecad29ed?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },{
      "name": "Item7",
      "price": "700万円",
      "image":
      "https://images.unsplash.com/photo-1525160354320-d8e92641c563?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },{
      "name": "Item8",
      "price": "800万円",
      "image":
      "https://images.unsplash.com/photo-1609630875171-b1321377ee65?q=80&w=1960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
  ];

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
      itemCount: gridAItemList.length,
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
                  child: Image.network(
                      gridAItemList[index]["image"],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                  ),
          ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      gridAItemList[index]["name"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(gridAItemList[index]["price"]),
                    const SizedBox(height: 2,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              CupertinoIcons.heart,
                            )
                        ),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              CupertinoIcons.cart,
                            )
                        )
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
