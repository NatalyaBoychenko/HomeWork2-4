SELECT name, count(project.id) AS project_count FROM client
FULL JOIN project ON project.client_id = client.id	
GROUP BY name
HAVING count(project.id) IN (
	SELECT count(project.id) FROM project
	GROUP BY client_id
	ORDER BY count(id) DESC
	LIMIT 1
)
