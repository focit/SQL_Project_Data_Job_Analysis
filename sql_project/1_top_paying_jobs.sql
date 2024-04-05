/*
Pregunta: ¿Cuáles son los mejores trabajos pagados en análisis de datos?
- Identificar el top 20 de los trabajos mejor pagados con el rol de Análisis de datos junior que están disponibles de forma remota o en México.
- Enfocarse en ofertas de trabajo que especifiquen salarios (eliminaro nulos).
- ¿Por qué? Existe una gran oportunidad de trabajos bien remunerados en Análisis de datos de forma remota y que estén en México.
*/

SELECT
    job_id,
    company_dim.name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title LIKE '%Junior%Data Analyst%' AND
    job_location IN ('Anywhere','Mexico') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*
Conclusiones: Basándonos en estos insights, podemos concluir que los mejores trabajos pagados en análisis de datos en esta lista son los que ofrecen salarios más altos,
es decir, alrededor de $80,000 por año. En este caso, los trabajos ofrecidos por "Coders Data" y "Motion Recruitment" son los que tienen el salario más alto. Sin embargo, es importante
tener en cuenta que estos datos son específicos de la muestra proporcionada y pueden variar según la ubicación, la experiencia y otros factores.
[
  {
    "job_id": 564679,
    "name": "Coders Data",
    "job_title": "Junior Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "80000.0",
    "job_posted_date": "2023-10-09 20:01:53"
  },
  {
    "job_id": 550113,
    "name": "Motion Recruitment",
    "job_title": "Junior Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "80000.0",
    "job_posted_date": "2023-06-20 07:01:39"
  },
  {
    "job_id": 156786,
    "name": "Patterned Learning AI",
    "job_title": "Junior Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75000.0",
    "job_posted_date": "2023-07-26 07:02:26"
  },
  {
    "job_id": 1321085,
    "name": "Patterned Learning AI",
    "job_title": "Junior Data Analyst - US/Canada",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75000.0",
    "job_posted_date": "2023-07-20 07:00:27"
  },
  {
    "job_id": 432310,
    "name": "Get It Recruit - Transportation",
    "job_title": "Junior Business/Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "72000.0",
    "job_posted_date": "2023-07-28 09:00:20"
  },
  {
    "job_id": 1264889,
    "name": "Get It Recruit - Information Technology",
    "job_title": "Junior Reporting Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "70000.0",
    "job_posted_date": "2023-07-08 10:00:04"
  },
  {
    "job_id": 1441940,
    "name": "Get It Recruit - Information Technology",
    "job_title": "Junior Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "65000.0",
    "job_posted_date": "2023-07-22 08:01:52"
  },
  {
    "job_id": 143739,
    "name": "TalentKompass Deutschland",
    "job_title": "Junior Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-05-31 07:37:04"
  },
  {
    "job_id": 616124,
    "name": "Get It Recruit - Finance",
    "job_title": "Junior Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-09-16 19:03:22"
  },
  {
    "job_id": 902110,
    "name": "Phoenix Capital Group Holdings LLC",
    "job_title": "Junior Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "52500.0",
    "job_posted_date": "2023-02-24 18:00:55"
  }
]
*/