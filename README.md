# Unseen Abyss 2.0



<img src="https://github.com/Grigary-C-Antony/Unseen_Abyss_2.0/raw/main/assets/images/logo.png" alt="logo" width="200"/>

 


### This app helps the user know about the location of the potholes on the road so that he could choose a path with less number of  potholes. Through this app the user can also alert other users by adding the location of the potholes near the user. Hope this app will be useful to all the riders out there. <br>

<br><img src="https://github.com/Grigary-C-Antony/Unseen_Abyss_2.0/raw/main/ezgif-3-e22d97da0373.gif" alt="sample" width="300">
<br>
## Use this code in server
```
function doGet(request) {
  var sheet =SpreadsheetApp.openById("sheetid");
  var values =sheet.getActiveSheet().getDataRange().getValues();
  var data=[];
  try{
    var marker_name=request.parameter.marker_name;
    var marker_id=request.parameter.marker_id;
    var x=request.parameter.x;
    var y=request.parameter.y;
    var rowData=sheet.appendRow([marker_name,marker_id,x,y]);

  }catch(exc){

  }

  for (var i =1;i<values.length;i++)
  {
    var row=values[i];
    var getdata ={};
getdata['marker_name']=row[0]
getdata['marker_id']=row[1]
getdata['x']=row[2]
getdata['y']=row[3]

data.push(getdata);

  }
  return ContentService.createTextOutput(JSON.stringify(data)).setMimeType(ContentService.MimeType.JSON);
  }
 ```
<a id="raw-url" href="https://github.com/Grigary-C-Antony/Unseen_Abyss_2.0/raw/main/app-release.apk">Download APP</a>
