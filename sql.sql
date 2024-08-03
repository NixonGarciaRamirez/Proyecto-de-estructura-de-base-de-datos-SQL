
CREATE SCHEMA `motos` DEFAULT CHARACTER SET utf8;

CREATE TABLE `motos`.`tiendas` (
  `id_tiendas` INT NOT NULL,
  `nombre_tienda` VARCHAR(255) NOT NULL,
  `telefono_tienda` VARCHAR(25) NULL,
  `correo_tienda` VARCHAR(255) NULL,
  `direccion_tienda` VARCHAR(255) NULL,
  `ciudad` VARCHAR(255) NULL,
  `estado` VARCHAR(10) NULL,
  PRIMARY KEY (`id_tiendas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Esta tabla mostrara la información base de las iendas como el telefono, la dirccion o el estado (si esta en funcionamiento (1) o cerro (0))';


CREATE TABLE `motos`.`personal` (
  `id_personal` INT NOT NULL,
  `nombre_personal` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo_personal` VARCHAR(255) NOT NULL,
  `telefono_personal` VARCHAR(25) NULL,
  `activo` TINYINT(10) NOT NULL,
  `id_tienda` INT NOT NULL,
  `id_manager` INT NULL,
  PRIMARY KEY (`id_personal`),
  UNIQUE INDEX `correo_personal_UNIQUE` (`correo_personal` ASC) VISIBLE,
  INDEX `id_tiendas_idx` (`id_tienda` ASC) VISIBLE,
  CONSTRAINT `id_tiendas`
    FOREIGN KEY (`id_tienda`)
    REFERENCES `motos`.`tiendas` (`id_tiendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `motos`.`clientes` (
  `id_clientes` INT NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(25) NULL,
  `correo` VARCHAR(255) NOT NULL,
  `direccion` VARCHAR(255) NULL,
  `ciudad` VARCHAR(50) NULL,
  PRIMARY KEY (`id_clientes`));

CREATE TABLE `motos`.`ordenes` (
   `id_ordenes` INT NOT NULL,
   `id_cliente` INT,
   `estado_orden` TINYINT(10) NOT NULL,
   -- Estado orden: 1 = pendiente; 2 = en proceso; 3 = rechazado; 4 = completado
   `fecha_orden` DATE NOT NULL,
   `fecha_requerida` DATE NOT NULL,
   `fecha_envio` DATE ,
   `id_tienda` INT NOT NULL,
   `id_personal` INT NOT NULL,
   PRIMARY KEY (`id_ordenes`),
   FOREIGN KEY (`id_cliente`)
		   REFERENCES `motos`.`clientes` (`id_clientes`)
           ON DELETE CASCADE 
           ON UPDATE CASCADE,
   FOREIGN KEY (`id_tienda`)
		   REFERENCES `motos`.`tiendas` (`id_tiendas`)
           ON DELETE CASCADE
           ON UPDATE CASCADE,
   FOREIGN KEY (`id_personal`)
		   REFERENCES `motos`.`personal` (`id_personal`)
           ON DELETE CASCADE
           ON UPDATE CASCADE  
);



CREATE TABLE `motos`.`articulos_ordenados`(
   `id_articulos_ordenados` INT NOT NULL,
   `id_articulo` INT,
   `id_producto` INT NOT NULL,
   `cantidad` INT NOT NULL,
   `precio_lista` DECIMAL(10,2) NOT NULL,
   `descuento` DECIMAL(4,2) NOT NULL DEFAULT 0,
   PRIMARY KEY (`id_articulos_ordenados` , `id_articulo`),
   FOREIGN KEY (`id_articulos_ordenados`)
           REFERENCES `motos`.`ordenes` (`id_ordenes`)
           ON DELETE CASCADE
           ON UPDATE CASCADE,
   FOREIGN KEY (`id_producto`)
           REFERENCES `produccion`.`productos` (`id_productos`)
           ON DELETE CASCADE
           ON UPDATE CASCADE
);



CREATE SCHEMA `produccion` DEFAULT CHARACTER SET utf8;

CREATE TABLE `produccion`.`categorias` (
  `id_categorias` INT NOT NULL,
  `nombre_categoria` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_categorias`));
  
CREATE TABLE `produccion`.`marca` (
  `id_marca` INT NOT NULL,
  `nombre_marca` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_marca`));

CREATE TABLE `produccion`.`productos` (
  `id_productos` INT NOT NULL,
  `nombre_producto` VARCHAR(255) NOT NULL,
  `id_marca` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  `modelo_año` SMALLINT NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_productos`),
  INDEX `id_categorias_idx` (`id_categoria` ASC) VISIBLE,
  INDEX `id_marcas_idx` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `id_categorias`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `produccion`.`categorias` (`id_categorias`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_marcas`
    FOREIGN KEY (`id_marca`)
    REFERENCES `produccion`.`marca` (`id_marca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE `produccion`.`stocks`(
   `id_tienda` INT,
   `id_producto` INT,
   `cantidad` INT,
   PRIMARY KEY (`id_tienda`, `id_producto`),
   FOREIGN KEY (`id_tienda`)
		   REFERENCES `motos`.`tiendas` (`id_tiendas`)
           ON DELETE CASCADE
           ON UPDATE CASCADE,
   FOREIGN KEY (`id_producto`)
		   REFERENCES `produccion`.`productos` (`id_productos`)
           ON DELETE CASCADE
           ON UPDATE CASCADE
);
