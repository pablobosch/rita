-- Para convertir de texto a enteros
CREATE OR REPLACE FUNCTION convert_to_integer(v_input text)
RETURNS INTEGER AS $$
DECLARE v_int_value INTEGER DEFAULT NULL;
BEGIN
    BEGIN
        v_int_value := v_input::INTEGER;
    EXCEPTION WHEN OTHERS THEN
--        RAISE NOTICE 'Invalid integer value: "%".  Returning NULL.', v_input;
        RETURN NULL;
    END;
RETURN v_int_value;
END;
$$ LANGUAGE plpgsql;

-- Si es 'NA' devuelve NULL, si no, el valor de la variable
-- INSERT INTO clean.rita(
-- 	SELECT
-- 	(year || '-' || month || '-' || dayofmonth)::date AS FlightDate,
-- 	CASE WHEN DayOfWeek = 'NA' THEN NULL ELSE convert_to_integer(DayOfWeek) END AS DayOfWeek,
-- 	CASE WHEN DepTime = 'NA' THEN NULL ELSE convert_to_integer(DepTime) END AS DepTime,
-- 	CASE WHEN CRSDepTime = 'NA' THEN NULL ELSE convert_to_integer(CRSDepTime) END AS CRSDepTime,
-- 	CASE WHEN ArrTime = 'NA' THEN NULL ELSE convert_to_integer(ArrTime) END AS ArrTime,
-- 	CASE WHEN CRSArrTime = 'NA' THEN NULL ELSE convert_to_integer(CRSArrTime) END AS CRSArrTime,
-- 	CASE WHEN UniqueCarrier = 'NA' THEN NULL ELSE UniqueCarrier END AS UniqueCarrier,
-- 	CASE WHEN FlightNum = 'NA' THEN NULL ELSE convert_to_integer(FlightNum) END AS FlightNum,
-- 	CASE WHEN TailNum = 'NA' THEN NULL ELSE TailNum END AS TailNum,
-- 	CASE WHEN ActualElapsedTime = 'NA' THEN NULL ELSE convert_to_integer(ActualElapsedTime) END AS ActualElapsedTime,
-- 	CASE WHEN CRSElapsedTime = 'NA' THEN NULL ELSE convert_to_integer(CRSElapsedTime) END AS CRSElapsedTime,
-- 	CASE WHEN AirTime = 'NA' THEN NULL ELSE convert_to_integer(AirTime) END AS AirTime,
-- 	CASE WHEN ArrDelay = 'NA' THEN NULL ELSE convert_to_integer(ArrDelay) END AS ArrDelay,
-- 	CASE WHEN DepDelay = 'NA' THEN NULL ELSE convert_to_integer(DepDelay) END AS DepDelay,
-- 	CASE WHEN Origin = 'NA' THEN NULL ELSE Origin END AS Origin,
-- 	CASE WHEN Dest = 'NA' THEN NULL ELSE Dest END AS Dest,
-- 	CASE WHEN Distance = 'NA' THEN NULL ELSE convert_to_integer(Distance) END AS Distance,
-- 	CASE WHEN TaxiIn = 'NA' THEN NULL ELSE convert_to_integer(TaxiIn) END AS TaxiIn,
-- 	CASE WHEN TaxiOut = 'NA' THEN NULL ELSE convert_to_integer(TaxiOut) END AS TaxiOut,
-- 	CASE WHEN Cancelled = 'NA' THEN NULL ELSE convert_to_integer(Cancelled) END AS Cancelled,
-- 	CASE WHEN CancellationCode = 'NA' THEN NULL ELSE CancellationCode END AS CancellationCode,
-- 	CASE WHEN Diverted = 'NA' THEN NULL ELSE convert_to_integer(Diverted) END AS Diverted,
-- 	CASE WHEN CarrierDelay = 'NA' THEN NULL ELSE convert_to_integer(CarrierDelay) END AS CarrierDelay,
-- 	CASE WHEN WeatherDelay = 'NA' THEN NULL ELSE convert_to_integer(WeatherDelay) END AS WeatherDelay,
-- 	CASE WHEN NASDelay = 'NA' THEN NULL ELSE convert_to_integer(NASDelay) END AS NASDelay,
-- 	CASE WHEN SecurityDelay = 'NA' THEN NULL ELSE convert_to_integer(SecurityDelay) END AS SecurityDelay,
-- 	CASE WHEN LateAircraftDelay = 'NA' THEN NULL ELSE convert_to_integer(LateAircraftDelay) END AS LateAircraftDelay
-- FROM dirty.rita
-- );

-- Me ahorro la búsqueda de los NA con la función convert_to_integer
INSERT INTO clean.rita(
	SELECT
	(year || '-' || month || '-' || dayofmonth)::date AS FlightDate,
	convert_to_integer(DayOfWeek) END AS DayOfWeek,
	convert_to_integer(DepTime) END AS DepTime,
	convert_to_integer(CRSDepTime) END AS CRSDepTime,
	convert_to_integer(ArrTime) END AS ArrTime,
	convert_to_integer(CRSArrTime) END AS CRSArrTime,
	CASE WHEN UniqueCarrier = 'NA' THEN NULL ELSE UniqueCarrier END AS UniqueCarrier,
	convert_to_integer(FlightNum) END AS FlightNum,
	CASE WHEN TailNum = 'NA' THEN NULL ELSE TailNum END AS TailNum,
	convert_to_integer(ActualElapsedTime) END AS ActualElapsedTime,
	convert_to_integer(CRSElapsedTime) END AS CRSElapsedTime,
	convert_to_integer(AirTime) END AS AirTime,
	convert_to_integer(ArrDelay) END AS ArrDelay,
	convert_to_integer(DepDelay) END AS DepDelay,
	CASE WHEN Origin = 'NA' THEN NULL ELSE Origin END AS Origin,
	CASE WHEN Dest = 'NA' THEN NULL ELSE Dest END AS Dest,
	convert_to_integer(Distance) END AS Distance,
	convert_to_integer(TaxiIn) END AS TaxiIn,
	convert_to_integer(TaxiOut) END AS TaxiOut,
	convert_to_integer(Cancelled) END AS Cancelled,
	CASE WHEN CancellationCode = 'NA' THEN NULL ELSE CancellationCode END AS CancellationCode,
	convert_to_integer(Diverted) END AS Diverted,
	convert_to_integer(CarrierDelay) END AS CarrierDelay,
	convert_to_integer(WeatherDelay) END AS WeatherDelay,
	convert_to_integer(NASDelay) END AS NASDelay,
	convert_to_integer(SecurityDelay) END AS SecurityDelay,
	convert_to_integer(LateAircraftDelay) END AS LateAircraftDelay
FROM dirty.rita
);
