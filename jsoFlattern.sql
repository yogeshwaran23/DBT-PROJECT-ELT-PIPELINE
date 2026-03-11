{{ config(materialized='table') }}


select 
    f.value:city::String AS City,
    f.value:code::String AS Code,
    f.value:country::String AS Country,
    f.value:lat::String AS Lat,
    f.value:lon::String AS Lon,
    f.value:name::String AS Name
    from {{source('raw_data','WORLD_AIRPORT')}},
    LATERAL FLATTEN(input => VARIANT_COL:airports) f
