use dhiksha_bank;

CREATE TABLE dhiksha_bank.Borrower (
    Customername VARCHAR(50),
    Loan_number int,
    foreign key (Customername) references BankCustomer(customername),
    foreign key (Loan_number) references Loan(Loan_number)
);

insert into Borrower values('Avinash',1);
insert into Borrower values('Dinesh',2);
insert into Borrower values('Mohan',3);
insert into Borrower values('Nikil',4);
insert into Borrower values('Ravi',5);

select distinct Customername
from borrower
where Customername not in (select Customername
from depositer);

Select Customername
From Borrower ,loan 
Where borrower.loan_number=loan.loan_number
and loan.branch_name in (select branch_name
from depositer, bankaccount
where depositer.accno = bankaccount.accno And bankaccount.branch_name in
 (Select branch_name from branch WHERE branch.branch_city='Bangalore')); 

select branch_name from branch where assets >
all (select assets from branch where branch_city
= 'Bangalore')


