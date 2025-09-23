

run:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f dut.f -f tb.f -top top -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log -cov group \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -coverdir ./sim/uvsim.cdb -v2


wave:
	uvd -d ./sim/uvsim.db -ucdb ./sim/uvsim.cdb -usdb ./sim/vista.usdb
