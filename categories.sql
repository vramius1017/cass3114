create keyspace inca with replication = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 3
    } and durable_writes = true;

insert into categories (id,name,code,nb) values (1,'Psychological Health Interventions',1,5);
insert into categories (id,name,code,nb) values (2,'Physical Health Interventions',2,5);
insert into categories (id,name,code,nb) values (3,'Nutritional Health Interventions',3,2);
insert into categories (id,name,code,nb) values (4,'Digital Health Interventions',4,5);
insert into categories (id,name,code,nb) values (5,'Others Health Interventions',5,5);


select * from categories ;

//delete from categories where code = 3 and name = 'Psychological Health Interventions';

