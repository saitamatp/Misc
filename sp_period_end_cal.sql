DELIMITER $$
CREATE DEFINER=`UserName`@`%` PROCEDURE `sp_period_end_cal`()
BEGIN
SET @period_id  = ((select Period_id from ledger.period_detail c where curdate() between c.Starting_from and c.Ending_on)-1);

create temporary table total as 
select sum(amount_paid) as total ,period_id,paid_id from ledger.expense_detail exp
where exp.period_id = @period_id
group by exp.period_id,exp.paid_id;

create temporary table credit as 
select sum(amount_paid) as total ,period_id,paid_id from ledger.misc_credit cred
where cred.period_id = @period_id
group by cred.period_id,cred.paid_id;

insert into expense_summary(amount,period_id,paid_id)
select  
ifnull((a.total-b.total),a.total) as total,a.period_id,a.paid_id
from total a left join credit b
on  a.period_id=b.period_id
and a.paid_id=b.paid_id;

insert into expense_summary(amount,period_id,paid_id)
select sum(-pp.total) as total ,pp.period_id,pp.paid_id from credit pp
where not exists (select * from total cc where cc.paid_id =pp.paid_id)
group by pp.paid_id,pp.period_id;

drop temporary table total;
drop temporary table credit;
END$$
DELIMITER ;
