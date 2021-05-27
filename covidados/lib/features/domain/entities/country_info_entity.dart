import 'package:equatable/equatable.dart';

abstract class CountryInfo extends Equatable {
  final String iso2;
  final int lat;
  final int long;
  final String flag;

  CountryInfo({
    required this.iso2,
    required this.lat,
    required this.long,
    required this.flag,
  });

  @override
  List<Object?> get props => [iso2, lat, long, flag];

  Map<String, dynamic> toMap();
}
