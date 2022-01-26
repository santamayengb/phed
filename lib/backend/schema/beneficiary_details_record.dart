import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'beneficiary_details_record.g.dart';

abstract class BeneficiaryDetailsRecord
    implements
        Built<BeneficiaryDetailsRecord, BeneficiaryDetailsRecordBuilder> {
  static Serializer<BeneficiaryDetailsRecord> get serializer =>
      _$beneficiaryDetailsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get addres;

  @nullable
  String get gender;

  @nullable
  BuiltList<String> get photos;

  @nullable
  @BuiltValueField(wireName: 'father_name')
  String get fatherName;

  @nullable
  String get schem;

  @nullable
  BuiltList<String> get image;

  @nullable
  LatLng get getLocation;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BeneficiaryDetailsRecordBuilder builder) =>
      builder
        ..name = ''
        ..addres = ''
        ..gender = ''
        ..photos = ListBuilder()
        ..fatherName = ''
        ..schem = ''
        ..image = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('beneficiary_details');

  static Stream<BeneficiaryDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BeneficiaryDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BeneficiaryDetailsRecord._();
  factory BeneficiaryDetailsRecord(
          [void Function(BeneficiaryDetailsRecordBuilder) updates]) =
      _$BeneficiaryDetailsRecord;

  static BeneficiaryDetailsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBeneficiaryDetailsRecordData({
  String name,
  String addres,
  String gender,
  String fatherName,
  String schem,
  LatLng getLocation,
}) =>
    serializers.toFirestore(
        BeneficiaryDetailsRecord.serializer,
        BeneficiaryDetailsRecord((b) => b
          ..name = name
          ..addres = addres
          ..gender = gender
          ..photos = null
          ..fatherName = fatherName
          ..schem = schem
          ..image = null
          ..getLocation = getLocation));
