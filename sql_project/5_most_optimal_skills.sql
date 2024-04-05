/*
Pregunta: ¿cuáles son las habilidades más óptimas para aprender (también conocidas como alta demanda y habilidad bien remunerada)?
- Identificar habilidades con alta demanda y salarios promedio más altos asociados para roles de Analista de Datos.
- Concertrarse en puestos remotos con salarios específicos.
- ¿Por qué? Se dirige a las habilidades que ofrecen seguridad laboral (alta demanda) y beneficios financieros (salarios altos),
ofreciendo información estratégica para el desarrollo profesional en el análisis de datos.
*/
WITH demand_skills AS (
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(job_postings_fact.job_id) AS demand_skills
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
), avg_salary AS (
SELECT
    skills_dim.skill_id,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
)

SELECT
    demand_skills.skill_id,
    skills,
    demand_skills,
    avg_salary
FROM demand_skills
INNER JOIN avg_salary ON demand_skills.skill_id = avg_salary.skill_id
WHERE demand_skills > 10
ORDER BY avg_salary DESC,
        demand_skills DESC

-- Forma más simple de realizar la búsqueda
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(job_postings_fact.job_id) AS demand_skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
HAVING count(job_postings_fact.job_id) > 10
ORDER BY avg_salary DESC

/*
Conclusiones: 
Si estás interesado en convertirte en un analista de datos y estás buscando orientación sobre qué habilidades aprender,
aquí hay algunos insights basados en la tabla proporcionada:

- Habilidades de programación:

Python: Es una de las habilidades más solicitadas y mejor remuneradas en el análisis de datos,
con una alta demanda de 236 menciones y un salario promedio de $101,397.
Aprender Python te permitirá realizar tareas de manipulación de datos, 
análisis estadístico y creación de modelos predictivos.

R: Otra habilidad de programación popular en el análisis de datos, 
con una demanda de 148 menciones y un salario promedio de $100,499. 
R es ampliamente utilizado para análisis estadístico y visualización de datos.

- Habilidades en bases de datos y big data:

SQL: Es una habilidad fundamental en el análisis de datos, con una demanda masiva de 398 menciones 
y un salario promedio de $97,237. Aprender SQL te permitirá consultar bases de datos, realizar análisis de datos 
y extraer información útil.

Hadoop: Aunque tiene una demanda más moderada con 22 menciones, Hadoop ofrece un salario promedio de $113,193. 
Aprender Hadoop te permitirá trabajar con grandes volúmenes de datos y realizar análisis distribuidos.

- Habilidades en herramientas de visualización de datos:

Tableau: Es una de las herramientas líderes en visualización de datos, con una demanda de 230 menciones y un salario promedio de $99,288.
Aprender Tableau te permitirá crear visualizaciones efectivas y comunicar tus hallazgos de manera clara.

Power BI: Con una demanda de 110 menciones y un salario promedio de $97,431, Power BI también es una herramienta valiosa
para la visualización de datos y el análisis empresarial.

- Habilidades en plataformas en la nube:

Azure y AWS: Tanto Azure como AWS son plataformas en la nube ampliamente utilizadas, con demandas sólidas y salarios promedio
competitivos. Aprender a trabajar con estas plataformas te permitirá almacenar, procesar y analizar datos en la nube.

En resumen, para convertirte en un analista de datos, sería beneficioso aprender habilidades en programación (como Python y R),
bases de datos (como SQL y Hadoop), herramientas de visualización de datos (como Tableau y Power BI)
y plataformas en la nube (como Azure y AWS). 

[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_skills": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_skills": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_skills": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_skills": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_skills": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_skills": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_skills": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_skills": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_skills": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_skills": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_skills": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_skills": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_skills": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_skills": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_skills": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_skills": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_skills": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_skills": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_skills": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_skills": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_skills": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_skills": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_skills": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_skills": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_skills": "20",
    "avg_salary": "97587"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_skills": "110",
    "avg_salary": "97431"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_skills": "398",
    "avg_salary": "97237"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_skills": "28",
    "avg_salary": "97200"
  },
  {
    "skill_id": 201,
    "skills": "alteryx",
    "demand_skills": "17",
    "avg_salary": "94145"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_skills": "24",
    "avg_salary": "92170"
  },
  {
    "skill_id": 198,
    "skills": "outlook",
    "demand_skills": "13",
    "avg_salary": "90077"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_skills": "24",
    "avg_salary": "88783"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_skills": "58",
    "avg_salary": "88701"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_skills": "256",
    "avg_salary": "87288"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_skills": "32",
    "avg_salary": "86088"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_skills": "48",
    "avg_salary": "82576"
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "demand_skills": "18",
    "avg_salary": "81634"
  }
]
*/