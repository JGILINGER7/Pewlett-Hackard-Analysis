# Pewlett-Hackard-Analysis
## Analysis
### GOAL
The goal of this analysis is to understand the current employee roster and the future needs of the company in regards to hiring and leadership. 
### Method
To that end, in PostgreSQL we analyzed the current employee data and created additional tables that breakdown the number of employees by department that are eleigible for retirement. In addition we created a table that shows the employees that will are elegible for a mentorship program and will provide the next generation of leadership for the company 

## Results
*Our first analysis shows that we have a high number of employees elegible for retirement in senior positions ![Retirement Count](Pewlett-Hackard-Analysis/retirement_count.png)
*Overwhelmingly these people are in senior positions. 
*Fortunately only 2 of the deparments have managers eligible for retirement.
*The 1,549 Employees eligible for mentorship will not be enough to fill this gap requiring a large investment into new hires for senior positions. 

## Summary 
### Questions 
There are 72,458 employees eligible for retirement. All these positions will need to be filled. With only 1,549 employees currently eligible for the mentorship program this provides more than enough people to cover mentoring. If only taken from senior level employees and management there are more than enough qualified candidates to cover a mentorship program. 

### Further Queries 
Using 
'''
SELECT COUNT(me.emp_no), de.dept_no
FROM mentorship_elegibility as me
LEFT JOIN dept_emp as de
ON me.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

I was able to generate a count by position of those elegible for the mentorship program ![Future Leaders](Pewlett-Hackard-Analysis/future_leaders.png) This shows us that of our mentorship elegible employees, 721 are already in senior positions leaving an even more limited number of employees ready for mentorship roles. 


Using 
'''
SELECT COUNT(ut.emp_no), de.dept_no
FROM unique_titles as ut
LEFT JOIN dept_emp as de
ON ut.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

I created a breakdown of employees elegible for retirement by their department this shows that production, developement and sales will be the worst hit by the retirement waves losing 17,784, 20,451, and 12,649 employees respectively. This gives us a better breakdown of where recruiting efforts will be most needed. 