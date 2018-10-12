/* 1 */
create user AdminHopital identified by ADHOP;

/* 2 */
/* Connecter autant que 'AdminHopital'*/

/* 3 */
 grant  create session to adminhopital ;

/* 4 */ 
grant create table to adminhopital;
alter user adminhopital Default Tablespace HOPITAL_TBS
Temporary Tablespace HOPITAL_TempTBS;
create table test (test varchar(20));

grant create user to adminhopital;
create user test identified by test;

/* 5 */
select * from dbahopital.employe;

/* 6 */
grant select on employe to adminhopital;
select * from dbahopital.employe;

/* 7+8 */
grant update on employe to adminhopital;

update dbahopital.employe set 
adresse_emp ='152,rue hassiba' where nom_emp='ABDELMOUMEN' and prenom_emp='NASSIMA';

/* 9 */
create index EMPLOYENOM_IX on dbahopital.employe (nom_emp);

/* 10 */
grant index on employe to adminhopital;
create index EMPLOYENOM_IX on dbahopital.employe (nom_emp);

/* 11 */
revoke  create table from adminhopital;
revoke  create user from adminhopital;
revoke  select on employe from adminhopital;
revoke  update on employe from adminhopital;
revoke  index on employe from adminhopital;

/* 12 */
create user test identified by test;
create table test (test varchar(20));	
select * from dbahopital.employe;
update dbahopital.employe set
	adresse_emp ='152,rue hassiba' where nom_emp='ABDELMOUMEN' and prenom_emp='NASSIMA';
create index EMPLOYENOM_IX on dbahopital.employe (nom_emp);
	
/* 13 */
create profile Admin_profil limit 
sessions_per_user 4
cpu_per_call 4000
connect_time 50
logical_reads_per_call 1500
private_sga 20k
idle_time 30
failed_login_attempts 3
password_life_time 60
password_reuse_time 40
password_reuse_max unlimited
password_lock_time 1
password_grace_time 5;

/* 14 */
alter user adminhopital profile admin_profil;

/* 15 */
create role GestionnairePatient;
grant select on patient to GestionnairePatient;
grant select,update on hospitalisation to GestionnairePatient;
grant select on soigne to GestionnairePatient;

/* 16 */
grant GestionnairePatient to adminhopital;
select * from  dbahopital.patient;
select * from  dbahopital.hospitalisation;
select * from  dbahopital.soigne;

/* FIN */