select count(st_id)
from student
where st_dept='physics' or st_dept='electrical engineering'
group by st_type
-- to find total number of students at physics or electrical engineering department and group total numbers for bachelor and master students seperately


select AVG(gpa)
from student
where st_type='m' and st_dept='sociology'
-- to find average gpa of master students at sociology department

select s.research_area
from student s
where s.st_id IN (
	select m.st_id
	from member m
	where m.club_name='chess')
-- to find research areas of students who are member of chess club 