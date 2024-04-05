/*
Pregunta: ¿Cuáles son las habilidades requerridas en los trabajos de análisis de datos mejor pagados?
- Utiliza la búsqueda anterior con los 10 trabajos mejor pagados.
- Agrega las habilidades específicas de esos trabajos.
- ¿Por qué? Para proporcionar una visión detallada de qué empleos bien remunerados exigen mantener habilidades,
ayudando a quienes buscan empleo a comprender qué habilidades desarrollar con los salarios más altos.
*/
WITH top_paying_job AS (
    SELECT
        job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title LIKE '%Junior%Data Analyst%' AND
        job_location IN ('Anywhere','Mexico') AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_job.*,
    skills
FROM
    top_paying_job
INNER JOIN skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY  
    salary_year_avg DESC

/*
Conclusiones:
1. Las principales habilidades que requieren los 10 mejores trabajos remotos en Análisis de datos (Junior) mejor pagados son SQL y Excel, 
ya que son requerridas en 8 empleos.
2. La tercera habilidad necesaria es Tableau con 4.
3. Las siguientes son python, powerbi, sharepoint, sheets y vba.
4. Otras habilidades que solo han sido pedidos en un trabajo son word, nosql, ms access, confluence, jira, julia, phoenix, powertpoint y r.

Se adjunta el código en sql con la tabla resultante de la búsqueda:
[
  {
    "job_id": 564679,
    "company_name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 564679,
    "company_name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 564679,
    "company_name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_id": 564679,
    "company_name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 564679,
    "company_name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 564679,
    "company_name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 564679,
    "company_name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "jira"
  },
  {
    "job_id": 564679,
    "company_name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "confluence"
  },
  {
    "job_id": 550113,
    "company_name": "Motion Recruitment",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 156786,
    "company_name": "Patterned Learning AI",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 156786,
    "company_name": "Patterned Learning AI",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 156786,
    "company_name": "Patterned Learning AI",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1321085,
    "company_name": "Patterned Learning AI",
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 1321085,
    "company_name": "Patterned Learning AI",
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1321085,
    "company_name": "Patterned Learning AI",
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "skills": "sheets"
  },
  {
    "job_id": 432310,
    "company_name": "Get It Recruit - Transportation",
    "job_title": "Junior Business/Data Analyst",
    "salary_year_avg": "72000.0",
    "skills": "sql"
  },
  {
    "job_id": 432310,
    "company_name": "Get It Recruit - Transportation",
    "job_title": "Junior Business/Data Analyst",
    "salary_year_avg": "72000.0",
    "skills": "nosql"
  },
  {
    "job_id": 1264889,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 1264889,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 1264889,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "skills": "vba"
  },
  {
    "job_id": 1264889,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_id": 1264889,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1264889,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "visual basic"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "word"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1441940,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "skills": "ms access"
  },
  {
    "job_id": 616124,
    "company_name": "Get It Recruit - Finance",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_id": 616124,
    "company_name": "Get It Recruit - Finance",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_id": 616124,
    "company_name": "Get It Recruit - Finance",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "skills": "tableau"
  },
  {
    "job_id": 616124,
    "company_name": "Get It Recruit - Finance",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "skills": "power bi"
  },
  {
    "job_id": 902110,
    "company_name": "Phoenix Capital Group Holdings LLC",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "52500.0",
    "skills": "julia"
  },
  {
    "job_id": 902110,
    "company_name": "Phoenix Capital Group Holdings LLC",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "52500.0",
    "skills": "phoenix"
  },
  {
    "job_id": 902110,
    "company_name": "Phoenix Capital Group Holdings LLC",
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  }
]
*/