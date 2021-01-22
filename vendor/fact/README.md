# FaCT++ vendored files

This folder contains a vendored copy of FaCT++ from commit `650a50c`.

The only changes from the root [repository](https://bitbucket.org/dtsarkov/factplusplus) are as follows:

- Removed Java/JNI build to avoid needing to install a JDK.
- Modified the `fact` library build to create a static library to ease linking.
