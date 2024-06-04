import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keliling_pontianak/feature/select_flow/data/models/location_data_models.dart';

abstract class SelectDataSource {
  Future<List<LocationModels>> getData(String collection);
}

class SelectDataSourceImpl implements SelectDataSource {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<LocationModels>> getData(String collection) async {
    final CollectionReference reference =
        firebaseFirestore.collection(collection);

    final QuerySnapshot querySnapshot = await reference.get();

    final List<LocationModels> data = querySnapshot.docs
        .map(
          (e) => LocationModels.fromJson(e),
        )
        .toList();

    return data;
  }
}
