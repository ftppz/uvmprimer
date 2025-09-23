

run:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv modules.sv -top top -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -v2

wave:
	uvd -d ./sim/uvsim.db -usdb ./sim/vista.usdb
