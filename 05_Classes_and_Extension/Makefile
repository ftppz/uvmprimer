

run-class:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f sv.f -top top_class -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -v2

run-rectangle:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f sv.f -top top_rectangle -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -v2

run-struct:
	rm -rf ./sim && \
	mkdir sim && \
	uvs -sv -f sv.f -top top_struct -ddb -usdbon -R -debug -usdb all \
-logfile ./sim/sim_shell.log \
-o ./sim/uvsim +usdbfile=./sim/vista.usdb -v2

wave:
	uvd -d ./sim/uvsim.db -usdb ./sim/vista.usdb
