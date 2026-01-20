import 'package:flutter/foundation.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';

class BatchApiModel {
  final String? id;
  final String batchName;
  final String? status;

  BatchApiModel({this.id, required this.batchName, this.status});

  // toJSON
  Map<String, dynamic> toJson() {
    return {"batchName": batchName};
  }

  // fromJSON
  factory BatchApiModel.fromJson(Map<String, dynamic> json) {
  try {
    final model = BatchApiModel(
      id: json['_id']?.toString(),
      batchName: json['batchName']?.toString() ?? 'UNKNOWN',
      status: json['status']?.toString(), // ✅ nullable-safe
    );

    debugPrint('✅ BatchApiModel parsed: id=${model.id}, name=${model.batchName}');
    return model;
  } catch (e, stack) {
    debugPrint('❌ BatchApiModel.fromJson FAILED');
    debugPrint('❌ Raw JSON: $json');
    debugPrint('❌ Error: $e');
    debugPrint('❌ Stack: $stack');
    rethrow;
  }
}


  // toEntity
  BatchEntity toEntity() {
    return BatchEntity(
      batchId: id,
      batchName: batchName,
      status: status,
    );
  }

  // fromEntity

  factory BatchApiModel.fromEntity(BatchEntity entity) {
    return BatchApiModel(batchName: entity.batchName);
  }

  // toEntityList
  static List<BatchEntity> toEntityList(List<BatchApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  // fromEntityList
}
