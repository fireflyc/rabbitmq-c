export IphoneSDK="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS8.2.sdk"
export IphoneSimulator="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator8.2.sdk"

autoreconf -i

mkdir arm64-apple-drawin armv7s-apple-drawin armv7-apple-drawin i386-apple-drawin

rm -f ./librabbitmq.a

./configure --host=arm-apple-darwin --with-ssl=no --enable-static=yes --enable-shared=no CC=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang CFLAGS="-std=c99 -arch arm64 -isysroot $IphoneSDK" CPP=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cpp AR=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ar AS=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/as LIBTOOL=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/libtool STRIP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/strip RANLIB=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ranlib
make clean &&  make
mv ./librabbitmq/.libs/librabbitmq.a ./arm64-apple-drawin/librabbitmq.a

# armv7s
./configure --host=arm-apple-darwin --with-ssl=no --enable-static=yes --enable-shared=no CC=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang CFLAGS="-std=c99 -arch armv7s -isysroot $IphoneSDK" CPP=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cpp AR=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ar AS=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/as LIBTOOL=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/libtool STRIP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/strip RANLIB=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ranlib
make clean &&  make
mv ./librabbitmq/.libs/librabbitmq.a ./armv7s-apple-drawin/librabbitmq.a


# armv7
./configure --host=arm-apple-darwin --with-ssl=no --enable-static=yes --enable-shared=no CC=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang CFLAGS="-std=c99 -arch armv7 -mcpu=cortex-a8 -isysroot $IphoneSDK" CPP=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cpp AR=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ar AS=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/as LIBTOOL=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/libtool STRIP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/strip RANLIB=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ranlib
make clean &&  make
mv ./librabbitmq/.libs/librabbitmq.a ./armv7-apple-drawin/librabbitmq.a


# x86_64
./configure --with-ssl=no --enable-static=yes --enable-shared=no
make clean &&  make
mv ./librabbitmq/.libs/librabbitmq.a ./x86_64-apple-drawin/librabbitmq.a

# just for one
lipo -arch arm64 ./arm64-apple-drawin/librabbitmq.a -arch armv7s ./armv7s-apple-drawin/librabbitmq.a -arch armv7 ./armv7-apple-drawin/librabbitmq.a -arch x86_64 ./x86_64-apple-drawin/librabbitmq.a -output librabbitmq.a -create


