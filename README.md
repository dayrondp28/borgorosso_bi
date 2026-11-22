# Borgorosso BI — Producto de datos (Databricks + dbt)

Arquitectura medallion: **bronze** (datos crudos) → **silver** (limpios y validados) → **gold** (modelo en estrella) → Power BI.

## Pasos
1. `pip install dbt-databricks`
2. Copiar `profiles.yml.example` a `~/.dbt/profiles.yml` y completar host, http_path y token (variable `DATABRICKS_TOKEN`).
3. `dbt debug`           → comprueba la conexión
4. `dbt seed`            → carga el Excel (CSV) a la capa bronze
5. `dbt run`             → construye silver y gold
6. `dbt test`            → ejecuta las pruebas de calidad y de totales
7. `dbt docs generate && dbt docs serve` → documentación y grafo de linaje
8. Power BI Desktop → Obtener datos → Azure Databricks → esquema `gold` → importar las 5 tablas
9. Crear las medidas de `powerbi/medidas_dax.txt`
