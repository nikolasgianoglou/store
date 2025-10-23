# Application Setup Guide

## 🧰 Requirements
- **Xcode 16.0** (or later)

## 🚀 Running the Application
1. **Download or clone** this repository to your local machine.  
2. **Open** the project in **Xcode**.  
3. **Build and run** the app using the simulator or a connected device.

## 🏗️ Architecture Overview
This application is built using the **MVVM (Model–View–ViewModel)** architecture pattern.  

The MVVM approach organizes the project into three main layers:

- **Model** – Represents the data structures and business logic. It defines how data is fetched, stored, and manipulated.  
- **View** – Handles the presentation layer and user interface. Views are responsible only for displaying data and responding to user interactions.  
- **ViewModel** – Acts as a bridge between the Model and the View. It contains the presentation logic, processes data from the Model, and exposes observable properties for the View to display.

This architecture promotes **separation of concerns**, making the codebase easier to **maintain, test, and scale**. It also encourages **reactive programming practices**, allowing the UI to automatically update in response to changes in the underlying data.

