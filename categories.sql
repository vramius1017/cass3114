create keyspace inca with replication = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 3
    } and durable_writes = true;

create table categories
(
    name text,
    code int,
    id   int,
    nb   int,
    primary key (name, code)
)
    with comment = 'categories INM  ontologie Plateforme CEPS';


use inca;

insert into categories (id,name,code,nb) values (1,'Psychological Health Interventions',1,5);
insert into categories (id,name,code,nb) values (2,'Physical Health Interventions',2,5);
insert into categories (id,name,code,nb) values (3,'Nutritional Health Interventions',3,2);
insert into categories (id,name,code,nb) values (4,'Digital Health Interventions',4,5);
insert into categories (id,name,code,nb) values (5,'Others Health Interventions',5,5);





select * from categories ;

//delete from categories where code = 3 and name = 'Psychological Health Interventions';

create table scat_by_cat
(
    id       int,
    scatcode int,
    scatname text,
    catcode  int,
    catname  text,
    primary key ((scatname, catname), scatcode)
) with clustering order by (scatcode desc);

//COPY inca.scat_by_cat(id,scatcode,scatname,catcode,catname) FROM 'C:/cassandra/scat_cat_v10.csv' WITH delimiter = ';' AND HEADER =
// TRUE ;

select * from scat_by_cat;

insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (1,5,'Thermalism programs',2,'Physical Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (4,1,'Physical activity programs',2,'Physical Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (6,3,'Physiotherapies',2,'Physical Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (7,4,'Manual therapy',2,'Physical Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (16,2,'Hortitherapy',2,'Physical Health Interventions');


insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (12,1,'Art therapies',1,'Psychological Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (13,2,'Prevention programs',1,'Psychological Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (14,3,'Psychotherapy intervention',1,'Psychological Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (15,5,'therapies assist by animal',1,'Psychological Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (20,4,'Psycho-physical practices',1,'Psychological Health Interventions');

insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (17,1,'Supplementary food products',3,'Nutritional Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (18,2,'Diet interventions',3,'Nutritional Health Interventions');

insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (3,2,'Video games therapies',4,'Digital Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (9,1,'health wearable and handled devices',4,'Digital Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (19,3,'Virtual reality therapies',4,'Digital Health Interventions');

insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (2,5,'Cosmeceuticals',5,'Others Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (5,4,'Electromagnetic methods',5,'Others Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (8,1,'Mineral preparations',5,'Others Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (10,3,'Botanical preparations',5,'Others Health Interventions');
insert into scat_by_cat (id,scatcode,scatname,catcode,catname) values (2,5,'Mycological preparations',5,'Others Health Interventions');

// truncate table scat_by_cat;