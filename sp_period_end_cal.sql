
CREATE  PROCEDURE `sp_period_end_cal`
()
BEGIN
    create temporary table total as
    select sum(amount_paid) as total , period_id, paid_id
    from ledger.expense_detail
    group by period_id,paid_id;

    create temporary table credit as
    select sum(amount_paid) as total , period_id, paid_id
    from ledger.misc_credit
    group by period_id,paid_id;

    insert into expense_summary
        (amount,period_id,paid_id)
    select
        ifnull((a.total-b.total),a.total) as total, a.period_id, a.paid_id
    from total a left join credit b
        on  a.period_id=b.period_id
            and a.paid_id=b.paid_id
    where a.period_id in (select Period_id
    from ledger.period_detail c
    where sysdate() between c.Starting_from and c.Ending_on)
    group by a.period_id,a.paid_id;



    drop temporary table total;
drop temporary table credit;

END$$
DELIMITER ;
