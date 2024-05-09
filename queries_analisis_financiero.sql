CREATE SCHEMA prestamos_2015;

CREATE TABLE orders (
	order_id VARCHAR(50) PRIMARY KEY,
    created_at VARCHAR(50),
    status TEXT,
    amount DOUBLE,
    merchant_id VARCHAR(50),
    country VARCHAR(50),
    CONSTRAINT fk_merchant_id FOREIGN KEY(merchant_id) REFERENCES merchants(merchant_id)
);

CREATE TABLE merchants (
	merchant_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE refunds (
	order_id VARCHAR(50),
    refunded_at VARCHAR(50),
    amount DOUBLE,
    CONSTRAINT fk_order_id FOREIGN KEY(order_id) REFERENCES orders(order_id)
);



#Ejercicio 2.1
SELECT 
	country, 
	status, 
    COUNT(*) AS TotalOperaciones,
	ROUND(AVG(amount), 2) AS ImportePromedio
FROM orders
WHERE 
	created_at > '2015-07-01'
    AND  country in ('Espana', 'Portugal', 'Francia')
    AND amount BETWEEN 100 AND 1500
GROUP BY
	country,
    status
ORDER BY
	ImportePromedio DESC;
    
#Ejercicio 2.2
SELECT
	country,
    COUNT(*) AS TotalOperaciones,
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount
FROM orders
WHERE
	status NOT IN ('DELINQUENT', 'CANCELLED')
    AND amount > 100
GROUP BY
	country
ORDER BY
	COUNT(*) DESC
LIMIT 3;

#Ejercicio 3.1
SELECT
	country,
    m.merchant_id,
    name AS merchant_name,
    COUNT(o.order_id) AS TotalOperaciones,
    ROUND(AVG(o.amount), 2) AS ValorPromedio,
    SUM(CASE WHEN r.order_id IS NOT NULL THEN 1 ELSE 0 END) AS TotalDevoluciones,
    CASE WHEN COUNT(r.order_id) > 0  THEN 'Sí' ELSE 'No' END AS acepta_devoluciones
FROM
    orders AS o
INNER JOIN
    merchants AS m ON o.merchant_id = m.merchant_id
LEFT JOIN
    refunds AS r ON o.order_id = r.order_id
WHERE
    o.country IN ('Marruecos', 'Italia', 'Espana', 'Portugal')
GROUP BY
    o.country,
    m.merchant_id,
    m.name
HAVING
    COUNT(o.order_id) > 10
ORDER BY
    TotalOperaciones ASC;

#Ejercicio 3.2
CREATE VIEW prestamos_2015.orders_view AS
SELECT
    o.*,
    m.name AS merchant_name,
    COUNT(r.order_id) AS refunds_count,
    SUM(r.amount) AS refunds_total
FROM
    orders o
JOIN
    merchants m ON o.merchant_id = m.merchant_id
LEFT JOIN
    refunds r ON o.order_id = r.order_id
GROUP BY
    o.order_id, o.created_at, o.status, o.amount, o.merchant_id, o.country, m.name
ORDER BY
	refunds_total DESC;

SELECT * FROM orders_view;

# Ejercicio 4: ANÁLISIS
# Consulta: Porcentaje de devoluciones por país
SELECT
    o.country,
    COUNT(r.order_id) AS total_refunds,
    COUNT(o.order_id) AS total_orders,
    (COUNT(r.order_id) / COUNT(o.order_id)) * 100 AS refund_percentage
FROM
    orders o
LEFT JOIN
    refunds r ON o.order_id = r.order_id
GROUP BY
    o.country;
    
# Consulta: Porcentaje de devoluciones por comercio
SELECT
    m.name AS merchant_name,
    COUNT(r.order_id) AS total_refunds,
    COUNT(o.order_id) AS total_orders,
    (COUNT(r.order_id) / COUNT(o.order_id)) * 100 AS refund_percentage
FROM
    orders o
JOIN
    merchants m ON o.merchant_id = m.merchant_id
LEFT JOIN
    refunds r ON o.order_id = r.order_id
GROUP BY
    o.merchant_id
ORDER BY
	refund_percentage DESC;




