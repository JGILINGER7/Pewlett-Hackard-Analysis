--create retirement_titles table
Select e.emp_no, e.first_name, e.last_name, titles.title, titles.from_date, titles.to_date
Select e.emp_no, e.first_name, e.last_name, titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees as e 
JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE e.birth_date >= '1952-01-01'
and e.birth_date <= '1955-12-31'
ORDER BY emp_no;
SELECT DISTINCT (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01';


--create unique_titles table 
SELECT DISTINCT (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01';

--Create retiring_titles table
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;


--create mentorship_elegibility table
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_Date, de.from_date, de.to_date, titles.title
INTO mentorship_elegibility
FROM employees as e 
LEFT Join dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles
ON (e.emp_no = titles.emp_no)
WHERE de.to_date = '9999-01-01'
AND e.birth_date >= '1965-01-01'
AND e.birth_date <= '1965-12-01'
ORDER BY e.emp_no;
