# Table of Contents
1. [Description](#description)
2. [Getting started](#getting-started)
3. [Usage](#usage)
4. [Architecture](#architecture)
5. [Structure](#structure)
6. [Running the tests](#running-the-tests)
7. [Dependencies](#dependencies)
8. [Workflow](#workflow)
9. [API](#api)

# Threads
Clone app of the social media app threads 

# Description
<p>Threads is a messaging application designed to connect you with the world. Built on the Firebase platform and utilizing the Kingfisher library for efficient image loading, Threads provides a modern and reliable messaging experience.<br>
The application follows the Model-View-ViewModel (MVVM) architecture pattern, ensuring clean separation of concerns. It leverages Firebase for networking, allowing messages to reach users worldwide.<br>
This project is an excellent starting point for developers looking to explore iOS app development with Firebase integration.</p>

# Getting started
<p>
1. Ensure you have Xcode version 13.0 or above installed on your computer.<br>
2. Clone the Threads project from the repository.<br>
3. Install CocoaPods if not already installed.<br>
4. Run `pod install` to install dependencies.<br>
5. Open the Xcode project.<br>
6. Review the code to understand the implementation.<br>
7. Run the project, and you should see the application in action.<br>

# Usage
To send a message globally, log in with the provided credentials.

# Architecture
* Threads utilizes the <strong>Model-View-ViewModel (MVVM)</strong> architecture pattern.
* Model contains data and business logic for generating messages.
* View displays messages to users.
* ViewModel handles user interactions and updates the Model and View accordingly.
* The project does not include a database or complex user interface.

# Structure 
* "App": App main contains the screen.
* "Core": Core file contains the core files of the project 
* "Features": All project features
* "Product": Product section contains all application specific parts, for example components, viewmodifiers, enums, extension etc.
* "Resources": Non-code files such as images, audio, and video assets.


# Running the tests
<p>Threads is tested using the XCTest framework.<br>
Create a new test target in Xcode, add test files to the "test" folder, and write test functions using XCTest.</p>


# Dependencies
[CocoaPods](https://cocoapods.org) is used as a dependency manager.
List of dependencies: 
* `pod 'Firebase'`: Networking library for global message delivery.
* `pod 'Kingfisher'`: It provides you a chance to use a pure-Swift way to work with remote images.

# Workflow
* Reporting bugs: Report issues on the GitHub repository.
* Bug report form:
*  Pull requests: Submit bug fixes or new features after testing and adhering to Swift style guide.
* Improving documentation: Submit pull requests for documentation improvements.
* Providing feedback: Share feedback or suggestions by creating an issue or emailing the maintainer.

# API 
* Threads uses Firebase for seamless messaging.
