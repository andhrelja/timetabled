-- Display subjects and the sum of its points
SELECT subject.id, subject.name, SUM(points_total)
FROM activities_score_globalscoreactivity asg 
JOIN subjects_subject subject on asg.subject_id =subject.id
WHERE asg.subject_id in
(
	SELECT distinct ss.subject_id 
	FROM accounts_studentsubjects ss 
	JOIN subjects_subjectprograms ss3 on ss.subject_id=ss3.subject_id 
	JOIN subjects_subject ss2 on ss.subject_id =ss2.id 
	WHERE ss3.program_id =11
) --subject_ids
GROUP BY subject.id,subject.name;

-- Display users' activities for a specific subject
SELECT usr.username, subject.name, ass.points_accomplished , ass.points_total 
FROM accounts_student student 
JOIN auth_user usr on student.user_id =usr.id 
JOIN accounts_studentsubjects as3 on student.id =as3.student_id 
JOIN subjects_subject subject on as3.subject_id =subject.id 
LEFT JOIN activities_score_studentscoreactivity ass on ass.subject_id =subject.id and ass.student_id =student.id
WHERE subject.id=47;

SELECT *
FROM accounts_studentsubjects as2 
WHERE points_total > 100;

SELECT distinct
	asg.id,
	subject.name subject_name,
	asg.name activity_name, 
	asg.type,
	asg.due_date,
	asg.points_total ,
	CASE 
	    WHEN asg.type=0 THEN 'Kolokvij'
	    WHEN asg.type=1 THEN 'Završni ispit'
	    WHEN asg.type=2 THEN 'Seminar'
	    WHEN asg.type=3 THEN 'Prezentacija'
	    WHEN asg.type=4 THEN 'Domaća zadaća'
	    WHEN asg.type=5 THEN 'Samoprovjera'
	    WHEN asg.type=6 THEN 'Laboratorijske vježbe'
	    WHEN asg.type=7 THEN 'Rasprava'
	    WHEN asg.type=8 THEN 'Projekt'
	    WHEN asg.type=9 THEN 'Grupni rad'
	    WHEN asg.type=10 THEN 'Kviz'
	    WHEN asg.type=11 THEN 'Aktivnost'
	    WHEN asg.type=12 THEN 'Popravna aktivnost'
	    WHEN asg.type=13 THEN 'Ostalo'
	END type_display
--SELECT SUM(points_total)
FROM activities_score_globalscoreactivity asg 
JOIN subjects_subject subject on asg.subject_id =subject.id
WHERE asg.subject_id in
(
	SELECT distinct ss.subject_id 
	FROM accounts_studentsubjects ss 
	JOIN subjects_subjectprograms ss3 on ss.subject_id=ss3.subject_id 
	JOIN subjects_subject ss2 on ss.subject_id =ss2.id 
	WHERE ss3.program_id =11
) --subject_ids
and subject.id = 47
and asg.name <> CASE 
	    WHEN asg.type=0 THEN 'Kolokvij'
	    WHEN asg.type=1 THEN 'Završni ispit'
	    WHEN asg.type=2 THEN 'Seminar'
	    WHEN asg.type=3 THEN 'Prezentacija'
	    WHEN asg.type=4 THEN 'Domaća zadaća'
	    WHEN asg.type=5 THEN 'Samoprovjera'
	    WHEN asg.type=6 THEN 'Laboratorijske vježbe'
	    WHEN asg.type=7 THEN 'Rasprava'
	    WHEN asg.type=8 THEN 'Projekt'
	    WHEN asg.type=9 THEN 'Grupni rad'
	    WHEN asg.type=10 THEN 'Kviz'
	    WHEN asg.type=11 THEN 'Aktivnost'
	    WHEN asg.type=12 THEN 'Popravna aktivnost'
	    WHEN asg.type=13 THEN 'Ostalo'
	END
--and asg.subject_id = 35
--and asg.id in (666, 538)
;

delete FROM activities_score_globalscoreactivity WHERE id = 1084subject_id=47 and id<1000

SELECT * FROM activities_score_globalscoreactivity WHERE subject_id=47 and id<1000
SELECT * FROM subjects_subject ss WHERE id = 35;
