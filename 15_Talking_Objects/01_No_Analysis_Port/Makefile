
uvs:
	rm -rf ./out && \
	mkdir ./out && \
	uvs -sv top.sv -uvm1.2 -ddb -R -debug -usdb all \
	-logfile ./out/sim_shell.log -cov group -o ./out/uvsim +usdbfile=./out/vista.usdb -coverdir ./out/cov.cdb -v2

uvd:
	uvd -d ./out/uvsim.db -ucdb ./out/uvsim.cdb -usdb ./out/vista.usdb
