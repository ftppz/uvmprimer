SIM_OUT := ./sim

run-all:
	rm -rf ${SIM_OUT} && \
	mkdir $(SIM_OUT) && \
	uvs -sv -f tb.f -f dut.f -top top -uvm1.2 -ddb -usdbon -R -debug -usdb all \
-logfile ${SIM_OUT}/sim_shell.log -cov group +UVM_TESTNAME=full_test \
-o ${SIM_OUT}/uvsim +usdbfile=${SIM_OUT}/vista.usdb -coverdir ${SIM_OUT}/uvsim.cdb -v2

run-par:
	rm -rf ${SIM_OUT} && \
	mkdir $(SIM_OUT) && \
	uvs -sv -f tb.f -f dut.f -top top -uvm1.2 -ddb -usdbon -R -debug -usdb all \
-logfile ${SIM_OUT}/sim_shell.log -cov group +UVM_TESTNAME=parallel_test \
-o ${SIM_OUT}/uvsim +usdbfile=${SIM_OUT}/vista.usdb -coverdir ${SIM_OUT}/uvsim.cdb -v2

wave:
	uvd -d ${SIM_OUT}/uvsim.db -ucdb $(SIM_OUT)/uvsim.cdb -usdb $(SIM_OUT)/vista.usdb
	
convert:
	$(UVS_HOME)/bin/read_db_run -db ${SIM_OUT}/uvsim.cdb -cov group > $(SIM_OUT)/uvs_group_modinfo.txt
