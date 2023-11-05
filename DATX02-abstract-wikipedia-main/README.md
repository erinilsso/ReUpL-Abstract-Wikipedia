# DATX02-abstract-wikipedia
Multilingual Text Robots for Abstract Wikipedia.

## __Requirements__


### __Latest version of RGL__

Set environment variable to where you want to place the library. Preferable in ~/.bashrc or equivalent.
```
export GF_LIB_PATH="/path/to/lib"
```

Clone and build the latest version. Will be placed at `$GF_LIB_PATH`
```
git clone https://github.com/GrammaticalFramework/gf-rgl.git
cd gf-rgl
make
```

### __Python bindings__
```
pip install pgf
```

## __Commands__
To fetch data, insert, compile and run, just execute:
```
make
```
All steps can also be run individually:
```
make clean
make fetch
make insert_names
make build
make run
```