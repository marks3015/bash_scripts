#!/bin/bash

echo "Digite o PID a ser verificado: "
read -r PID

echo "Digite o intervalo a ser verificado em segundos: "
read -r Intervalo

while true; do 
	if ps -p "$PID"; then
		echo "O processo $PID esta sendo executado"
	else 
		echo "O processo $PID nao esta sendo executado"
	fi
	sleep "$Intervalo" 
done


# o parametro -p em ps serve para especificar o processo
# se adicionarmos > dev/null depois de if ps -p "$PID" > nao teremos
# informacoes sobre o processo no terminal, apenas saberemos se esta sendo executado ou nao dada as condicionais que levam aos echos
# deixarei imprimindo as informacoes dos PID no terminal.
# o sleep pausa a execucao do script por um periodo de tempo em segundos antes 
# da proxima iteracao do loop while
# exemplo: "sleep 10" fara com com que o script espere por 10 segundos antes da proxima iteracao 
