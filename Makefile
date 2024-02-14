LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

run: srw transpile.drawio.json
	./srw test.txt main srw.drawio $(LIBSRC)/transpile.drawio

srw: srw.drawio.json
	odin build . $(ODIN_FLAGS)

srw.drawio.json: srw.drawio transpile.drawio.json
	$(D2J) srw.drawio

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf srw srw.dSYM *~ *.json
