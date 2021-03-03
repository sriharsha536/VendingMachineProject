-- =======================================================
-- Day by Day sales for the previous 30 days
-- =======================================================

SELECT CONVERT(DATE, TRANSACTIONDATE) AS TRANSACTIONDATE, COUNT(TRANSACTIONDATE) AS SALESCOUNT FROM TRANSACTIONS AS T (NOLOCK)
WHERE TRANSACTIONDATE > GETDATE() - 30
GROUP BY CONVERT(DATE, TRANSACTIONDATE) 


-- =======================================================
-- 10 most popular items for the previous week
-- =======================================================
SELECT TOP 10 IT.ITEMNAME, COUNT(1) AS SALECOUNT, DENSE_RANK() OVER(ORDER BY COUNT(1) DESC) ITEMRANK FROM TRANSACTIONS AS T (NOLOCK)
INNER JOIN ITEMS AS IT (NOLOCK) ON T.ITEMID = IT.ITEMID 
WHERE T.TRANSACTIONDATE > GETDATE() - 7
GROUP BY IT.ITEMNAME