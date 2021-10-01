# SEOUL PARK
- 2016년/2학기 (2016. FALL)
- 모바일 프로그래밍 수업 (IOS Mobile Programing CLASS FINAL HW)

## 1. Introducion
- 앱은 공공데이터를 통해서 공원에 대한 정보를 얻어오며, 일기장 기능을 추가하여서 자신이 경험했던 공원에 대해서 적고 저장할 수 있습니다. <br>
- This APP can get information about park in Seoul using Public Data APIs. By using park diary function, you can write and save about the park you experienced.

## 2. Development Enviroment
* Objective-C

## 3. API
* Open API of Seoul Park Info  (서울시 열린데터 광장, http://data.seoul.go.kr)

## 4. Main Code
- Main code

|제목|내용|설명|
|------|---|---|
|초기화면|ViewController.h, <br>ViewController.m|초기화면|
|공원검색|SearchViewController.h, <br>SearchViewController.m, <br>ParkData.h, <br>ParkData.m|OPEN API를 통해 Parsing해온 데이터를 처리한다.<br>Process parsing data through OPEN API.<br>(String, Image, Locations values)|
|공원일기|SaveViewController.h, <br>SaveViewController.m, <br>RootTableViewController.h, <br>RootTableViewController.m, <br>DetailViewController.h, <br>DetailViewController.m|데이터베이스와 연동해서 <br>값을 불러오거나 저장할수 있도록한다.(카메라 처리도 수행)<br>It allows you to load or save values by linking with the database.|

- Database
"Entity" : Diary

|Attribute|Type|설명|
|------|---|---|
|title|String|일기 제목|
|park_name|String|공원 이름|
|content|String|일기 내용|
|imageData|Binary Data|공원 사진|
|date|Date|저장 날짜|

## 4. APP Function
- APP Layout

![image](https://user-images.githubusercontent.com/22439716/134934961-3dcf6ab0-bf78-4627-9c32-b92c596bd9d4.png)
- Main page

![image](https://user-images.githubusercontent.com/22439716/134935528-db913e07-96ca-49b7-ba7e-b900f49efffa.png)

### 1) 공원 검색하기 (Search Park)
> 서울에 있는 공원을 검색할 수 있다. (You can search parks in Seoul.)

![image](https://user-images.githubusercontent.com/22439716/134935909-0c89713a-b533-4065-bab5-bb9357861d48.png)

### 2) 공원 일기 작성하기 (Write Park Diary)
> 공원에 대한 일기를 작성할 수 있다. (You can write diaries about parks.)

![image](https://user-images.githubusercontent.com/22439716/134936440-404b0236-db15-430f-aba2-df8252f1449d.png)

![image](https://user-images.githubusercontent.com/22439716/134936501-0c015acc-e641-460a-916e-7e17f3cd59d6.png)
