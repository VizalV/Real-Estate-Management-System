<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UrbanUtopia</title>
    <link rel="stylesheet" href="moderator.css">
</head>
<script>
    function verify(x){
        document.getElementById(x).innerHTML='Verfied';
        document.getElementById(x).style.backgroundColor='green';
        document.getElementById(x).parentElement.classList.add('verified')  
        document.getElementById(x).parentElement.addEventListener("animationend", function() {
        document.getElementById(x).parentElement.style.display="none";})
    }
</script>
<body>
    <div class="navbar">
        <ul>
            <li class="logo">
            <img src="logo.png" alt="" height="50px" width="80px"><span class="website-name"><span class="u">U</span>rban<span class="u">U</span>topia</span>
            </li>
            <li class="start"><span class="mod">Moderator</span></li>
            <li class="nav-item login"><a href="logout">Logout</a></li>
        </ul>
    </div>
    <div class="main" id="main">
    </div>
    <input type="hidden" id="getProperty" value="<%= request.getAttribute("data_mod") %>">>
</body>
<script>
    const data_mod = document.getElementById("getProperty");
    const properties = data_mod.value.split("\n");
    console.log(data_mod.value);
    function renderData(properties){
        const main = document.getElementById("main");
        main.innerHTML = "";
        // console.log(properties);
        if(properties[0] === ''){
            var alldone = document.createElement("div");
            alldone.classList="item";
            var content = document.createElement("p");
            content.classList = "content";
            content.innerHTML = "No properties to be Moderated!<br>Refresh to get new ones..";
            // console.log(content);
            main.appendChild(alldone);
            alldone.appendChild(content);
            return;
        }
        
        for(var i=0; i<properties.length - 1; i++)
        {
            var x=document.createElement("div");
            x.classList="item";
            var y=document.createElement("div");
            y.classList="content";
            var t;
            const item = properties[i].split("~");
            console.log(item);
            if(item[3]==1)
                t="Induvidual House";
            if(item[3]==2)
                t="Apartment";
            if(item[3]==3)
                t="Villa";
            if(item[3]==4)
                t="Plot";

            if(item[3]!=4)
                y.innerHTML = "Property Name:"+item[0]+"<br>Address: "+item[4]+" "+item[5]+"<br>"+item[6]+" "+item[7]+" "+item[8]+"<br>Looking to: "+item[2]+"<br>Type:"+t+"<br>Bedrooms: "+item[9]+"<br>Plot Area: "+item[10]+"sq ft<br>Furnishing: "+item[11]+"<br>Floors: "+item[12]+"<br>Availibility: "+item[16]+"<br>Price: "+item[17]+"<br>Description: "+item[18]+"<br><br>Owner details:<br>"+item[20]+"<br>"+item[1];
            else
                y.innerHTML = "Property Name:"+item[0]+"<br>Address: "+item[4]+" "+item[5]+"<br>"+item[6]+" "+item[7]+" "+item[8]+"<br>Looking to: "+item[2]+"<br>Type:"+t+"<br>Plot Area: "+item[10]+"sq ft<br>Furnishing: "+item[11]+"<br>Floors: "+item[12]+"<br>Availibility: "+item[16]+"<br>Price: "+item[17]+"<br>Description: "+item[18]+"<br><br>Owner details:<br>"+item[20]+"<br>"+item[1];
                main.appendChild(x);

            // for accept button
            const accept = document.createElement("button");
            accept.classList.add("accept");
            accept.setAttribute("id", (i+1)+"");
            accept.innerHTML="Accept";

            accept.addEventListener("click", function() {
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "moderator");
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                    console.log(xhr.responseText);
                    const new_data = xhr.responseText.split("\n");
                    renderData(new_data);
                    }
                };
                xhr.send("action=accept&id=" + this.id);
            });

            // for reject button
            const reject = document.createElement("button");
            reject.classList.add("reject");
            reject.setAttribute("id", (i+1)+"");
            reject.innerHTML="Reject";

            reject.addEventListener("click", function() {
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "moderator"); // Servlet path
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        console.log(xhr.responseText);
                        const new_data = xhr.responseText.split("\n");
                        renderData(new_data);
                    }
                };
                xhr.send("action=reject&id=" + this.id);
            });

            // append everything in the div
            x.appendChild(y)
            x.appendChild(accept)
            x.appendChild(reject)
        }
    }

    renderData(properties);
    
    const v= document.querySelectorAll(".verify");
    v.forEach((i)=>{
        i.addEventListener("click",()=>{verify(i.id)})
    })
</script>
</html>