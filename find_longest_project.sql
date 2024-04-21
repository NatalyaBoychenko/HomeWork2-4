
SELECT id AS project_name, EXTRACT(year FROM AGE(finish_date, start_date)) * 12 + 
			   EXTRACT(month FROM AGE(finish_date, start_date)) AS month_count FROM project;
