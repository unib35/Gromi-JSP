

const api_key = "20230605N2Y5KYUYQBPOTOUIBCPHSA";

let plantApi = {
    recommend : 
        function(queryString){
            const baseUrl = "http://cors-anywhere.herokuapp.com/http://api.nongsaro.go.kr/service/garden/gardenList?apiKey=" + api_key;
            const requestUrl = `${baseUrl}&${queryString}`;

            fetch(requestUrl, {
                method: "GET"
            }).then(response => {
                if(response.ok) {
                    return response.text();
                }
                else return null;
            }).then(str =>{
                return new DOMParser().parseFromString(str, 'application/xml');
            }).then(result => {
                console.log(result);
                let items = result.querySelectorAll('item');
                
                
                let board = document.querySelector('#plant_board').querySelectorAll('.col');

                
                for(idx in items){
                    let contentNo = plantApi.getXmlData(items[idx], 'cntntsNo');
                    let name = plantApi.getXmlData(items[idx], 'cntntsSj');
                    let thumbnail = plantApi.getXmlData(items[idx], 'rtnFileUrl').split("|")[0];
                   	
                    board[idx].querySelector('img').src = thumbnail;
                    board[idx].querySelector('p').innerHTML = name;
                }
            });
        },
    
    getXmlData :
        function(xml, selector){
            return xml.querySelector(selector).innerHTML.replace("<![CDATA[", "").replace("]]>", "");
        }
}