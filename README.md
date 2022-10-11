# RentReady-Flutter

Technical Assessment - Flutter Developer for Rent Ready.

## The goal of this task is to: 
 - Create a application
 - Implement search and filtering capabilities 
 - Implement a details view
 - Utilize dataverse as a data storage (you can use WebAPI)

## Functional Requirements
 - Search by account name or account number
 - Filtering by StateCode and StateOrProvince
 ## Technical Requirements
 - Implement Dart/Flutter app
 - Implement preloader for search and filtering
 - Unit Tests
 - UI components tests
 - Build scripts should be implemented inside a docker container

## How to Run

 - [Install docker desktop](https://www.docker.com)
 - login to you docker
 - create dev enviorment from docker desktop app
    - selet option of eisting repo and enter https://github.com/jibransiddiqui/RentReady-Flutter

     ![Alt text](/lib/assets/images/docker1.png?raw=true "docker")

    - this will create the dev enviorment for flutter app

    ![Alt text](/lib/assets/images/docker2.png?raw=true "docker")
   
- install visual code and docker and remote enviorment extension inside vs code

- open the dev enviorment you created inside the docker app with visual code

![Alt text](/lib/assets/images/docker3.png?raw=true "docker")

-  inside folder terminal :    flutter run
## Dcoker Image
 [my docker image](https://hub.docker.com/repository/docker/jabransiddiqui/dev-environments)

 # Note:
    You need to add access token in the app.secrets.dart file under lib/env/, for accesstoken please email me : jabransiddiqui@outlook.com

# iOS Quicker
    iOS Notes here.
# Android Quicker
    Android Notes here.

# Screenshot
|   |   |
|--------|-----|
|![Alt text](/lib/assets/images/1.png?raw=true "Screenshot 1") | ![Alt text](/lib/assets/images/2.png?raw=true "Screenshot 2") |
|![Alt text](/lib/assets/images/3.png?raw=true "Screenshot 3") | ![Alt text](/lib/assets/images/4.png?raw=true "Screenshot 4") |
|![Alt text](/lib/assets/images/5.png?raw=true "Screenshot 5") | ![Alt text](/lib/assets/images/6.png?raw=true "Screenshot 6") |

# Plugins
Plugin and there version used in this repository.

| Plugin | Pub |
|--------|-----|
| [flutter_bloc](./packages/flutter_bloc/) | [![Pub](https://img.shields.io/pub/v/flutter_bloc.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_bloc) |
| [equatable](./packages/equatable/) | [![Pub](https://img.shields.io/pub/v/equatable.svg?style=flat-square)](https://pub.dartlang.org/packages/equatable) |
| [dio](./packages/dio:/) | [![Pub](https://img.shields.io/pub/v/dio.svg?style=flat-square)](https://pub.dartlang.org/packages/dio) |