xcodebuild clean build -sdk iphonesimulator -project Development/NMXCore.xcodeproj -scheme NMXCoreTestsStatic CODE_SIGNING_REQUIRED=NO -destination 'platform=iOS Simulator,name=iPhone 8,OS=11.1' test GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES