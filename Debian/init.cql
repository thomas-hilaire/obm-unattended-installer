CREATE KEYSPACE opush WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor': 1} ;
CREATE USER opush WITH PASSWORD 'opush' SUPERUSER;
