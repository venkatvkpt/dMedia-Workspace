
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-rc.0/angular.min.js"></script>
</head>
<body  >
 
    <div ng-controller="servicesController">
      search:<input type="text" ng-model="search" />
 

 

    <table>
        <tr ng-repeat="i in services | filter:search">
 
             <td>
            {{i.SERVICE_NAME}}</td>
 
             <td>
            {{i.SERVICE_LINK }}</td>
        </tr>
        </table>
    <script>
        var app = angular.module('mainApp', []);
        app.controller('servicesController', function ($scope) {
            $scope.services = <%=request.getSession().getAttribute("services") %>
        });
    </script>
        </div>
        
        
</body>
</html>