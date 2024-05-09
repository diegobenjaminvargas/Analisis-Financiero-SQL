# Analisis-Financiero-SQL
## Resumen
Este proyecto consiste en un análisis financiero sobre préstamos que concede una empresa en diferentes establecimientos para la adquisición de productos. Se trata de una práctica para hacer consultas a una base de datos SQL. 

## Objetivos
1. Desarrollaremos un **modelo de Entidad-Relación**, donde indiquemos las entidades, atributos, relaciones y cardinalidad entre las tablas de nuestro Dataset, seguido del **modelo Lógico**.
2. Realizaremos algunas consultas que nos ayudarán a explorar y estudiar el estado de nuestros datos para obtener una visión general del Dataset.
3. Haremos un análisis financiero enfocándonos, por último, en el porcentaje de devoluciones por país y comercio.
4. Crearemos un reporte donde dividamos los objetivos en ejercicios distintos y estudiemos los hallazgos o *insights* que obtengamos.

## Herramientas
- SQL
- [MySQL Workbench](https://www.mysql.com/products/workbench/)

## Descripción de archivos y Dataset
Los archivos adjuntos están conformados por:
- Carpeta titulada 'Data' que contiene nuestro Dataset:
  - 'refunds.csv'
  - 'orders.csv'
  - merchants.csv'
- Archivo `.sql`, que contiene las *queries* o consultas realizadas para la práctica
- Archivo `.pdf` que contiene el reporte de análisis financiero   

## Contexto de la práctica
Una empresa financia las compras de clientes de los comercios con los que trabaja, teniendo éstos que devolverlos durante un periodo posterior a la compra. 

Algunos de los establecimientos con los que trabaja esta empresa financiera son:
- Adidas
- Amazon
- Apple
- Balenciaga
- Calcedonia
- Disney +
- Element

Éstos y otros comercios se recogen en la tabla **merchants**, dentro de nuestro Dataset. 

Las operaciones de préstamo se registran en la tabla **orders** y tienen un *status* en función del estado de la operación, que puede ser:
- *Active*: el préstamo aún está en plazo para ser pagado
- *Closed*: el cliente pagó el préstamo
- *Delinquent*: el cliente no pagó el préstamo y el plazo para pagar se ha pasado
- *Cancelled*: el préstamo, finalmente, no se realizó

Por otra parte, el cliente puede decidir no disfrutar el producto y devolverlo solo en los establecimientos que acepten devoluciones (no todos los *merchants* aceptan reembolsos). Por lo tanto, se cancela el pedido y se devuelve el importe al establecimiento, lo cual puede hacerse en uno o más pagos por parte del cliente. Esto se recoge en la tabla **refunds**. 

Préstamos que han sido reembolsados también pueden aparecer con status '*Closed*', además de '*Cancelled*'. 

En resumen, los datos a utilizar son 3, que se encuentran en archivos `.csv`:
- **Orders**
- **Refunds**
- **Merchants**
