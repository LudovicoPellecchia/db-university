--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`, `students`.`degree_id`, 
	`degrees`.name
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.id = 53;

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.id
WHERE `level` = "magistrale";

--3.Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * 
FROM `course_teacher`
INNER JOIN `teachers`
ON `teacher_id` = `teachers`.`id`
WHERE `teacher_id` = 44;

--4.Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, 
		`degrees`.`name`, `degrees`.`id`
FROM `students`
INNER JOIN `degrees`
ON `degree_id`= `degrees`.`id`
ORDER BY `students`.`name` ASC, `students`.`surname` ASC;

--5.Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT *
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `course_teacher`.*, 
		`courses`.`name`, `courses`.`period`, `courses`.`description`, 
        `degrees`.`name`,
        `departments`.`name`,
        `teachers`.`name`, `teachers`.`surname`
FROM `course_teacher` 
JOIN `courses`
ON `courses`.`id` = `course_id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` LIKE "%Matematica%";

-- Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo
SELECT `students`.*, COUNT(`exam_student`.`exam_id`), MAX(`exam_student`.`vote`)
FROM `students`
INNER JOIN `exam_student`
	ON `students`. `id` = `exam_student`.`student_id`
INNER JOIN `exams`
	ON `exams`.`id` = `exam_student`. `exam_id`
GROUP BY `students`.`id`, `exams`.`course_id`



--1 Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id), YEAR (`enrolment_date`)
FROM `students`
GROUP BY YEAR(`enrolment_date`);

--Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(`teachers`.`id`), `office_address`
FROM `teachers`
GROUP BY `office_address`;


--Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, COUNT(*), AVG(`vote`)
FROM `exam_student`
GROUP BY `exam_id`

--Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `departement_id`, COUNT()
FROM `degrees`
GROUP BY `departement_id`

