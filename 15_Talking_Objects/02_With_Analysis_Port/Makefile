

run:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv top.sv -uvm1.2 -ddb -R -debug -usdb all \
-logfile ./sim/sim_shell.log -cov group -o ./sim/uvsim +usdbfile=./sim/vistal.usdb -coverdir ./sim/cov.cdb -v2


wave:
	uvd -d ./sim/uvsim.db -ucdb ./sim/uvsim.cdb -usdb ./sim/vista.usdb