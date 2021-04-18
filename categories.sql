// keyspace cassandra pour la selection de la categorie et de la sous categorie d'INM
// creation du keyspace inca  replication 3 en single node version cassandra  3.11.10  conteneur dockeur cass3114
create keyspace inca with replication = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 3
    } and durable_writes = true;

//table des categories d'INM
create table categories
(
    name text,
    code int,
    id   int,
    nb   int,
    primary key (name)
)
    with comment = 'categories INM  ontologie Plateforme CEPS';

// requestes d'insertion des categories d'INM
use inca;

insert into categories (id,name,code,nb) values (1,'Psychological Health Interventions',1,5);
insert into categories (id,name,code,nb) values (2,'Physical Health Interventions',2,5);
insert into categories (id,name,code,nb) values (3,'Nutritional Health Interventions',3,2);
insert into categories (id,name,code,nb) values (4,'Digital Health Interventions',4,5);
insert into categories (id,name,code,nb) values (5,'Others Health Interventions',5,5);


select * from categories ;
//test query app
select name from categories;

//delete from categories where code = 3 and name = 'Psychological Health Interventions';




// creation de la table des sous categories d'INM
create table scat_by_cat
(
    id       int,
    scatcode int,
    scatname text,
    catcode  int,
    catname  text,
    primary key ((catname), scatname,scatcode)
) with clustering order by (scatname DESC,scatcode ASC);

//COPY inca.scat_by_cat(id,scatcode,scatname,catcode,catname) FROM 'C:/cassandra/scat_cat_v10.csv' WITH delimiter = ';' AND HEADER =
// TRUE ;

select * from scat_by_cat;
// test query app
select scatname from scat_by_cat where catname = 'Digital Health Interventions';


// requêtes d'insertion des sous-categoriesd'INM
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

create table neoplasms (id uuid,
    desease text,
    name text,
    class varchar,
    labels text,
    primary key((desease), name)
) with clustering order by (name DESC);

create table covid19(
    id uuid,
    desease text,
    name text,
    class varchar,
    labels text,
    primary key((desease), name)
) with clustering order by (name DESC);





create table elders_pats (id uuid,
    desease text,
    name text,
    class varchar,
    labels text,
    primary key((desease), name)
) with clustering order by (name DESC);

create table diabetes (id uuid,
    desease text,
    name text,
    class varchar,
    labels text,
    primary key((desease), name)
) with clustering order by (name DESC);

create table deseases
(
    id          uuid,
    name        text,
    class       text,
    description text,
    primary key (name)
);

select * from deseases;

// test query app
select name from deseases ;

//truncate table deseases ;
insert into deseases (id,name,class,description) values (uuid(),'Neoplasms','Mesh Ontology based http://purl.bioontology.org/ontology/MESH/D009369 ','degenerative cells desease');
insert into deseases (id,name,class,description) values (uuid(),'Covid19','Mesh Ontology based http://purl.bioontology.org/ontology/MESH/D000086402','SARS-COV-2 corona virus infection');
insert into deseases (id,name,class,description) values (uuid(),'Elder pats','Plateforme CEPS Ontology ','elders people affections and deseases');
insert into deseases (id,name,class,description) values (uuid(),'Diabetes','Mesh Ontology based http://purl.bioontology.org/ontology/MESH/D003920 ','diabetes mellitus glucose metabolism desorders');


create table DB (
id int,
name text,
primary key (name)
);

insert into DB(id,name) values (1,'Cochrane');
insert into DB(id,name) values (2,'Springer');
insert into DB(id,name) values (3,'Elsevier');
// insert into DBType(id,name) values (4,'Core.uk');  fonctionnalité  à faire niveau selection proposition validation
// test query app
select name from DB;

create table trial_design (
    id int,
    design text,
    primary key (design)
);

insert into trial_design (id,design) values (1,'randomized controlled trial');
insert into trial_design (id,design) values (1,'clinical trial');
insert into trial_design (id,design) values (1,'controlled trial');

// test query app

select design from trial_design;


create table study_by_db (
    id int,
    db text,
    term  text,
    study text,
    primary key ((db), study)
);

insert into study_by_db (id,db,term,study) values (1,'Cochrane','CDSR','meta-analysis');
insert into study_by_db (id,db,term,study) values (2,'Springer','Springer and meta-analysis','meta-analysis');
insert into study_by_db (id,db,term,study) values (3,'Springer','Springer and trial','trials');
insert into study_by_db (id,db,term,study) values (4,'Elsevier','Elsevier and meta-analysis','meta-analysis');


select term from study_by_db where db ='Cochrane';
select term from study_by_db where db ='Springer';
select term from study_by_db where db ='Elsevier';

select study from study_by_db where db ='Cochrane';
select study from study_by_db where db ='Springer';
select study from study_by_db where db ='Elsevier';