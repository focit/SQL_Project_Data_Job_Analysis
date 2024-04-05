/*
Pregunta: ¿Cuáles son las habilidades con mayor demanda para el análisis de datos?
- Unir la tabla de trabajos posteados con inner join en una búsqueda similar con la búsqueda 2.
- Identificar el top 5 de habiidades demandadas para Análisis de datos.
- Focalizar en todos los trabajos posteados.
- ¿Por qué? Recuperar las 5 mejores habilidades con mayor demanda en el mercado laboral,
proporcionaría información sobre las habilidades más valiosas para el análisis de datos. 
*/

SELECT
    skills,
    count(job_postings_fact.job_id) AS demand_skills
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_skills DESC
LIMIT 5

/*
Conclusiones: 
-SQL: Con 7291 menciones, SQL es la habilidad más demandada en el análisis de datos. 
Esto sugiere que tener experiencia en SQL es fundamental para muchos roles en este campo.

- Excel: Aunque es una herramienta ampliamente utilizada en muchos entornos empresariales, 
Excel sigue siendo una habilidad importante en el análisis de datos, con 4611 menciones.

- Python: Con 4330 menciones, Python es otro lenguaje de programación altamente demandado en el análisis de datos.
Su versatilidad y su amplia gama de bibliotecas específicas para el análisis de datos lo hacen valioso para los profesionales en este campo.

- Tableau: Con 3745 menciones, Tableau es una habilidad destacada en la visualización de datos, 
lo que sugiere que la capacidad para crear visualizaciones efectivas y comprensibles es valorada en el análisis de datos.

- Power BI: Con 2609 menciones, Power BI también es una herramienta popular para la visualización de datos y el análisis empresarial.

En resumen, las habilidades con mayor demanda para el análisis de datos según la tabla proporcionada son SQL, Excel, Python, Tableau y Power BI, en ese orden.
Estas habilidades son cruciales para diversas tareas dentro del campo del análisis de datos,
desde la manipulación de datos hasta la visualización y el análisis avanzado.

[
  {
    "skills": "sql",
    "demand_skills": "7291"
  },
  {
    "skills": "excel",
    "demand_skills": "4611"
  },
  {
    "skills": "python",
    "demand_skills": "4330"
  },
  {
    "skills": "tableau",
    "demand_skills": "3745"
  },
  {
    "skills": "power bi",
    "demand_skills": "2609"
  }
]
*/