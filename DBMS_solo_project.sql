--This query gives the daily price change 
SELECT
    [Date],
    [Open Price],
    [Close Price],
    ([Close Price] - [Open Price]) AS Daily_Price_Change
FROM
    suzlon


--This query gives the highest trading vloume
SELECT
	TOP 5
    [Date],
    [Total Traded Quantity]
FROM
    suzlon
ORDER BY
    [Total Traded Quantity] DESC


--This query gives avg stock price for specific date range
SELECT
    AVG([Close Price]) AS Average_Close_Price
FROM
    Suzlon
WHERE
    [Date] BETWEEN '2022-09-01' AND '2022-12-01';


--this query calculates the percentage of delivered quantity to traded quantity for a specific date range
SELECT
    [Date],
    ([Deliverable Qty] / [Total Traded Quantity] * 100) AS [% Dly Qt to Traded Qty]
FROM
    suzlon
WHERE
    [Date] BETWEEN '2022-09-01' AND '2022-12-01';


--this query finds the dates with the highest and lowest closing prices:
SELECT
    [Date],
    [Close Price]
FROM
    suzlon
WHERE
    [Close Price] = (SELECT MAX([Close Price]) FROM suzlon)
    OR
    [Close Price] = (SELECT MIN([Close Price]) FROM suzlon);


--this query calculates the total turnover for a specific date range:
SELECT
    SUM([Turnover ₹]) AS Total_Turnover
FROM
    suzlon
WHERE
    [Date] BETWEEN '2022-09-01' AND '2022-12-01';


--this query finds the days with the highest percentage of deliverable quantity to traded quantity:
SELECT TOP 5
    [Date],
    [% Dly Qt to Traded Qty]
FROM
    suzlon
ORDER BY
    [% Dly Qt to Traded Qty] DESC


--this query finds the dates where the opening price was lower than the closing price:
SELECT
    [Date],
    [Open Price],
    [Close Price]
FROM
    suzlon
WHERE
    [Open Price] < [Close Price];


--this query calculates the percentage change in the closing price from the previous day:
SELECT
    [Date],
    [Close Price],
    LAG([Close Price]) OVER (ORDER BY [Date]) AS Previous_Close_Price,
    (([Close Price] - LAG([Close Price]) OVER (ORDER BY [Date])) / LAG([Close Price]) OVER (ORDER BY [Date])) * 100 AS Percentage_Change
FROM
    suzlon;


--Calculate the total traded quantity and turnover for the top 5 trading days
SELECT TOP 5
    [Date],
    [Total Traded Quantity],
    [Turnover ₹]
FROM
    suzlon
ORDER BY
    [Total Traded Quantity] DESC;


--this query finds the days with the highest and lowest intraday price range:
SELECT TOP 5
    [Date],
    ([High Price] - [Low Price]) AS Intraday_Price_Range
FROM
    suzlon
ORDER BY
    Intraday_Price_Range DESC


-- this query calculates the 7-day rolling average of the closing price:
SELECT
    [Date],
    [Close Price],
    AVG([Close Price]) OVER (ORDER BY [Date] ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS '7_Day_Rolling_Avg_Close'
FROM
    suzlon


--this query finds the dates with the highest and lowest number of trades:
SELECT
    [Date],
    [No# of Trades]
FROM
    suzlon
WHERE
    [No# of Trades] = (SELECT MAX([No# of Trades]) FROM suzlon)
    OR
    [No# of Trades] = (SELECT MIN([No# of Trades]) FROM suzlon);


--this query finds the dates with the highest and lowest turnover per traded quantity:
SELECT TOP 5
    [Date],
    ([Turnover ₹] / [Total Traded Quantity]) AS Turnover_Per_Trade
FROM
    suzlon
ORDER BY
    Turnover_Per_Trade DESC


--this query calculates the average daily turnover for each year:
SELECT
    YEAR([Date]) AS Year,
    AVG([Turnover ₹]) AS Average_Daily_Turnover
FROM
    suzlon
GROUP BY
    [Date]
ORDER BY
    [Date];



--this query finds the date with the highest total turnover:
SELECT
    [Date],
    [Turnover ₹]
FROM
    suzlon
WHERE
    [Turnover ₹] = (SELECT MAX([Turnover ₹]) FROM suzlon);


--this query finds the dates with the highest and lowest closing prices within a specific date range:
SELECT
    [Date],
    [Close Price]
FROM
    suzlon
WHERE
    [Date] BETWEEN '2022-09-01' AND '2022-12-01'
    AND ([Close Price] = (SELECT MAX([Close Price]) FROM suzlon WHERE [Date] BETWEEN '2022-09-01' AND '2022-12-01')
    OR [Close Price] = (SELECT MIN([Close Price]) FROM suzlon WHERE [Date] BETWEEN '2022-09-01' AND '2022-12-01'));


--this query calculates the 30-day moving average of the closing price:
SELECT
    [Date],
    [Close Price],
    AVG([Close Price]) OVER (ORDER BY [Date] ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS '30_Day_Moving_Avg_Close'
FROM
    suzlon;


--this query calculates the daily price change as a percentage of the opening price:
SELECT
    [Date],
    [Open Price],
    [Close Price],
    (([Close Price] - [Open Price]) / [Open Price]) * 100 AS Daily_Price_Change_Percentage
FROM
    suzlon;


--this query  calculates the average closing price for days when the trading volume was above a certain threshold:
SELECT
    AVG([Close Price]) AS Average_Close_Price
FROM
    suzlon
WHERE
    [Total Traded Quantity] > 15000;


--this query determines the days with the highest and lowest trading volume as a percentage of the average volume:
SELECT TOP 5
    [Date],
    [Total Traded Quantity],
    [Total Traded Quantity] / AVG([Total Traded Quantity]) OVER () AS Volume_Percentage_of_Average
FROM
    suzlon
ORDER BY
    Volume_Percentage_of_Average DESC;


--this query calculates the average daily turnover for days when the closing price increased:
sql
Copy code
SELECT
    AVG([Turnover ₹]) AS Avg_Daily_Turnover_On_Price_Increase
FROM
    suzlon
WHERE
    [Close Price] > [Open Price];


--thies query calculates the total number of records (days) in the dataset:
SELECT COUNT(*) AS Total_Days FROM suzlon;


--Find the highest closing price and the date it occurred:

SELECT
    MAX([Close Price]) AS Highest_Close_Price
FROM
    suzlon
WHERE
    [Close Price] = (SELECT MAX([Close Price]) FROM suzlon);


--Determine the average trading volume (Total Traded Quantity) for the entire dataset
SELECT AVG([Total Traded Quantity]) AS Average_Trading_Volume FROM suzlon;


--query to calculate the overall turnover (Total Turnover ₹) for all records:

SELECT SUM([Turnover ₹]) AS Total_Turnover FROM suzlon;

