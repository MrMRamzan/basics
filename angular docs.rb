Why use Angular?
Two way binding
A declarative user interface.
Write Less Code
Power of MVVM
Rendering of HTML.
Event-handling.

AngularJS is a structural framework for dynamic web apps.
It lets you use HTML as your template language
and lets you extend HTML's syntax to express your application's
components clearly and succinctly. Angular data binding and
dependency injection eliminate much of the code you currently
have to write. And it all happens within the browser, making it
an ideal partner with any server technology.

Features
+) AngularJS is a powerful JavaScript based development framework to create RICH Internet Application(RIA).
+) AngularJS provides developers options to write client side application (using JavaScript) in a clean MVC(Model View Controller) way.
+) Application written in AngularJS is cross-browser compliant. AngularJS automatically handles JavaScript code suitable for each browser.
+) AngularJS is open source, completely free, and used by thousands of developers around the world. It is licensed under the Apache License version 2.0.

Angular 4 is the latest version of Angular.
Although Angular 2 was a complete rewrite of AngularJS, there are no major differences between Angular 2 and Angular 4. Angular 4 is only an improvement and is backward compatible with Angular 2. 

"Data-binding" − It is the automatic synchronization of data between model and view components.
"Scope" − These are objects that refer to the model. They act as a glue between controller and view.
"Controller" − These are JavaScript functions that are bound to a particular scope.
"Services" − AngularJS come with several built-in services for example $https: to make a XMLHttpRequests. These are singleton objects which are instantiated only once in app.
"Filters" − These select a subset of items from an array and returns a new array.
"Directives" − Directives are markers on DOM elements (such as elements, attributes, css, and more). These can be used to create custom HTML tags that serve as new, custom widgets. AngularJS has built-in directives (ngBind, ngModel...)
"Templates" − These are the rendered view with information from the controller and model. These can be a single file (like index.html) or multiple views in one page using "partials".
"Routing" − It is concept of switching views.
"Model View Whatever" − MVC is a design pattern for dividing an application into different parts (called Model, View and Controller), each with distinct responsibilities. AngularJS does not implement MVC in the traditional sense, but rather something closer to MVVM (Model-View-ViewModel). The Angular JS team refers it humorously as Model View Whatever.
"Deep Linking" − Deep linking allows you to encode the state of application in the URL so that it can be bookmarked. The application can then be restored from the URL to the same state.
"Dependency Injection" − AngularJS has a built-in dependency injection subsystem that helps the developer by making the application easier to develop, understand, and test.

The AngularJS Components
The AngularJS framework can be divided into following three major parts −

ng-app − This directive defines and links an AngularJS application to HTML.
ng-model − This directive binds the values of AngularJS application data to HTML input controls.
ng-bind − This directive binds the AngularJS Application data to HTML tags.

Model − It is the lowest level of the pattern responsible for maintaining data.
View − It is responsible for displaying all or a portion of the data to the user.
Controller − It is a software Code that controls the interactions between the Model and View.

Application Module − used to initialize an application with controller(s).
	var mainApp = angular.module("mainApp", []);

Controller Module − used to define the controller.
	mainApp.controller("studentController", function($scope) { });

ng-disabled
ng-show
ng-hide
ng-click
ng-dbl-click
ng-mousedown
ng-mouseup
ng-mouseenter
ng-mouseleave
ng-mousemove
ng-mouseover
ng-keydown
ng-keyup
ng-keypress
ng-change

Validate Data :
$dirty − states that value has been changed.
$invalid − states that value entered is invalid.
$error − states the exact error.

Include view:
  <div ng-app = "mainApp" ng-controller="studentController">
     <div ng-include = "'/angularjs/src/include/main.htm'"></div>
     <div ng-include = "'/angularjs/src/include/subjects.htm'"></div>
  </div>
  


***************************** ANGULAR 4 *********************************************
TypeScript 2.2 is an open-source programming language developed and maintained by Microsoft.
TypeScript is a strict syntactical superset of JavaScript, and adds optional static typing to the language

Angular 4 is a JavaScript framework for building web applications and apps in JavaScript, html, and TypeScript,
which is a superset of JavaScript. Angular provides built-in features for animation, http service,
and materials which in turn has features such as auto-complete, navigation, toolbar, menus, etc.
The code is written in TypeScript, which compiles to JavaScript and displays the same in the browser.
  ++++++++++++++++++
  +       TS       +
  +  ++++++++++++  +
  +  +          +  +
  +  +    JS    +  +
  +  +          +  +
  +  ++++++++++++  +
  ++++++++++++++++++

Although Angular 2 was a complete rewrite of AngularJS.
The structure of Angular is based on the components/services architecture.
AngularJS was based on the model view controller.
Angular 4 is almost the same as Angular 2.
It has a backward compatibility with Angular 2.
Projects developed in Angular 2 will work without any issues with Angular 4.

Changes:
*) Animation in Angular 4 is available as a separate package and needs to be imported from @angular/animations.
   In Angular2, it was available with @angular/core.
*) Angular 4 changed <template> to <ng-template> because of the name conflict with the html.
*) Angular 4 has added a new pipe title case
*) Http Search Parameters
   We do not need to call URLSearchParams for the same as was being done in Angular2.

>>>>>Components<<<<<
Major part of the development with Angular 4 is done in the components.
Components are basically classes that interact with the .html file of the component, which gets displayed on the browser.
Creating Components: ng g component new-cmp
	=>	src/app/new-cmp/
app.component.ts =>	ngOnInit is called by default when the class is executed.

******** App Flow ********
src/index.html => <app-root></app-root>
	First executes the index.html 
	This tag has the reference in the main.ts file.
src/main.ts
	AppModule is imported from the app of the main parent module,
	and the same is given to the bootstrap Module, which makes the appmodule load.
srcs/app/app.module.ts
	AppComponent is the variable to store the reference of the app. app.component.ts and the same is given to the bootstrap.
srcs/app/app.component.ts
	Angular core is imported and referred as the Component
	Selector can be added like <app-new-cmp></app-new-cmp> and all that is present in the .html file will get displayed on the browser along with the parent component data.

>>>>>Module<<<<<
Module in Angular refers to a place where you can group the components, directives, pipes, and services, which are related to the application.
app.module.ts =>  NgModule
      Declarations, Iports, bootstrap

>>>>Binding<<<<<
    <tag *ngFor="let i of months">{{i}}</tag>

>>>>Directive<<<
create => ng g directive nameofthedirective
  directives are extended HTML attributes 
  whatever we define in the selector, the same has to match in the view, where we assign the custom directive.

>>>>Pipe / filters(Angular1)
The | character is used to transform data.
i.e. {{ Welcome to Angular 4 | lowercase}}
 = Lowercasepipe
 = Uppercasepipe
 = Datepipe
 = Currencypipe
 = Jsonpipe
 = Percentpipe
 = Decimalpipe
 = Slicepipe
