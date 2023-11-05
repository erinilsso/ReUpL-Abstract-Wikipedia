all: clean fetch insert_names build run
	@echo " -- All done. -- "

nofetch: clean insert_names build run
	@echo " -- All done. -- "

clean:
	@echo " -- Cleaning -- "
	rm -f Boroughs/gf/*.gfo
	rm -f *.gfo
	rm -f Boroughs/gf/*.pgf
	rm -rf Boroughs/python/__pycache__/

fetch:
	@echo " -- Fetching data -- "
	python3.8 Boroughs/python/updatetables.py 

insert_names:
	@echo " -- Inserting names -- "
	@python3.8 Boroughs/python/boroughsPre.py

build:
	@echo " -- Building -- "
	@cd Boroughs/gf; gf -make BoroughsEng.gf BoroughsSwe.gf BoroughsGer.gf

run:
	@echo " -- Running -- "
	touch Boroughs/data/res.txt
	python3.8 Boroughs/python/stage3.py > Boroughs/data/res.txt

web:
	python3.8 WebApp/run.py