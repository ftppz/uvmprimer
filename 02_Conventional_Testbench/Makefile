#!/bin/sh

VERB=UVM_LOW
SEED=1
TEST ?=test
TB=top

COVERAGE_DIR = sim/coverage
MERGECOV = mergecov 
MERGED_COVERAGE_UCDB = merged_coverage.ucdb

all:comp run_vcs

comp:clean
	cd ./sim &&\
	vcs -full64 -sverilog -fsdb -debug_access+all -lca -kdb -ntb_opts \
	uvm -cm line+cond+fsm  -cm_dir ${COVERAGE_DIR}/${TEST}_${SEED} \
	+nospecify  \
	-timescale=1ns/1ns \
	-f ../tb.f \
	-f ../dut.f \
	-l comp.log \


$(COVERAGE_DIR):
	mkdir -p ${COVERAGE_DIR}

run_vcs:$(COVERAGE_DIR) 
	./sim/simv +UVM_TESTNAME=${TEST} \
	+UVM_VERBOSITY=${VERB} \
	+ntb_random_seed=${SEED} \
	-cm line+cond+fsm -cm_count \
	-l ./${TEST}.log -coverage \
	-fsdbfile ./sim/sim.fsdb


verdi:
	cd ./sim &&\
	verdi \
	-sv \
	-uvm \
	-f ../tb.f \
	-f ../dut.f \
	-top ${TB} \
	-nologo \
	+UVM_TESTNAME = ${TEST} \
	-ssf ./sim.fsdb 

cov:
	cd ./sim &&\
	urg -full64 -format both -report coverage -dir ${COVERAGE_DIR}/*.vdb -dbname merged.vdb &&\
	verdi \
	-f ../tb.f \
	-f ../dut.f \
	-top ${TB} \
	-cov -covdir merged.vdb

editcov:
	cd ./sim &&\
	urg -full64 -format both -report coverage -dir ${COVERAGE_DIR}/*.vdb -dbname merged.vdb &&\
	dve -full64 -cov -covdir merged.vdb



clean:
	cd ./sim &&\
	rm -rf *.log *.dat *.fsdb *.key *.h ${COVERAGE_DIR} csrc ${LOG_DIR} simv.daidir sim \
	simv DVEfiles verdiLog *.conf *.rc


run:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f dut.f -f tb.f -top top -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log -cov group \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -coverdir ./sim/uvsim.cdb -v2


wave:
	uvd -d ./sim/uvsim.db -ucdb ./sim/uvsim.cdb -usdb ./sim/vista.usdb
