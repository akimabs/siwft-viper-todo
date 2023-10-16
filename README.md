<div id="top"></div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

To welcome hacktoberfest we provide to create this repository to make you can contribute in hacktober fest with happy and make you more creative.

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

This app build with `Swift` and `Storyboard`

- [Swift](https://www.swift.org/documentation/)

<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

How to contribute? Just fork this repository and then, create branch from forked repository, edit, create pull request, finish

<!-- PREREQUISITIES -->

### Prerequisites

Please be sure to have `macos, xcode, cocoapods` installation to run this app

- [Xcode](https://developer.apple.com/xcode/)
- [Cocoapods](https://guides.cocoapods.org/using/the-podfile.html)

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/akimabs/swift-viper-todo.git
   ```
2. Install Cocoapods packages
   ```sh
    pod install
   ```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Viper

To start developing using viper architecture you can follow this step:

<p align="center">
<img src="https://github.com/akimabs/siwft-viper-todo/blob/main/img/viper-explain.png" width="300"/>
</p>

1. V (View): YourScreen.swift
   Manages UI components.
   Sends user actions to the Presenter `and check the view must create the xib file`.

2. I (Interactor): YourScreen.Interactor.swift
   Handles data fetching or manipulation.
   Sends data to Presenter.

3. P (Presenter): YourScreen.Presenter.swift
   Takes user actions from View.
   Manipulates data via Interactor.
   Updates the View.

4. E (Entity): YourScreen.Entity
   Data models. Not explicitly defined in the repo.

5. R (Router): YourScreen.Router.swift
   Manages navigation between modules.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>
