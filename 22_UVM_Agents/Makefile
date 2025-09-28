
run:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f tb.f -f dut.f -top top -uvm1.2 -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log -cov group  \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -coverdir ./sim/uvsim.cdb -v2

wave:
	uvd -d ./sim/uvsim.db -ucdb ./sim/uvsim.cdb -usdb ./sim/vista.usdb
