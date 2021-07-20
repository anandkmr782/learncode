<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
p {
  color: navy;
  font-size:25px;
  font-family:san-sarif;
  justify-content:center;
}
input{
  width: 97%;
  padding: 12px 20px;
  margin: 8px 0;
  font-size:20px
  box-sizing: border-box;
  border: 2px solid red;
  border-radius: 8px;
  }
  button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  border-radius:15px;
  font-size: 16px;
}
</style>
</head>
<body>
Select Voice: <select id='voiceList'></select> <br><br>

    <input id='txtInput'/> <br><br>    
    <button id='btnSpeak'>Speak!</button>

    <script>
        var txtInput = document.querySelector('#txtInput');
        var voiceList = document.querySelector('#voiceList');
        var btnSpeak = document.querySelector('#btnSpeak');
        var synth = window.speechSynthesis;
        var voices = [];

        PopulateVoices();
        if(speechSynthesis !== undefined){
            speechSynthesis.onvoiceschanged = PopulateVoices;
        }

        btnSpeak.addEventListener('click', ()=> {
            var toSpeak = new SpeechSynthesisUtterance(txtInput.value);
            var selectedVoiceName = voiceList.selectedOptions[0].getAttribute('data-name');
            voices.forEach((voice)=>{
                if(voice.name === selectedVoiceName){
                    toSpeak.voice = voice;
                }
            });
            synth.speak(toSpeak);
        });

        function PopulateVoices(){
            voices = synth.getVoices();
            var selectedIndex = voiceList.selectedIndex < 0 ? 0 : voiceList.selectedIndex;
            voiceList.innerHTML = '';
            voices.forEach((voice)=>{
                var listItem = document.createElement('option');
                listItem.textContent = voice.name;
                listItem.setAttribute('data-lang', voice.lang);
                listItem.setAttribute('data-name', voice.name);
                voiceList.appendChild(listItem);
            });

            voiceList.selectedIndex = selectedIndex;
        }
    </script>
<p>
SQL (Structured Query Language) is used to perform operations on the records stored in the database such as <br>
updating records, deleting records, creating and modifying tables, views, etc.<br>
SQL is just a query language; it is not a database. <br>
To perform SQL queries, you need to install any database, <br>
for example, Oracle, MySQL, MongoDB, PostGre SQL, SQL Server, DB2, etc.
</p>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-60b447486a3443fd"></script>
</body>
</html>