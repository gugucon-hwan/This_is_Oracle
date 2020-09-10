create table Shop.indexTBL
as
    select first_name, last_name, hire_date
    from HR.EMPLOYEES;
    
   
   select * from Shop.indexTBL; 