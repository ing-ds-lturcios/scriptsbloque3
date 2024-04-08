#!/bin/bash

if [ "$#" -eq 0 ]; then
    ARCHIVO_CSV="/workspaces/scriptsbloque3/ventas.csv"
else
    ARCHIVO_CSV="$1"
fi

ARCHIVO_SALIDA=$(echo /workspaces/scriptsbloque3/$(date +%Y%m%d-%H%M%S).txt)

if [ ! -f "$ARCHIVO_CSV" ]; then
  printf "Archivo No Encontrado:\t%s\n" "$ARCHIVO_CSV" >> "$ARCHIVO_SALIDA"
  printf "Ejecucion cancelada  :\t$(date)\n" >> "$ARCHIVO_SALIDA"
  exit
fi

declare -A ventas
declare -A clientes
declare -A productos
declare -A meses

cliente_max_visitas=0
cliente_frecuente=""
producto_mayor_ventas=0
producto_mas_vendido=""
total_anual=0

meses[01]="Enero     "
meses[02]="Febrero   "
meses[03]="Marzo     "
meses[04]="Abril     "
meses[05]="Mayo      "
meses[06]="Junio     "
meses[07]="Julio     "
meses[08]="Agosto    "
meses[09]="Septiembre"
meses[10]="Octubre   "
meses[11]="Noviembre "
meses[12]="Diciembre "

get_month() {
 echo $1 | cut -d "-" -f 2
}

while IFS=',' read -r fecha cantidad producto total cliente; do
  month=$(get_month "$fecha")
  
  ventas[$month]=$((${ventas[$month]:-0} + total))
  total_anual=$(($total_anual+total))
 
  clientes[$cliente]=$((${clientes[$cliente]:-0} + 1))
 
  if [[ clientes[$cliente] -gt $cliente_max_visitas ]]; then
    cliente_max_visitas=$(($cliente_max_visitas+1))
    cliente_frecuente=$clientes[$cliente]
  fi

  productos[$producto]=$((${productos[$producto]:-0} + cantidad))
 
  if [[ productos[$producto] -gt $producto_mayor_ventas ]]; then
    producto_mayor_ventas=${productos[$producto]}
    producto_mas_vendido=$productos[$producto]
  fi
done < "$ARCHIVO_CSV"

for key in "${!ventas[@]}" ; do
  printf "%s-%s\t$%s\n" "$key" "${meses[$key]}" "${ventas[$key]}"
done | sort > "$ARCHIVO_SALIDA"

echo -e "-------------\nVenta Anual :\t\$$total_anual" >> "$ARCHIVO_SALIDA"
echo -e "-------------\nCliente Top :\t$cliente_frecuente" >> "$ARCHIVO_SALIDA"
echo -e "-------------\nProducto Top:\t$producto_mas_vendido" >> "$ARCHIVO_SALIDA"
echo -e "-------------\nHora Reporte:\t$(date)" >> "$ARCHIVO_SALIDA"
