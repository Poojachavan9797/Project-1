create database bank_loan_project;
use bank_loan_project;
select * from finance1;
select * from finance_2;
select count(*) from finance1;
 
-- KPI (1) Year wise loan amount
select year(issue_d) as Year_of_issue_d, sum(loan_amnt) as Total_loan_amnt 
from finance1 
group by Year_of_issue_d 
order by Year_of_issue_d ;

-- KPI (2) Grade and sub grade wise revol_bal
select grade, sub_grade, sum(revol_bal) as Total_revol_bal
from finance1 inner join finance_2 
on(finance1.id = finance_2.id)
group by grade, sub_grade
order by grade, sub_grade;

-- KPI (3) Total payment for verified and non verified status
select verification_status, round(sum(total_pymnt),2) as Total_payment
from finance1 inner join finance_2
on( finance1.id = finance_2.id)
group by verification_status ;

-- KPI (4) State wise and last_credit_pull_d wise loan status
select addr_state, last_credit_pull_d, loan_status
from finance1 inner join finance_2
on( finance1.id = finance_2.id)
group by addr_state, last_credit_pull_d, loan_status
order by last_credit_pull_d ;

-- KPI (5) Home ownership vs last payment date stats
select home_ownership, last_pymnt_d
from finance1 inner join finance_2
on( finance1.id = finance_2.id)
group by home_ownership, last_pymnt_d
order by home_ownership, last_pymnt_d; 