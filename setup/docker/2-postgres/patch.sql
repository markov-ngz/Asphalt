/**
* Patch TBM data as the id produced by the gtfs rt vehicle pos has route id 01,2,3,4
* When static data has data 1,2,3,4
*/


-- SELECT * 
-- FROM routes 
-- WHERE _source_transport='tbm' AND route_id in ('1','2','3','4','5','6','7','8','9') ;

UPDATE routes as r1
SET   
    route_id = CONCAT('0',route_id)
WHERE 
    r1._source_transport='tbm' 
    AND r1.route_id in ('1','2','3','4','5','6','7','8','9') ;
