#!/bin/bash

# Función para crear el archivo HTML con CSS
create_html() {
  # Variables por defecto
  filename="example.html"
  font_family="Arial, sans-serif"
  grid_gap="10px"
  grid_columns="1fr 1fr"
  text_size="1rem"
  display_type="grid"
  flex_direction="row"
  flex_wrap="nowrap"
  justify_content="flex-start"
  align_items="stretch"
  align_content="flex-start"

  # Solicitar al usuario si desea cambiar las variables por defecto
  echo "¿Deseas personalizar alguna variable? (y/n)"
  read -r customize
  if [ "$customize" = "y" ]; then
    echo -r "Introduce el nombre del archivo HTML (incluyendo extensión, e.g., example.html):"
    read -r filename

    echo "Introduce la fuente de texto (por defecto: Arial, sans-serif):"
    read -r font_family

    echo "Introduce el espacio entre las celdas (por defecto: 10px):"
    read -r grid_gap

    echo "Introduce las columnas de la cuadrícula (por defecto: 1fr 1fr):"
    read -r grid_columns

    echo "Introduce el tamaño de texto (por defecto: 1rem):"
    read -r text_size

    echo "¿Deseas utilizar CSS Grid o Flexbox? (grid/flexbox, por defecto: grid):"
    read -r display_type

    if [ "$display_type" = "flexbox" ]; then
      echo "Introduce la dirección de los elementos flexibles (por defecto: row):"
      read -r flex_direction

      echo "Introduce la propiedad flex-wrap (por defecto: nowrap):"
      read -r flex_wrap

      echo "Introduce la propiedad justify-content (por defecto: flex-start):"
      read -r justify_content

      echo "Introduce la propiedad align-items (por defecto: stretch):"
      read -r align_items

      echo "Introduce la propiedad align-content (por defecto: flex-start):"
      read -r align_content
    fi
  fi

  # Utilizar echo para escribir el código HTML y CSS en el archivo
  cat <<EOL > "$filename"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Example</title>
    <style>
        body {
            font-family: $font_family;
        }

        .container {
            display: $display_type;
            grid-template-areas: 
                "head"
                "menu"
                "main"
                "foot";
            grid-template-columns: $grid_columns;
            gap: $grid_gap;
        }

        .item-1 {
            grid-area: head;
            background: blue;
            text-align: center;
            position: relative;
        }

        .item-2 {
            grid-area: menu;
            background: red;
            text-align: center;
            position: relative;
        }

        .item-3 {
            grid-area: main;
            background: green;
            text-align: center;
            position: relative;
        }

        .item-4 {
            grid-area: foot;
            background: orange;
            text-align: center;
            position: relative;
        }

        .content {
            text-align: center;
        }

        h1, h2, p {
            font-size: $text_size;
            margin: 10px 0;
        }

        img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="item item-1">
            <div class="content">
                <h1>Head Area</h1>
                <div class="text-above-image">Texto por encima de la imagen</div>
                <div class="image-container">
                    <img src="./img/news1.jpg" alt="Image 1">
                    <div class="text-inside-image">Texto dentro de la imagen</div>
                    <div class="text-inside-top-left">Texto arriba a la izquierda</div>
                    <div class="text-inside-top-right">Texto arriba a la derecha</div>
                    <div class="text-inside-bottom-left">Texto abajo a la izquierda</div>
                    <div class="text-inside-bottom-right">Texto abajo a la derecha</div>
                </div>
            </div>
        </div>
        <div class="item item-2">
            <div class="content">
                <h2>Menu Area</h2>
                <div class="image-container">
                    <img src="./img/news2.jpg" alt="Image 2">
                    <div class="text-inside-bottom-left">Texto abajo a la izquierda</div>
                    <div class="text-inside-bottom-right">Texto abajo a la derecha</div>
                    <div class="text-inside-top-left">Texto arriba a la izquierda</div>
                    <div class="text-inside-top-right">Texto arriba a la derecha</div>
                </div>
                <p>Some menu options here</p>
            </div>
        </div>
        <div class="item item-3">
            <div class="content">
                <h2>Main Content Area</h2>
                <div class "image-container">
                    <img src="./img/news3.jpg" alt="Image 3">
                    <div class="text-inside-bottom-left">Texto abajo a la izquierda</div>
                    <div class="text-inside-bottom-right">Texto abajo a la derecha</div>
                    <div class="text-inside-top-left">Texto arriba a la izquierda</div>
                    <div class="text-inside-top-right">Texto arriba a la derecha</div>
                </div>
                <p>Main content goes here</p>
            </div>
        </div>
        <div class="item item-4">
            <div class="content">
                <h2>Footer Area</h2>
                <div class "image-container">
                    <img src="./img/news4.jpg" alt="Image 4">
                    <div class="text-inside-bottom-left">Texto abajo a la izquierda</div>
                    <div class="text-inside-bottom-right">Texto abajo a la derecha</div>
                    <div class="text-inside-top-left">Texto arriba a la izquierda</div>
                    <div class="text-inside-top-right">Texto arriba a la derecha</div>
                </div>
                <p>Footer content here</p>
            </div>
        </div>
    </div>
</body>
</html>
EOL

  # Verificar si se creó el archivo exitosamente
  if [ -e "$filename" ]; then
    echo "Archivo '$filename' creado exitosamente."
  else
    echo "Error al crear el archivo."
  fi
}

# Llamar a la función para crear el archivo HTML
create_html
