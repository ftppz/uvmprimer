

run:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f sv.f -top top -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -v2

wave:
	uvd -d ./sim/uvsim.db -usdb ./sim/vista.usdb
