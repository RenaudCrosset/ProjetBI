{{ config(schema='prepared') }}

select distinct st."stop_id", st."stop_code", st.stop_lat , st.stop_lon ,sls."name" , sls."cluster" , slc.visible , slc.lat as cluster_lat, slc.lon as cluster_lon, sls.city
from {{ source('data', 'stops') }}  st
inner join {{ source('data', 'smmag_line_stops') }} sls on sls.code = st.stop_id
inner join {{ source('data', 'smmag_line_clusters') }} slc on slc.code = sls."cluster"
order by st."stop_id"