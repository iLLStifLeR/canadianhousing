WITH size_class_CTE as (
	SELECT 
		City, 
		Price,
		Square_footage,
		CASE
			WHEN Square_Footage < 750 THEN 'Small'
			WHEN Square_Footage BETWEEN 751 AND 1500 THEN 'Medium'
			WHEN Square_Footage > 1501 THEN 'Large'
		END as size_class
	FROM cleaned_canada
	WHERE Province='BC'
	GROUP BY City, Price, Square_Footage
)

SELECT 
	City,
	size_class,
	ROUND(AVG(Price)/AVG(Square_Footage),2) as price_per_sqft
FROM size_class_CTE
GROUP BY City, size_class
ORDER BY City, size_class