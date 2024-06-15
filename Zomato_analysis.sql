SELECT
	*
FROM
	SALES;
SELECT
	*
FROM
	PRODUCT;

SELECT
	*
FROM
	GOLDUSERS_SIGNUP;

SELECT
	*
FROM
	USERS;

-- 1. Total amount spent by each customer on zomato
SELECT
	A.USERID,
	SUM(B.PRICE) AS TOTAL_AMOUNT
FROM
	SALES A
	INNER JOIN PRODUCT B ON A.PRODUCT_ID = B.PRODUCT_ID
GROUP BY
	USERID;

--2. How many days each customer visited ?
SELECT
	USERID,
	COUNT(DISTINCT CREATED_DATE)
FROM
	SALES
GROUP BY
	USERID
ORDER BY
	USERID
	--3.What was the first product purchased by each customer ?
SELECT
	X.USERID,
	Y.PRODUCT_NAME
FROM
	(
		SELECT
			A.USERID,
			PRODUCT_ID,
			CREATED_DATE
		FROM
			SALES A
		WHERE
			CREATED_DATE = (
				SELECT
					MIN(B.CREATED_DATE)
				FROM
					SALES B
				WHERE
					A.USERID = B.USERID
			)
		ORDER BY
			USERID
	) AS X
	INNER JOIN PRODUCT Y ON X.PRODUCT_ID = Y.PRODUCT_ID;

--4 what is the most purchased item on menu and how many times it was purchased by all customers?
SELECT
	COUNT(PRODUCT_ID),
	PRODUCT_ID
FROM
	SALES
GROUP BY
	PRODUCT_ID
LIMIT
	1;

--5. Which item was most popular for each customer?
SELECT
	*
FROM
	(
		SELECT
			*,
			RANK() OVER (
				PARTITION BY
					USERID
				ORDER BY
					CNT DESC
			) RNK
		FROM
			(
				SELECT
					USERID,
					PRODUCT_ID,
					COUNT(PRODUCT_ID) CNT
				FROM
					SALES
				GROUP BY
					PRODUCT_ID,
					USERID
			) A
	) B
WHERE
	RNK = 1;

--6. What was the first purchase by the customer after they become a memeber 
SELECT
	X.USERID,
	X.CREATED_DATE,
	X.PRODUCT_ID
FROM
	(
		SELECT
			A.USERID,
			A.CREATED_DATE,
			A.PRODUCT_ID,
			B.GOLD_SIGNUP_DATE
		FROM
			SALES A
			INNER JOIN GOLDUSERS_SIGNUP B ON A.USERID = B.USERID
	) AS X
WHERE
	CREATED_DATE = (
		SELECT
			MIN(Y.CREATED_DATE)
		FROM
			SALES Y
		WHERE
			X.USERID = Y.USERID
	)
ORDER BY
	USERID;

--7. Which Item was purchaesd  just before user become a member ?
SELECT
	*
FROM
	(
		SELECT
			X.*,
			RANK() OVER (
				PARTITION BY
					USERID
				ORDER BY
					CREATED_DATE DESC
			) RNK
		FROM
			(
				SELECT
					A.USERID,
					A.CREATED_DATE,
					A.PRODUCT_ID
				FROM
					SALES A
					INNER JOIN GOLDUSERS_SIGNUP B ON A.USERID = B.USERID
					AND CREATED_DATE <= GOLD_SIGNUP_DATE
			) AS X
	) D
WHERE
	RNK = 1;

--8. What is total order and amount spent from each customer before they become gold user ?
SELECT
	USERID,
	COUNT(PRODUCT_ID) AS TOTAL_ORDER,
	SUM(PRICE)
FROM
	(
		SELECT
			X.*,
			C.PRICE
		FROM
			(
				SELECT
					A.USERID,
					A.CREATED_DATE,
					A.PRODUCT_ID,
					B.GOLD_SIGNUP_DATE
				FROM
					SALES A
					INNER JOIN GOLDUSERS_SIGNUP B ON A.USERID = B.USERID
				WHERE
					CREATED_DATE <= GOLD_SIGNUP_DATE
				ORDER BY
					USERID
			) X
			INNER JOIN PRODUCT C ON X.PRODUCT_ID = C.PRODUCT_ID
	) G
