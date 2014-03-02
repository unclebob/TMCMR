.PHONY: all clean

all: clean TMCMR.jar

clean:
	rm -rf bin TMCMR.jar .src.lst

TMCMR.jar:
	rm -rf bin TMCMR.jar
	cp -r src bin
	find src -name *.java >.src.lst
	javac -d bin @.src.lst
	mkdir -p bin/META-INF
	echo 'Version: 1.0' >bin/META-INF/MANIFEST.MF
	echo 'Main-Class: togos.minecraft.maprend.RegionRenderer' >>bin/META-INF/MANIFEST.MF
	cd bin ; zip -r ../TMCMR.jar . ; cd ..
