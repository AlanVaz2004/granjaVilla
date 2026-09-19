# Granjavilla

### Intro
Nuestro personaje tiene una granja y se gana la vida cultivando plantas de distintas especies.

Para ello tiene que sembrar, regar y cosechar los cultivos de su granja. Después de la cosecha,  vende lo que cultivó, obteniendo ganancias en la forma de monedas de oro.

Todo el oro que obtiene por sus cosechas lo acumula.

Nuestro objetivo es construir un juego en el que podamos controlar al personaje, 
utilizando el teclado para moverlo alrededor del tablero. 

Definir casos de prueba y realizar los test correspondientes para los requerimientos dados.   
Al final del readme se encuantra un apartado sobre el testeo del juego.

En este juego consideramos tres especies: _maíz_, _trigo_ y _tomaco_. 

Contamos con imágenes en la carpeta assets para ilustrar el juego.
En los nombres de las imágenes, recordar que "corn" es maíz y "wheat" es trigo en inglés.
Además, se cuenta con dos opciones de imágenes para el personaje: "fplayer.png" y "mplayer.png", pero por supuesto, puede cambiarse por 
cualquier imagen que se desee.


De la granja se conocen los cultivos sembrados y si hay alguno en una parcela (posición) específica, como también los cultivos de una parcela dada. Además no deberían estár más en la granja una vez cosechados.

### Sembrar
Además de moverse, el personaje debe poder realizar las siguientes acciones:
- Al apretar la M siembra una semilla de maíz en su posición actual.
- Al apretar la T siembra una semilla de trigo en su posición actual.
- Al apretar la O siembra una semilla de tomaco en su posición actual.

El acto de sembrar crea una nueva planta, con estas características:  

| Planta | Situación al ser sembrada |
|---|---|
| **Maíz**   | Es una planta bebé, corresponde la imagen `corn_baby.png` |
| **Trigo**  | Está en etapa de evolución 0, corresponde la imagen `wheat_0.png` |
| **Tomaco** | Es una planta hecha y derecha, corresponde la imagen `tomaco.png` | 


**Atención**  
queda librado a cada quien si se permite, o no, que haya más de una planta en una misma posición. 
Vale cuidarse de no hacerlo al principio, y agregar la validación más adelante.  
_OJO_ si se pone en la misma posición p.ej. dos plantas de maíz, entonces al regarse se van a regar las dos, al cosecharse se van a cosechar las dos, etc, pero se va a mostrar una sola imagen, ya que la segunda quedará oculta


### Regar
Una vez sembrado un cultivo, para que crezca debe ser regado. 
Cuando presionamos la R, se  debe regar la planta que está en la misma posición que el personaje.
Si no hay una planta, tirar una excepción indicando "no tengo nada para regar".

Qué pasa cuando se riega una planta: 

| Planta | Efecto al ser regada |
|---|---|
| **Maíz**   | Si es bebé, pasa a adulta, y la imagen cambia a `corn_adult.png`. <br> Si ya es adulta, no hacer nada |
| **Trigo**  | Pasa a la etapa de evolución siguiente: de 0 a 1, de 1 a 2, de 2 a 3, de 3 vuelve a 0. <br> La imagen cambia a `wheat_x.png`, donde la x corresponde a la etapa de evolución. |
| **Tomaco** | Se mueve a la celda de arriba. <br> Si ya está en el borde de arriba  pasa abajo de todo  | 
  


## Cosecha
Las plantas adultas se pueden cosechar.
Cuando presionamos la C, se espera que se coseche la planta que se encuentra en la misma posición que el personaje.
Otra vez, si no hay ninguna planta, tirar una excepción indicando "no tengo nada para cosechar".

Si hay una planta, puede o no estar lista para la cosecha.
El _maíz_ está listo para la cosecha si es adulto, el _trigo_ si está en nivel de evolución 2 o más, el _tomaco_ siempre.

Si la planta está lista para la cosecha, se la cosecha, para luego poder venderla. Se debe recordar qué plantas se cosecharon y por lo tanto se pueden vender. El acto de cosechar una planta implica que desaparece del juego.  
Caso contrario, no se hace nada.

**Nota**  
Si hay varias plantas en el mismo lugar, puede ser que algunas estén para cosechar y otras no. OJO con eso.

**TIP**  
Buscar la docentación de Wollok game en http://www.wollok.org/documentacion/wollokdoc/ 
para saber cómo obtener los objetos que están en la misma posición que el personaje.
Ojo que al hacer eso, entre los objetos que encuentren puede estar el mismo personaje.

## Venta
Usando la letra V, se vende lo que se tenga para vender.
   
Al hacerlo, se obtiene el oro por cada planta vendida, de acuerdo a esta especificación:
- **Maíz**: 150 monedas por planta.
- **Trigo**: 100 monedas si está en etapa 2, 200 si está en etapa 3. La cuenta cheta es `(etapa - 1) * 100`.
- **Tomaco**: 80 monedas por planta.

el personaje debe acumular el oro y recordar cuánto obtuvo en total. Al presionar la barra espaciadora, queremos que  nos diga: cuántas plantas tiene para vender, y cuánto oro juntó en total.  
P.ej. "tengo 800 monedas, y 3 plantas para vender".

**Atenti**  
Una vez que vende lo que tiene para vender, obviamente, deja de tenerlo.

## Bonus

### Aspersores
Al presionar la tecla A, hacer que el personaje deje un aspersor donde se encuentra. El aspersor (imagen `aspersor.png`) tiene la capacidad de regar las plantas que tiene alrededor, o sea en las posiciones limítrofes a donde se encuentra el aspersor, _automáticamente cada 1 segundo_.

**Nota**  
Pensar en los objetos que _podrían_ ser regados por el aspersor: ¿Qué pasa si el personaje se queda al lado? ¿Y si hay otro aspersor? 

**TIP**  
Buscar la docentación de Wollok game en http://www.wollok.org/documentacion/wollokdoc/ cómo manejar eventos temporales.

### Varios mercados
Incluir dos o tres mercados (imagen `market.png`), eligiendo dónde poner cada uno en el tablero. 
Cada mercado tiene una cantidad de monedas, y mercadería para vender.  
Hacer que  solamente se pueda vender si e personaje está en un mercado, y además el mercado tiene suficiente cantidad de monedas para pagar lo que el personaje tiene para vender. En tal caso, la mercadería se agrega al mercado, y se le descuentan las monedas que le da al personaje en pago.  

## TESTEO DE JUEGOS
Aclaración: Al no poder testearse los onTick, onPressDo etc. se simula testeando el modelo, o sea, las ordenes que se usan en dichos bloques de código.
