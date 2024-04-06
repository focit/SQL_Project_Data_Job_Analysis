import numpy as np
import matplotlib.pyplot as plt

# Datos
habilidades = ['excel', 'sql', 'tableau', 'python', 'power bi', 'sharepoint', 'sheets', 'vba', 'confluence', 'jira', 'julia', 'ms access', 'nosql', 'phoenix', 'powerpoint', 'r', 'visual basic', 'word']
cantidad_trabajos = [7, 7, 4, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

# Crea el gráfico de barras
plt.figure(figsize=(12, 6))
plt.bar(habilidades, cantidad_trabajos, color='skyblue')

# Añade etiquetas y título
plt.xlabel('Habilidades')
plt.ylabel('Frecuencia')
plt.title('Conteo de Habilidades para el Top 10 trabajos para analista de datos junior en 2023')

# Rotación de etiquetas para una mejor legibilidad
plt.xticks(rotation=45, ha='right')

# Muestra el gráfico
plt.tight_layout()
plt.show()