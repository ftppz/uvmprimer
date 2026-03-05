VERB = UVM_LOW
SEED = 1
TEST ?= test
TB = top

ROOT_DIR := $(CURDIR)
SIM_DIR = $(ROOT_DIR)/sim
TB_F = $(ROOT_DIR)/tb.f
DUT_F = $(ROOT_DIR)/dut.f
COVERAGE_DIR = $(SIM_DIR)/coverage

all: vcs_comp vcs_run

vcs_comp: clean
	mkdir -p $(SIM_DIR)
	vcs -full64 -sverilog -fsdb -debug_access+all -lca -kdb -ntb_opts \
	uvm -cm line+cond+fsm -cm_dir $(COVERAGE_DIR)/$(TEST)_$(SEED) \
	+nospecify \
	-timescale=1ns/1ns \
	-f tb.f \
	-f dut.f \
	-o $(SIM_DIR)/simv \
	-l $(SIM_DIR)/comp.log


$(COVERAGE_DIR):
	mkdir -p $(COVERAGE_DIR)

vcs_run: vcs_comp $(COVERAGE_DIR)
	$(SIM_DIR)/simv +UVM_TESTNAME=$(TEST) \
	+UVM_VERBOSITY=$(VERB) \
	+ntb_random_seed=$(SEED) \
	-cm line+cond+fsm -cm_count \
	-l $(SIM_DIR)/$(TEST).log -coverage \
	-fsdbfile $(SIM_DIR)/sim.fsdb


verdi:
	verdi \
	-sv \
	-uvm \
	-f tb.f \
	-f dut.f \
	-top $(TB) \
	-nologo \
	+UVM_TESTNAME=$(TEST) \
	-ssf $(SIM_DIR)/sim.fsdb

cov:
	urg -full64 -format both -report coverage -dir $(COVERAGE_DIR)/*.vdb -dbname $(SIM_DIR)/merged.vdb && \
	verdi \
	-f tb.f \
	-f dut.f \
	-top $(TB) \
	-cov -covdir $(SIM_DIR)/merged.vdb

editcov:
	urg -full64 -format both -report coverage -dir $(COVERAGE_DIR)/*.vdb -dbname $(SIM_DIR)/merged.vdb && \
	dve -full64 -cov -covdir $(SIM_DIR)/merged.vdb



clean:
	rm -rf $(SIM_DIR) tr_db.log vcdplus.vpd vc_hdrs.h csrc simv* ucli.key \
	verdiLog *.log *.conf *.rc *.fsdb


uvs:
	rm -rf $(SIM_DIR) && \
	mkdir -p $(SIM_DIR) && \
	uvs -sv -f $(DUT_F) -f $(TB_F) -top $(TB) -ddb -usdbon -R -debug -usdb all \
	-logfile $(SIM_DIR)/sim_shell.log -cov group \
	-o $(SIM_DIR)/uvsim +usdbfile=$(SIM_DIR)/vista.usdb -coverdir $(SIM_DIR)/uvsim.cdb -v2


uvd:
	uvd -d $(SIM_DIR)/uvsim.db -ucdb $(SIM_DIR)/uvsim.cdb -usdb $(SIM_DIR)/vista.usdb
