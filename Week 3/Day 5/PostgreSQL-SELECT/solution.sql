-- Challenge 1 - Who Have Published What At Where?

SELECT A.au_id AS author_id,
	   A.au_lname AS last_name,
	   A.au_fname AS first_name,
	   C.title,
	   D.pub_name
FROM authors AS A
	INNER JOIN
	titleauthor AS B
ON A.au_id=B.au_id
	LEFT JOIN
	titles AS C
ON B.title_id=C.title_id
	LEFT JOIN
	publishers AS D
ON C.pub_id=D.pub_id;

-- conferindo

SELECT COUNT(*) FROM titleauthor;
	
-- Challenge 2 - Who Have Published How Many At Where?

SELECT A.au_id AS author_id,
	   A.au_lname AS last_name,
	   A.au_fname AS first_name,
	   D.pub_name,
	   COUNT(*) AS title_count
FROM authors AS A
	INNER JOIN
	titleauthor AS B
ON A.au_id=B.au_id
	LEFT JOIN
	titles AS C
ON B.title_id=C.title_id
	LEFT JOIN
	publishers AS D
ON C.pub_id=D.pub_id
GROUP BY A.au_id,
		 A.au_lname,
		 A.au_fname,
		 D.pub_name
ORDER BY title_count DESC, author_id DESC;

-- conferindo

SELECT SUM (title_count.title_count)
FROM (SELECT A.au_id AS author_id,
	   A.au_lname AS last_name,
	   A.au_fname AS first_name,
	   D.pub_name,
	   COUNT(*) AS title_count
FROM authors AS A
	INNER JOIN
	titleauthor AS B
ON A.au_id=B.au_id
	LEFT JOIN
	titles AS C
ON B.title_id=C.title_id
	LEFT JOIN
	publishers AS D
ON C.pub_id=D.pub_id
GROUP BY A.au_id,
		 A.au_lname,
		 A.au_fname,
		 D.pub_name
ORDER BY title_count DESC, author_id DESC) AS title_count;

-- Challenge 3 - Best Selling Authors

SELECT A.au_id AS author_id,
	   A.au_lname AS last_name,
	   A.au_fname AS first_name,
	   SUM(S.qty) AS sum_sales
FROM authors AS A
	INNER JOIN
	titleauthor AS B
ON A.au_id=B.au_id
	LEFT JOIN
	titles AS C
ON B.title_id=C.title_id
	LEFT JOIN
	sales AS S
ON C.title_id=S.title_id
GROUP BY A.au_id,
		 A.au_lname,
		 A.au_fname
ORDER BY sum_sales DESC LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking

SELECT A.au_id AS author_id,
	   A.au_lname AS last_name,
	   A.au_fname AS first_name,
	   COALESCE(SUM(S.qty),0) AS total_sales
FROM authors AS A
	LEFT JOIN
	titleauthor AS B
ON A.au_id=B.au_id
	LEFT JOIN
	titles AS C
ON B.title_id=C.title_id
	LEFT JOIN
	sales AS S
ON C.title_id=S.title_id
GROUP BY A.au_id,
		 A.au_lname,
		 A.au_fname
ORDER BY total_sales DESC;
