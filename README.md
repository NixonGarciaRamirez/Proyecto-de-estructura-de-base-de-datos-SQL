# SQL Database Structure Project / Proyecto de estructura de base de datos en SQL  :hourglass: :computer: :floppy_disk:

## Description

This is a practice project in which a database structure is created with a series of independent tables interconnected by foreign keys.

This project is the basic representation of a purchase order structure for a motorcycle distributor, which has 2 databases:

* "Motorcycles" database: This is the database that contains information on customers, orders, store personnel and stores. It has the following independent tables:
  - The motorcycles.store table contains store information. Each store has a store name, contact information such as phone and email, and an address including street, city, state, and zip code.
  - The motorcycles.staff table stores essential staff information including first and last name. It also contains communication information such as email and phone.
  - The motorcycles.customers table stores customer information including first name, last name, phone, email, street, city, state, and zip code.
  - The motorcycles.orders table stores customers' order information including customer, order status, order date, required date, and shipping date.
  - The motorcycles.ordered_items table stores items in a sales order. Each item belongs to a sales order specified by the order_id column.

* "Production" database: This is the database that contains information on the products handled by the company, the brand of each product, its category and the stock. This database has the following tables:
  - The production.categories table stores categories of bicycles, such as children's bicycles, comfort bicycles, and electric bicycles.
  - The production.brands table stores information about the bicycle brand, for example, Electra, Haro, and Heller.
  - The production.products table stores product information, such as name, brand, category, model year, and list price.
  - The production.stocks table stores inventory information, that is, the quantity of a particular product in a specific store.
 
Something to highlight is that the stock and ordered items tables are the tables that allow the union and interaction between the 2 databases of "motorcycles" and "production" allowing the information to be analyzed together, in this way you can know the brands available by stores or the main orders according to the category of the products.

## Schematic representation of the database



## Descripción

Este es un proyecto de practica en el cual se crea una estructura de base de datos con una serie de tabla independientes interconectadas entre mediante llaves foraneas.

Este proyecto es la representacion basica de una estructura de ordenenes de compras para una distribuidora de motos, la cual cuenta con 2 bases de datos:

* Base de datos "motos": Esta es la base de datos que cuenta con la informacion de los clientes, ordenes el perosnal de las tiendas y las tiendas, esta cuenta con las siguientes tablas independientes:
  -  La tabla motos.tienda incluye la información de la tienda. Cada tienda tiene un nombre de tienda, información de contacto como teléfono y correo electrónico, y una dirección que incluye calle, ciudad, estado y código postal.
  -  La tabla motos.personal almacena la información esencial del personal, incluido el nombre y el apellido. También contiene información de comunicación como correo electrónico y teléfono.
  -  La tabla motos.clientes almacena la información del cliente, incluyendo nombre, apellido, teléfono, correo electrónico, calle, ciudad, estado y código postal.
  -  La tabla motos.ordenes almacena la información de la orden del pedido de los clientes, incluido el cliente, el estado del pedido, la fecha del pedido, la fecha requerida y la fecha de envío.
  -  La tabla motos.articulos_ordenados almacena los artículos de un pedido de ventas. Cada artículo pertenece a un pedido de ventas especificado por la columna order_id.

* Base de datos "produccion": Esta es la base de datos que cuenta con la informacion de los productos que se manejan en la empresa, la marca de cada producto, la categoria de este y el stocks, esta base de datos cuenta con las siguientes tablas:
  - La tabla produccion.categorias almacena las categorías de bicicletas, como bicicletas para niños, bicicletas de confort y bicicletas eléctricas.
  - La tabla produccion.marcas almacena la información de la marca de bicicletas, por ejemplo, Electra, Haro y Heller.
  - La tabla produccion.productos almacena la información del producto, como el nombre, la marca, la categoría, el año del modelo y el precio de lista.
  - La tabla produccio.stocks almacena la información de inventario, es decir, la cantidad de un producto en particular en una tienda específica. 

Algo a resaltar es que las tablas stocks y articulos ordenados son las tablas que permiten la union e inteccion entre las 2 bases de datos de "motos" y "produccion" permitiendo analizar la informacion en conjunto, de esa forma se puede saber las marcas disponibles por tiendas o las principales ordenes segun la categoria de los productos.

## Representacion esquematica de la base de datos
¡[Esquema de la base de datos](https://github.com/NixonGarciaRamirez/Proyecto-de-estructura-de-base-de-datos-SQL/blob/main/esquema.png)
