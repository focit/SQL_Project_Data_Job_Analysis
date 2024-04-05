/* 
Pregunta: ¿Cuáles son las mejores habilidades con base en el salario?
- Buscar el promedio del salario con base en cada habilidad en Análisis de Datos.
- Enfocarse en roles con salarios específicos, independientemente de la ubicación.
- ¿Por qué? Revelar cómo las diferentes habilidades impactan los niveles salariales para el Análisis de Datos
y ayuda a identificar las habilidades más gratificantes financieramente para adquirir o mejorar.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25

/*
Conclusiones: El Top 5 habilidades mejor remuneradas en todos los trabajos pospuestos en Analisis de datos son PySpark, Bitbucket, Couchbase, Watson y DataRobot.
- PySpark, Couchbase y DataRobot son habilidades altamente remuneradas, lo que sugiere una demanda considerable en el campo de Big Data y análisis. 
- Habilidades como GitLab, Bitbucket y Jenkins están entre las mejores remuneradas. Esto indica la importancia de tener experiencia en sistemas de control de versiones y en la automatización de procesos de desarrollo.
- GCP y Kubernetes son habilidades bien remuneradas en el ámbito de la computación en la nube y la gestión de contenedores. A medida que las empresas continúan migrando sus aplicaciones a la nube, mejorar en estas
áreas puede conducir a oportunidades en arquitectura de infraestructura y administración de sistemas en la nube.
- Swift y Scala representan habilidades bien remuneradas en el desarrollo de software. Swift es particularmente valioso en el desarrollo de aplicaciones móviles para el ecosistema de Apple,
mientras que Scala se usa ampliamente en aplicaciones de alto rendimiento y sistemas distribuidos.
- Habilidades como Watson, scikit-learn y Jupyter están asociadas con el campo del aprendizaje automático y la ciencia de datos.
-PostgreSQL, Elasticsearch y Couchbase son habilidades altamente remuneradas relacionadas con la gestión de datos y bases de datos. 

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/