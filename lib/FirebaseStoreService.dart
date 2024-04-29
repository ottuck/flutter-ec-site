import 'package:cloud_firestore/cloud_firestore.dart';

import 'GridAItems.dart';

class FirebaseStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //FireStore에서 GridAItems 컬렉션의 모든 문서를 가져오는 함수 json 데이터를 GridAItems 객체로 변환
  Future<List<GridAitems>> getGridAItems() async {
    List<GridAitems> gridAItems = [];
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('GridAItems').get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        gridAItems.add(GridAitems.fromJson(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
    return gridAItems;
  }

// FireStore 에 GridAItems 을 추가하는 함수
  Future<void> addGridAItems(GridAitems gridAitems) async {
    try {
      await _firestore.collection('GridAItems').add(gridAitems.toJson());
      print('GridAItems added to FireStore');
    } catch (e) {
      print(e);
    }
  }
}
