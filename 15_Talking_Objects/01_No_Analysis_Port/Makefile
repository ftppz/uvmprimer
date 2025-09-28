OUT_PATH := /home/fflu/uvmprimer/15_Talking_Objects/01_No_Analysis_Port/out

run:
	rm -rf ./out && \
	mkdir ./out && \
	uvs -sv top.sv -uvm1.2 -ddb -R -debug -usdb all \
-logfile ./out/sim_shell.log -cov group -o ./out/uvsim +usdbfile=./out/vista.usdb -coverdir ./out/cov.cdb -v2


wave:
	uvd -d ./out/uvsim.db -ucdb ./out/uvsim.cdb -usdb ./out/vista.usdb
