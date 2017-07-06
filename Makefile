GCC_BIN=`xcrun --sdk iphoneos8.4 --find gcc`
GCC_UNIVERSAL=$(GCC_BASE) -arch armv7 -arch armv7s -arch arm64
SDK=`xcrun --sdk iphoneos8.4 --show-sdk-path`

CFLAGS = 
GCC_BASE = $(GCC_BIN) -Os $(CFLAGS) -Wimplicit -isysroot $(SDK) -F$(SDK)/System/Library/Frameworks -F$(SDK)/System/Library/PrivateFrameworks -framework Foundation
all: dumpdecrypted.dylib

dumpdecrypted.dylib: dumpdecrypted.o 
	$(GCC_UNIVERSAL) -dynamiclib -o $@ $^

%.o: %.m
	$(GCC_UNIVERSAL)  -c -o  $@ $< 

clean:
	rm -f *.o dumpdecrypted.dylib
