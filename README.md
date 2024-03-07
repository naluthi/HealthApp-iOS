# HealthApp-IOS

![GitHub top language](https://img.shields.io/github/languages/top/naluthi/HealthApp-iOS) 
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/naluthi/HealthApp-iOS) 
![Google Cloud Functions](https://img.shields.io/badge/Google%20Cloud%20Functions-4285F4?style=flat-square&logo=googlecloud&logoColor=white)
![iOS](https://img.shields.io/badge/iOS%20Development-000000?style=flat-square&logo=apple&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)
![CocoaPods](https://img.shields.io/badge/-CocoaPods-EE3322?style=flat-square&logo=cocoapods&logoColor=white)


## Description

This repository presents snippets and elements from my first build of a mobile application, demonstrating key functionalities from my other repositories and the application's UI. Due to privacy rights and intellectual property considerations, the complete application is not publicly available. Information and UI elements displayed here have been modified and simplified for sharing purposes.

## Table of Contents

- [Technologies Used](#technologies-used)
- [Challenges](#challenges)
- [Usage](#usage)
- [Sign In Page](#sign-in-page)
- [Main Chatbot Page](#main-chatbot-page)
- [Diagnosis AI Page](#diagnosis-ai-page)
- [Other Chatbot Capabilites](#other-chatbot-capabilities)
- [Progress Page](#progress-page)
- [Articles Page](#articles-page)
- [Contact](#contact)


## Technologies Used

- `Flutter`:   for a unified UI/UX across platforms.
- `Firebase`:    for real-time data synchronization and user authentication.
- `TestFlight`: for deployment.
- `Cocoapod`:  for managing dependencies.
- `Ruby`:       for my DevOps pipeline for (CI/CD), backend API development, and automation and tooling. 


## Challenges
Developing my first mobile application was a journey of discovery, filled with both challenges and opportunities to learn. The experience was both rigorous and rewarding which increased my technical skills and decision-making capabilities. Below is a streamlined account of the hurdles I encountered and the lessons learned while building this project:

The initial phase of this project was characterized by doubt regarding the optimal tech stack to employ. After extensive research and deliberation, I found myself shifting between React and Flutter. Ultimately, Flutter was selected for its compatibility and seamless integration with various hosting services. Furthermore, choosing a hosting service was similarly challenging. I explored numerous options, including AWS, Google Cloud Functions, and SupaBase, before deciding on Google Cloud Functions for its ease of implementation with Flutter which is a Google-developed framework.

A significant learning curve was encountered in integrating the application with Firebase, particularly for iOS deployment. The requirement for a unique iOS Bundle ID to upload and deploy to TestFlight was an unforeseen complication, contributing to a deep dive into the intricacies of the framework.

The project's timeline coincided with the release of iOS 17.0 in the summer of 2023, which introduced unforeseen complications for developers working with Flutter and Xcode. These complications created compilation errors and the inability to debug the application using a Simulator. An extensive period of my time was dedicated to researching potential fixes, ultimately requiring a thorough review and cleanup of the project's IML files, Podfiles, and Node Modules to restore functionality and testing capabilities.

Additionally, deployment hurdles were encountered with Podfiles and the Runner folder, which required me to create a new project from scratch. This process involved reverse engineering the application until the trigger for this error was discovered to achieve successful deployment.

The project's timeline coincided with the release of iOS 17.0 in the summer of 2023, introducing unforeseen complications for developers working with Flutter and Xcode. This issue caused compilation issues and I was unable to debug the application on a Simulator. As a result, an extensive period of my time was dedicated to researching potential fixes, ultimately requiring a thorough review and cleanup of the project's IML files, Podfiles, and Node Modules to restore functionality and ability to test the application. 

Additionally, deployment hurdles were encountered with Podfiles and the Runner folder, leading to me creating a new project from scratch. Then reverse engineering the application to discover the trigger of these complications and eventually be able to successfully deploy the application. 

# Usage

## Sign-In Page

The Sign-in In Page provides a secure entry point to the application. Utilizing Firebase Authentication, users can sign in through their Google accounts or email once an account has been created by the application owner.

<p align="left">
  <img src="assets/login-ui.png" alt="Sign In Page" width="200"/>
</p>


## Main Chatbot Page

The chat interface is built for dynamic conversations, enabling users to receive personalized advice, recommendations, and answers to health-related topics. This page also includes shortcuts to specialized models to prevent use-case confusion, easy UI navigation, and proof of concept. The chatbots are integrated to handle various topics including but not limited to the ones shown below:

<p align="left">
  <img src="assets/main-chatbot-ui.png" alt="Main Chatbot UI" width="200" style="margin-right: 10px;"/>
  <img src="assets/main-chatbot-typing.png" alt="Main Chatbot Typing Feature" width="200" style="margin-right: 10px;"/>
  <img src="assets/main-chatbot-response.png" alt="Main Chatbot Response" width="200"/>
</p>


## Diagnosis AI Page

This page shows the resulting implementation of the diagnostic chatbot including the entire process from prompt creation to the response from the program. 

<p align="left">
  <img src="assets/diagnosisAI-ui.png" alt="Diagnosis AI Detail" width="200" style="margin-right: 10px;"/>
  <img src="assets/diagnosisAI-symptoms.png" alt="Diagnosis AI User Symptoms" width="200" style="margin-right: 10px;"/>
  <img src="assets/diagnosisAI-thinking.png" alt="Diagnosis AI Thinking" width="200" style="margin-right: 10px;"/>
  <img src="assets/diagnosisAI-response.png" alt="Diagnosis AI Response" width="200"/>
</p>

## Other Chatbot Capabilities

These examples show the UI and AI tool called when a shortcut is pressed on the `Main Chatbot Page`

<p align="left">
  <img src="assets/mealplan-response.png" alt="Mealplan AI Response" width="200" style="margin-right: 10px;"/>
  <img src="assets/fitness-response.png" alt="Fitness AI Response" width="200"/>
</p>


## Progress Page

The Progress Page is a motivational tool within the app that tracks and displays the user's health and wellness journey. The page utilizes widgets like PercentIndicator and FLChart to visualize the user's progress in a digestible and engaging format. Users can see how far they've come in their goals, whether it's related to fitness, meditation, or other health activities.

<p align="left">
  <img src="assets/progress-ui-1.png" alt="Progress Detail Top of Page" width="200" style="margin-right: 10px;"/>
  <img src="assets/progress-ui-2.png" alt="Progress Detail Bottom of Page" width="200"/>
</p>


## Articles Page

The Articles page features a collection of wellness and health articles that users can browse. Selecting an article takes the user to an in-app browser where they can discover health-related topics.

<p align="left">
  <img src="assets/ArticlesPage1.png" alt="Articles Page Overview" width="200" style="margin-right: 10px;"/>
  <img src="assets/ArticlesPage2.png" alt="Articles Page Detail" width="200" style="margin-right: 10px;"/>
  <img src="assets/ClickedArtcleElem.png" alt="Clicked Article Element" width="200"/>
</p>


## Contact

[![Outlook](https://img.shields.io/badge/Microsoft_Outlook-0078D4?style=for-the-badge&logo=microsoft-outlook&logoColor=white)](nick@luthi.us) 
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nickluthi)
