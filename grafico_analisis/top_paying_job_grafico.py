import matplotlib.pyplot as plt
import json

data_json = '''
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
'''

# Carga los datos JSON
data = json.loads(data_json)

# Ordena los datos por salario en orden descendente
sorted_data = sorted(data, key=lambda x: float(x['salary_year_avg']), reverse=True)

# Extrae los nombres de las empresas y los salarios correspondientes de los 10 mejores trabajos
top_salaries = [(item['name'], float(item['salary_year_avg'])) for item in sorted_data[:10]]

# Extrae los nombres de las empresas y los salarios para el gráfico de barras
companies = [company for company, salary in top_salaries]
salaries = [salary for company, salary in top_salaries]

# Crea el gráfico de barras
plt.figure(figsize=(10, 6))
plt.barh(companies, salaries, color='skyblue')

# Añade etiquetas y título
plt.xlabel('Salario promedio anual (USD)')
plt.ylabel('Empresa')
plt.title('El promedio de salario anual para el Top 10 de trabajos para analista de datos junior en 2023')

# Muestra el gráfico
plt.gca().invert_yaxis()  # Invierte el eje y para que las empresas con los mejores salarios aparezcan arriba
plt.tight_layout()
plt.show()