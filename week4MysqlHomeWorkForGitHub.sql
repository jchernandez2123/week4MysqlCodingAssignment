-- #1 THIS CREATES A PROCEDURE THAT TRACKS ALL OF THE MALE EMPLOYEES 
DROP PROCEDURE IF EXISTS gender_male;

DELIMITER //
CREATE PROCEDURE gender_male()
BEGIN 
SELECT * FROM employees
WHERE gender = 'M';
END// 

CALL gender_male(); 

-- #2 THIS CREATES A PROCEDURE THAT GIVES ME ALL OF THE MALE EMPLOYEES WHOS BIRTHDAY IS IN APRIL 1ST 1987
DROP PROCEDURE IF EXISTS gender_male_birthday;

DELIMITER //
CREATE PROCEDURE gender_male_birthday ()
BEGIN
SET @birth := "1987-04-01";
SELECT * FROM employees
WHERE gender ='M' AND birth_date = @birthDate;
END //

CALL gender_male_birthday(); 

-- #3 THIS PROCEDURE CREATES A MAXIMUM SALARY FOR A EMPLOYEE BY THE TITLE
DROP PROCEDURE IF EXISTS maxSalaryOfEmployeeByTitle;

DELIMITER //
CREATE PROCEDURE maxSalaryOfEmployeeByTitle (
	IN employeeeTitles VARCHAR(321),
    OUT maximumSalary INT
    )
BEGIN
SELECT max(s.salary)
INTO maximumSalary
FROM employees e
INNER JOIN salaries s USING (emp_no)
INNER JOIN titles t USING (emp_no)
GROUP BY t.titles
HAVING t.titles = employeeTitles;
END//

CALL maxSalaryOfEmployeeByTitle('Manager', @maximumSalary);




-- #4 THIS PROCEDURE LETS YOU GET THE EMPLOYEES FIRST NAME LAST NAME AND TITLE

DROP PROCEDURE IF EXISTS getEmployeeInfoByJobTitle;
DELIMITER // 
CREATE PROCEDURE getEmployeeInfoByJobTitle(
	IN empInfoByTitle VARCHAR(321)
)
BEGIN 
SELECT e.first_name, e.last_name, t.title
FROM employees e 
INNER JOIN titles t USING (emp_no)
WHERE t.title = empInfoByTitle;
END//

CALL getEmployeeInfoByJobTitle("Engineer");

-- #5 THIS WILL PRODUCE ALL OF THE INFORMATION FOR THE EMPLOYEE INCLUDING A HIRE DATE AND EMPLOYEE NUMBER

DROP PROCEDURE IF EXISTS basicEmpInfo;

DELIMITER //
CREATE PROCEDURE basicEmpInfo ()
BEGIN
	SELECT emp_no,first_name,last_name,gender,hire_date,birth_date FROM employees;
END // 

CALL basicEmpInfo();