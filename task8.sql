create procedure addCustomer(
	in p_name varchar,
	in p_email varchar,
	in p_city varchar
)
language plpgsql
as $$
begin
insert into customers(customer_name, email, address)
values (p_name, p_email, p_city);
end;
$$

call addCustomer('Swapnil kshirsagar', 'swapnil@gmail', 'pune');

CREATE FUNCTION get_customers_count_by_city(p_city VARCHAR)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    city_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO city_count
    FROM customers
    WHERE address = p_city;
		RETURN city_count;
END;
$$;

SELECT get_customers_count_by_city('Pune');