GROUP BY
	G.USERID;

/*9. If buying each product genrates points and each product has diffrent zomato points which is for P1 on every 5rs= 2 point,for P2 on 2rs=1 point and for P3 on 5rs = 1 zomato point 
So calculate points collected by each customer and product for which most point have given untill now. */
--a.Points collected by each customer
SELECT
	E.USERID,
	SUM(E.POINTS_EARNED) AS TOTAL_POINTS
FROM
	(
		SELECT
			D.USERID,
			D.PRODUCT_ID,
			D.SPEND,
			CASE
				WHEN D.PRODUCT_ID = 1 THEN FLOOR(D.SPEND / 5) * 2
				WHEN D.PRODUCT_ID = 2 THEN FLOOR(D.SPEND / 2)
				WHEN D.PRODUCT_ID = 3 THEN FLOOR(D.SPEND / 5)
				ELSE 0
			END AS POINTS_EARNED
		FROM
			(
				SELECT
					C.USERID,
					C.PRODUCT_ID,
					SUM(C.PRICE) AS SPEND
				FROM
					(
						SELECT
							A.USERID,
							A.PRODUCT_ID,
							B.PRICE
						FROM
							SALES A
							INNER JOIN PRODUCT B ON A.PRODUCT_ID = B.PRODUCT_ID
					) C
				GROUP BY
					C.USERID,
					C.PRODUCT_ID
			) D
	) E
GROUP BY
	E.USERID;

--b. Product which earned most zomato points
SELECT
	E.PRODUCT_ID,
	SUM(E.POINTS_EARNED) AS POINTS
FROM
	(
		SELECT
			D.*,
			CASE
				WHEN PRODUCT_ID = 1 THEN FLOOR(SPEND / 2.5) * 2
				WHEN PRODUCT_ID = 2 THEN FLOOR(SPEND / 2)
				WHEN PRODUCT_ID = 3 THEN FLOOR(SPEND / 5)
				ELSE 0
			END AS POINTS_EARNED
		FROM
			(
				SELECT
					C.USERID,
					C.PRODUCT_ID,
					SUM(PRICE) AS SPEND
				FROM
					(
						SELECT
							A.*,
							B.PRICE
						FROM
							SALES A
							INNER JOIN PRODUCT B ON A.PRODUCT_ID = B.PRODUCT_ID
					) C
				GROUP BY
					USERID,
					PRODUCT_ID
			) D
	) E
GROUP BY
	E.PRODUCT_ID
ORDER BY
	POINTS DESC
LIMIT
	1;

/* 10. In the first one year after a customer joins a gold program (including their joining date) irrespective of what they have purchaesd they earn 5 zomato points on every 10 rs spent
finds to earned more and what was their points? */
SELECT
	C.*,
	ROUND(D.PRICE * 0.5) TOTAL_POINTS
FROM
	(
		SELECT
			A.USERID,
			A.PRODUCT_ID,
			A.CREATED_DATE,
			B.GOLD_SIGNUP_DATE
		FROM
			SALES A
			INNER JOIN GOLDUSERS_SIGNUP B ON A.USERID = B.USERID
			AND CREATED_DATE >= GOLD_SIGNUP_DATE
			AND CREATED_DATE <= DATE_ADD (GOLD_SIGNUP_DATE, INTERVAL '1 year')
	) C
	INNER JOIN PRODUCT D ON C.PRODUCT_ID = D.PRODUCT_ID;

-- Rank all the tranctions of the customers with gold sub and mark all non-gold users as 'NA'
SELECT
	C.*,
	CASE
		WHEN GOLD_SIGNUP_DATE IS NULL THEN 'NA'
		ELSE RANK() OVER (
			PARTITION BY
				USERID
			ORDER BY
				CREATED_DATE DESC
		)::TEXT
	END AS RANKS
FROM
	(
		SELECT
			A.USERID,
			A.CREATED_DATE,
			A.PRODUCT_ID,
			B.GOLD_SIGNUP_DATE
		FROM
			SALES A
			LEFT JOIN GOLDUSERS_SIGNUP B ON A.USERID = B.USERID
			AND A.CREATED_DATE >= B.GOLD_SIGNUP_DATE
	) C;