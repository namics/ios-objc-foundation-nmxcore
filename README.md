# How to create namics-cocoapods locally
Current Version of the NMXCore Library
0.1.0

1. Checkout
```
pod repo add namics-cocoapods git@git.namics.com:team-mobile/mobile-ios-cocoapods.git
```

2. Verify its working
```
cd ~/.cocoapods/repos/namics-cocoapods
pod repo lint .
```

# Documentation
## Building Documentation
Documentation requires two components:
* [SourceKitten](https://github.com/jpsim/SourceKitten)
> brew install sourcekitten
* [jazzy](https://github.com/realm/jazzy)
> gem install jazzy

Then navigate in terminal to the root path of the repo, where ".jazzy.yaml" is located and run the following command:
`jazzy`
You will find the updated documentation under ./docs
or simply run:
`open ./docs/index.html`

If you added a new section in the Library, make sure to add the related section to the umbrella header file for the documentation generation. See NamicsLibHeaders.h

# How to update changes from the library.
## Setup
To modify pods register at cocoapods:
Make sure to run latest cocoapods version:
https://guides.cocoapods.org/using/getting-started.html
`[sudo] gem install cocoapods`
or
`[sudo] gem update cocoapods`

## Register/Add Owners for the Cocoapods Repo
https://guides.cocoapods.org/making/getting-setup-with-trunk.html
```
pod trunk register vorname.nachname@namics.com 'Vorname Nachname' --description='Namics MacBook'
```

Add Owners so they can also publish:
`pod trunk add-owner push ios-objc-foundation-nmxcore vorname.nachname@namics.com


## Automatic Deployment
You can automatically push your changes to the pod with calling
`sh deploy.sh VERSION`
Example:
`sh deploy.sh 0.2.1`
It might require administrator rights for creating code documentation automatically, see above

## Manual Deployment
1. Do your changes:
Open /Development/NMXLibrary.xcodeproj

2. Go to the main folder from Terminal, where 'NMXCore.podspec' is located, e.g.:
```
cd ~/Documents/ios-objc-foundation-nmxcore/
```

3. Validate the pod lib file in terminal:
`pod lib lint`

4. Validate the specification in terminal:
`pod spec lint`

5. Commit and push your changes in git, note down the tag id (important: the v-Prefix for tags!)
```
git add -A && git commit -m "Release 0.1.0"
git tag 'v0.1.0'
git push --tags
git push
```

6. Modify the Namics-Library.podspec
```
spec.version - new version
...
spec.source - tag to the one from step (5)
```

7. Update cocoapod spec:
`pod trunk push NMXCore.podspec`
