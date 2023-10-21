#!/bin/bash

# Función para solicitar valores personalizados de CSS Grid
get_custom_grid_values() {
  echo "Introduce el número de filas:"
  read -r GRID_ROWS

  echo "Introduce el número de columnas:"
  read -r GRID_COLUMNS

  echo "Introduce el espacio entre las celdas (por ejemplo, '5px', '10px', etc.):"
  read -r GRID_GAP
}

# Función para generar el archivo HTML con CSS Grid personalizado
generate_grid_html() {
  cat <<EOF >grid_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.grid-container {
  display: grid;
  grid-template-rows: repeat($GRID_ROWS, 1fr);
  grid-template-columns: repeat($GRID_COLUMNS, 1fr);
  grid-gap: $GRID_GAP;
  height: 300px;
  border: 1px solid black;
}

.grid-item {
  width: 100px;
  height: 100px;
  background-color: lightgray;
}
</style>
</head>
<body>
<div class="grid-container">
EOF

  for ((i = 1; i <= GRID_ROWS * GRID_COLUMNS; i++)); do
    echo "  <div class=\"grid-item\">$i</div>" >>grid_example.html
  done

  cat <<EOF >>grid_example.html
</div>
</body>
</html>
EOF
}

# Función para modificar los valores de CSS Grid
modify_grid_values() {
  echo "¿Qué valor deseas modificar?"
  echo "1. Número de filas"
  echo "2. Número de columnas"
  echo "3. Espacio entre celdas"
  echo "4. Volver al menú anterior"

  read -n 1 -r MOD_OPTION
  echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

  case $MOD_OPTION in
    1)
      echo "Introduce el nuevo número de filas:"
      read -r GRID_ROWS
      generate_grid_html
      ;;

    2)
      echo "Introduce el nuevo número de columnas:"
      read -r GRID_COLUMNS
      generate_grid_html
      ;;

    3)
      echo "Introduce el nuevo espacio entre celdas (por ejemplo, '5px', '10px', etc.):"
      read -r GRID_GAP
      generate_grid_html
      ;;

    4)
      # Regresar al menú anterior
      return
      ;;

    *)
      echo "Opción inválida. Introduce un número del 1 al 4."
      ;;
  esac
}

# Función para generar el archivo HTML con CSS Flexbox personalizado
generate_flex_html() {
  cat <<EOF >flexbox_example.html
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
  display: $FLEX_DISPLAY;
  flex-direction: $FLEX_DIRECTION;
  flex-wrap: $FLEX_WRAP;
  justify-content: $JUSTIFY_CONTENT;
  align-items: $ALIGN_ITEMS;
  align-content: $ALIGN_CONTENT;
  height: 300px;
  border: 1px solid black;
}

.flex-item {
  width: 100px;
  height: 100px;
  margin: 10px;
  background-color: lightgray;
}
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item">1</div>
  <div class="flex-item">2</div>
  <div class="flex-item">3</div>
</div>
</body>
</html>
EOF
}

# Función para modificar los valores de Flexbox
modify_flex_values() {
  echo "¿Qué valor deseas modificar?"
  echo "1. Tipo de display para div"
  echo "2. Dirección de los elementos flexibles"
  echo "3. Propiedad flex-wrap"
  echo "4. Propiedad justify-content"
  echo "5. Propiedad align-items"
  echo "6. Propiedad align-content"
  echo "7. Volver al menú anterior"

  read -n 1 -r MOD_OPTION
  echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

  case $MOD_OPTION in
    1)
      echo "Introduce el nuevo tipo de display para div (por ejemplo, 'flex', 'block', 'inline-flex', etc.):"
      read -r FLEX_DISPLAY
      generate_flex_html
      ;;

    2)
      echo "Introduce la nueva dirección de los elementos flexibles ('row', 'row-reverse', 'column', 'column-reverse'):"
      read -r FLEX_DIRECTION
      generate_flex_html
      ;;

    3)
      echo "Introduce la nueva propiedad flex-wrap ('no-wrap', 'wrap', 'wrap-reverse'):"
      read -r FLEX_WRAP
      generate_flex_html
      ;;

    4)
      echo "Introduce la nueva propiedad justify-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around'):"
      read -r JUSTIFY_CONTENT
      generate_flex_html
      ;;

    5)
      echo "Introduce la nueva propiedad align-items ('flex-start', 'flex-end', 'center', 'stretch', 'baseline'):"
      read -r ALIGN_ITEMS
      generate_flex_html
      ;;

    6)
      echo "Introduce la nueva propiedad align-content ('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'):"
      read -r ALIGN_CONTENT
      generate_flex_html
      ;;

    7)
      # Regresar al menú anterior
      return
      ;;

    *)
      echo "Opción inválida. Introduce un número del 1 al 7."
      ;;
  esac
}

