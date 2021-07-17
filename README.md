# SoC 2021
## [Introduction To App Development](https://docs.google.com/document/d/1FuX7SFlU19xeJxwmtU16EpFE8X4g8-S0lwWRR8KKcbk/edit)

This is the repo for source code of App(Front end) which when given some data, can generate Posters at backend and provide them to user for sharing.

Features: 
1. There is a Authentication System(based on phone number) managed by Bloc and Bloc Providers
1. User can select existing templates aur can click pic/take from gallery
1. User can give optional details like Title, Description and Price
1. User can directly share poster as soon as they receive poster or can save it for future sharing
1. User can maintain unique directory for their frequent consumers
1. User can also maintain their profile with many attributes

Important Files:

Files that we coded are present majorly in [lib](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib) folder, all the file names are descriptive. 

There are dart diles which contain layout of app (
[homepage](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/home), 
[drawer](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/main_drawer), 
[template tiles](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/Custom_made_templates), 
[login page](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/login), 
[user profile page](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/UpdateUserProfile), 
[broadcast form](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/broadcast) 
etc.) and there are dart files which are helping us in receiving data from backend and decoding it (
[api connection](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/api_connection)).

Other files in [lib](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib) folder are regarding 
[bloc implementation](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/bloc) which maintains login system of app and 
[database management](https://github.com/dhananjayiitb/AdAI-Team-A/tree/DJ/adai_app/lib/database) of app.
