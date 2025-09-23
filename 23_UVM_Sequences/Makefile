

run-all:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f tb.f -f dut.f -top top -uvm1.2 -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log -cov group +UVM_TESTNAME=fibonacci_test \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -coverdir ./sim/uvsim.cdb -v2

run-par:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f tb.f -f dut.f -top top -uvm1.2 -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log -cov group +UVM_TESTNAME=parallel_test \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -coverdir ./sim/uvsim.cdb -v2

wave:
	uvd -d ./sim/uvsim.db -usdb ./sim/vista.usdb