while true; do
  clear
  echo "Menú de Ejemplos de CSS:"
  echo "1. Ejemplo de CSS Grid"
  echo "2. Ejemplo de Flexbox"
  echo "3. Salir"

  read -n 1 -r OPTION
  echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

  case $OPTION in
    1)
      clear
      echo "Menú de Ejemplos de CSS Grid:"
      echo "1. Ver cuadrícula de 2x2"
      echo "2. Ver cuadrícula de 3x3"
      echo "3. Ver cuadrícula de 4x4"
      echo "4. Personalizar valores de la cuadrícula"
      echo "5. Modificar valores de la cuadrícula"
      echo "6. Volver al menú principal"

      read -n 1 -r GRID_OPTION
      echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

      case $GRID_OPTION in
        1)
          GRID_ROWS=2
          GRID_COLUMNS=2
          GRID_GAP="5px"
          generate_grid_html
          ;;

        2)
          GRID_ROWS=3
          GRID_COLUMNS=3
          GRID_GAP="10px"
          generate_grid_html
          ;;

        3)
          GRID_ROWS=4
          GRID_COLUMNS=4
          GRID_GAP="15px"
          generate_grid_html
          ;;

        4)
          get_custom_grid_values
          generate_grid_html
          ;;

        5)
          modify_grid_values
          ;;

        6)
          # Regresar al menú principal
          continue
          ;;

        *)
          echo "Opción inválida. Introduce un número del 1 al 6."
          ;;
      esac

      echo "Archivo HTML generado como 'grid_example.html'. Presiona Enter para continuar."
      read -r
      ;;

    2)
      clear
      echo "Menú de Ejemplos de Flexbox:"
      echo "1. Ejemplo de Flexbox con dirección 'row'"
      echo "2. Ejemplo de Flexbox con dirección 'row-reverse'"
      echo "3. Ejemplo de Flexbox con dirección 'column'"
      echo "4. Ejemplo de Flexbox con dirección 'column-reverse'"
      echo "5. Ejemplo de Flexbox con personalización de valores"
      echo "6. Ejemplo de Flexbox con display 'inline-flex'"
      echo "7. Modificar valores de Flexbox"
      echo "8. Volver al menú principal"

      read -n 1 -r FLEX_OPTION
      echo ""  # Agrega un salto de línea para que la siguiente salida no se mezcle

      case $FLEX_OPTION in
        1)
          FLEX_DISPLAY="flex"
          FLEX_DIRECTION="row"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        2)
          FLEX_DISPLAY="flex"
          FLEX_DIRECTION="row-reverse"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        3)
          FLEX_DISPLAY="flex"
          FLEX_DIRECTION="column"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        4)
          FLEX_DISPLAY="flex"
          FLEX_DIRECTION="column-reverse"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        5)
          get_custom_flex_values
          generate_flex_html
          ;;

        6)
          FLEX_DISPLAY="inline-flex"
          FLEX_DIRECTION="row"
          FLEX_WRAP="nowrap"
          JUSTIFY_CONTENT="flex-start"
          ALIGN_ITEMS="stretch"
          ALIGN_CONTENT="flex-start"
          generate_flex_html
          ;;

        7)
          modify_flex_values
          ;;

        8)
          # Regresar al menú principal
          continue
          ;;

        *)
          echo "Opción inválida. Introduce un número del 1 al 8."
          ;;
      esac

      echo "Archivo HTML generado como 'flexbox_example.html'. Presiona Enter para continuar."
      read -r
      ;;

    3)
      exit 0
      ;;

    *)
      echo "Opción inválida. Introduce un número del 1 al 3."
      ;;
  esac
done
