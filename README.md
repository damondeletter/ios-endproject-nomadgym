
# Project Title

This repository contains my project for the course: mobile development - iOS.

In my sparetime, I'm a bodybuilder. This means that I'm in the gym for more than 15 hours a week.
One problem that my fellow gym-goers and I encounter, is that tracking our progress is not that easy.

Most apps nowadays aren't free, they either cost money or use monthly subscriptions.

To fix this problem, I made an app to, not only track the progress in the gym, but also to be able to read interesting articles. These articles contain information about bulking, cutting, eating the right food, and more.

I chose SwiftUI for this project.


The API used in this project is self-written, in NodeJs.
You can view it here: https://github.com/damondeletter/ios-endproject-nomadgym-api





## User information

You can either make an own account (using a valid mailaddress) or use the following account:

### User:
Username: damon.deletter@student.hogent.be

Password: test1234
## Extra information

I used 2 different API's:
- My own API: containing all the gym-stuff.
- Firebase: Authentication and profile overview

There are multiple calls (4 GET calls, 2 POST and 1 PUT):
- GET:
    - Login - get user information
    - Infoblocks - get all the blog posts
    - Workouts - get all personal Workouts
    - overview - previous 2 calls

- POST:
    - Register - create a new user
    - Workout - create a new Workout

- PUT:
    - Profile picutre - change profile picture for any picture on your phone


## Used code
##### Futhermore, I did use some code from the internet. This is a brief overview of what code I didn't write:
- The typewriting and animation effect, both on register and login. https://betterprogramming.pub/typewriter-effect-in-swiftui-ba81db10b570
- The gradient background is from a gradient generator, so I did make this myself, but the generator put the colors together. https://cssgradient.io/
- The extensions: for custom colors, putting an array in appstorage and extending a collection https://stackoverflow.com/questions/24263007/how-to-use-hex-color-values, https://stackoverflow.com/questions/63166706/how-to-store-nested-arrays-in-appstorage-for-swiftui 
- Layout for 1 info section on overviewpage https://www.youtube.com/watch?v=Mhrnjug3hGQ
- Pathcomponent https://stackoverflow.com/questions/73745850/how-to-draw-a-curve-path-after-straight-lines-in-swiftui


## Mockups

Initialy, the design of the app was completely different. To be honest, I resetted the whole project for like 4 times.
Eventually, I had a vague idea of how I wanted it. I tried to implement this, eventhough I'm not the best designer / the most creative person.
The features also changed a lot.

Anyways, here are the initial mockups:
- First try:
![image](https://user-images.githubusercontent.com/71697141/210183210-8e79bad7-5407-4b81-ac38-70ff8c64b1a0.png)

- Different colors:
![image](https://user-images.githubusercontent.com/71697141/210183218-c14f0a67-2bf9-4377-8721-11dd9efb487d.png)

- Third try:
![image](https://user-images.githubusercontent.com/71697141/210183221-bba56d8a-a20d-4e21-b34c-0c9e829e61ed.png)

- More details:
![image](https://user-images.githubusercontent.com/71697141/210183228-69e8a0c8-f4e4-41e4-8f2c-5d3ba654db0c.png)

- Next page:
![image](https://user-images.githubusercontent.com/71697141/210183232-c41e252a-5b2e-4f62-9f76-8a786e4eafa6.png)


