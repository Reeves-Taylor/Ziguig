# Ziguig

## Short Description
Ziguig is a Zig library for creating retained-mode, cross-platform GUI applications simply and efficiently.

## Long Description
Ziguig (pronounced "ziggwig") is a retained-mode GUI library written in Zig. Unlike immediate-mode GUI libraries, retained-mode rendering only redraws parts of the interface that change, which can improve performance, reduce resource usage, and help save battery life.

The rendering backend uses OpenGL and OpenGL ES for compatibility across mobile devices, macOS, Windows, and Linux.

Ziguig is designed to stay lightweight and dependency-free. It uses simple APIs and helper functions to make development easy. 

## Requirements
GLFW3 installed system wide in C libraries.

## Goals

Ziguig's goal is to make creating GUI applications in Zig simple and portable. All parts of the library are designed to work independently and are packaged as separate libraries.


```
______________________
Windowing Library	  ->|
______________________	|
Rendering Library	  ->|
______________________  |---------> Ziguig ---> SourceCode.zig
Text Rendering Library->|
______________________  |
GUI Elements Library  ->|
______________________  |
Other Libraries       ->|
______________________  |

```
The libraries will all be separate zig libraries that can use other renderers, windows, text renderers, or elements to work.
While these libraries can be used independently, they are all included in the main Ziguig package by default, so separate installation is not required.


## Project Status

Ziguig is currently in early development and is not yet production-ready.
APIs may change frequently.

ZiguigWindow currently compiles and Ziguig main, the test file, opens a window,

## Coming Soon

Coming Soon: ZiguigRenderer



## Contributing
Contributions, issues, and suggestions are welcome.  
Please keep discussions respectful and constructive.

Please keep commit messages short and descriptive. General messages like `Fix Bug` are unacceptable.

Use `verb + thing changed` in the imperative mood.

Instead of:
`Added X to X`

Use:
`Add X to X`

## Installation
For most systems:
  
Clone the repository into your project folder or global imports using:  
  
`git clone <url>`  
  
Then add the dependency to your `build.zig`

or

`use zig --fetch git+<url>.git`

For Linux:
Use your package manager to install the latest version from there if available or previously mentioned cloning method/fetch method.

For MacOS:
Use homebrew to install the latest version from there if available or previously mentioned cloning method/fetch method.

For Windows:
Use the previously mentioned cloning method/fetch method or installer if available.

Note: Using the latest version is recommended for bug fixes and API improvements. Migration guides will be provided when needed.

## License
Licensed under the Apache 2.0 License
