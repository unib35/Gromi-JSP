package parser;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class PlantParser {

    String apiKey="20230522XJWYEFWOSP5UXDCRIUCMG";
    //서비스 명
    String serviceName="garden";

    URL apiUrl = null;
    Document doc = null;
    InputStream apiStream;

    public PlantParser(){}

    public String setParameterOper(String oper) {
        String parameter = "/"+serviceName+"/"+oper+"/";
        return parameter;
    }

    public String getThumbnailImageById(String id) throws IOException {
        //요청변수 apiKey, cntntsNo
        String parameter = setParameterOper("gardenFileList");

        parameter += "?cntntsNo="+id;
        parameter += "&apiKey="+ apiKey;
        apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
        apiStream = apiUrl.openStream();

        try{
            doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
        } catch (IOException | ParserConfigurationException | SAXException e) {
            throw new RuntimeException(e);
        } finally {
            apiStream.close();
        }

        Node item = doc.getElementsByTagName("rtnFileUrl").item(0);

        if(item == null){
            return null;
        } else {
            String result = item.getTextContent();

            return result;
        }
    }
    

    public String getNameById(String id) throws IOException {
        String parameter = setParameterOper("gardenFileList");

        parameter += "?cntntsNo="+id;
        parameter += "&apiKey="+ apiKey;

        apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
        apiStream = apiUrl.openStream();

        try{
            doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
        } catch (IOException | ParserConfigurationException | SAXException e) {
            throw new RuntimeException(e);
        } finally {
            apiStream.close();
        }

        Node item = doc.getElementsByTagName("cntntsSj").item(0);

        if(item == null){
            return null;
        } else {
            String result = item.getTextContent();

            return result;
        }
    }

    public ArrayList<String> getGardenList() throws IOException {
        String parameter = setParameterOper("gardenList");
        String numOfRows = "217";

        parameter += "?numOfRows="+numOfRows;
        parameter += "&apiKey="+ apiKey;

        apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
        apiStream = apiUrl.openStream();

        try{
            doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);

        } catch(Exception e){
            e.printStackTrace();
        }finally{
            apiStream.close();
        }

        NodeList items = doc.getElementsByTagName("item");
        int	size = doc.getElementsByTagName("item").getLength();

        Node item = null;
        ArrayList<String> gardenList = new ArrayList<>();

        String idResult = "";

        for(int i=0;i<size;i++) {
            item = items.item(i);
            idResult = doc.getElementsByTagName("cntntsNo").item(i).getTextContent();

            gardenList.add(idResult);
        }

        return gardenList;
    }
}
