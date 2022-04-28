import 'package:dartz/dartz.dart';
import 'package:Malibu/data/failure.dart';
import 'package:Malibu/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
