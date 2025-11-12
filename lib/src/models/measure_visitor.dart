import 'package:heart/heart.dart';

abstract class IMeasureVisitor<T> {
  T visitRiveMeasure(RiveMeasure measure);

  T visitEruhTalking(EruhTalkingMeasure value);

  T visitWorldMap(WorldMapMeasure value);

  T visitBoatTrip(BoatTripMeasure value);

  T visitBoatStart(BoatStartMeasure value);
}
