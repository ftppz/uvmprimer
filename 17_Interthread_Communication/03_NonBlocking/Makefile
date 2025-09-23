

run:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -fsv.f -top top -uvm1.2 -ddb -R -debug -usdb all \
-logfile ./sim/sim_shell.log -o ./sim/uvsim +usdbfile=./sim/vistal.usdb -v2

wave:
	uvd -d ./sim/uvsim.db -usdb ./sim/vista.usdb