import 'dart:io';

import 'package:Malibu/data/datasources/remote_data_source.dart';
import 'package:Malibu/data/exception.dart';
import 'package:Malibu/domain/entities/weather.dart';
import 'package:Malibu/data/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:Malibu/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
