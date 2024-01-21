/*
SELECT * FROM ledger.period_detail;
*/
use ledger;
insert into ledger.period_detail(period_id,Starting_from,Ending_on) values 
(33,STR_TO_DATE('01/02/2024','%d/%m/%Y'),STR_TO_DATE('29/02/2024','%d/%m/%Y')),
(34,STR_TO_DATE('01/03/2024','%d/%m/%Y'),STR_TO_DATE('31/03/2024','%d/%m/%Y')),
(35,STR_TO_DATE('01/04/2024','%d/%m/%Y'),STR_TO_DATE('30/04/2024','%d/%m/%Y')),
(36,STR_TO_DATE('01/05/2024','%d/%m/%Y'),STR_TO_DATE('31/05/2024','%d/%m/%Y')),
(37,STR_TO_DATE('01/06/2024','%d/%m/%Y'),STR_TO_DATE('30/06/2024','%d/%m/%Y')),
(38,STR_TO_DATE('01/07/2024','%d/%m/%Y'),STR_TO_DATE('31/07/2024','%d/%m/%Y')),
(39,STR_TO_DATE('01/08/2024','%d/%m/%Y'),STR_TO_DATE('31/08/2024','%d/%m/%Y')),
(40,STR_TO_DATE('01/09/2024','%d/%m/%Y'),STR_TO_DATE('30/09/2024','%d/%m/%Y')),
(41,STR_TO_DATE('01/10/2024','%d/%m/%Y'),STR_TO_DATE('31/10/2024','%d/%m/%Y')),
(42,STR_TO_DATE('01/11/2024','%d/%m/%Y'),STR_TO_DATE('30/11/2024','%d/%m/%Y')),
(43,STR_TO_DATE('01/12/2024','%d/%m/%Y'),STR_TO_DATE('31/12/2024','%d/%m/%Y')),
(44,STR_TO_DATE('01/01/2025','%d/%m/%Y'),STR_TO_DATE('31/01/2025','%d/%m/%Y')),
(45,STR_TO_DATE('01/02/2025','%d/%m/%Y'),STR_TO_DATE('28/02/2025','%d/%m/%Y'));
