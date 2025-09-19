

run:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv example_pkg.sv top.sv -top top -uvm1.2 -ddb -R -debug -usdb all \
-logfile ./sim/sim_shell.log -cov group -covtest random_test -o ./sim/uvsim +usdbfile=./sim/vistal.usdb -coverdir ./sim/cov.cdb -v2
