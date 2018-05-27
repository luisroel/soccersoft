/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import security.entities.Item;
import security.entities.TrackChange;
import soccer.entities.Fixture;

/**
 *
 * @author lespinoza
 */
public class FixtureLoader {

    public List<Fixture> xmlReader(File file, Item user) throws Exception {
        
        List <Fixture> list = new ArrayList<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy HH:mm");
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        Document doc = dBuilder.parse(file);

        // Optional but recommended
        doc.getDocumentElement().normalize();

        NodeList nList = doc.getElementsByTagName("match");
        for (int i = 0; i < nList.getLength(); i++){
            Node node = nList.item(i);
            if (node.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element)node;

                list.add(new Fixture(
                    new Long(-1)
                  , new Item(-1, element.getElementsByTagName("association").item(0).getTextContent())
                  , new Item(-1, element.getElementsByTagName("tournament").item(0).getTextContent())
                  , new Item(-1, element.getElementsByTagName("season").item(0).getTextContent())
                  , new Item(-1, element.getElementsByTagName("phase").item(0).getTextContent())
                  , Integer.parseInt(element.getElementsByTagName("round").item(0).getTextContent())
                  , new Timestamp(dateFormat.parse(element.getElementsByTagName("datetime").item(0).getTextContent()).getTime())
                  , new Item(-1,element.getElementsByTagName("home").item(0).getTextContent())
                  , Integer.parseInt(element.getElementsByTagName("scoredhome").item(0).getTextContent())
                  , new Item(-1,element.getElementsByTagName("visitor").item(0).getTextContent())
                  , Integer.parseInt(element.getElementsByTagName("scoredvisitor").item(0).getTextContent())
                  , new Item(-1,"")
                  , new Item(-1,"")
                  , new Item(1, element.getElementsByTagName("status").item(0).getTextContent())
                  , Float.parseFloat(element.getElementsByTagName("odd1").item(0).getTextContent())
                  , Float.parseFloat(element.getElementsByTagName("oddx").item(0).getTextContent())
                  , Float.parseFloat(element.getElementsByTagName("odd2").item(0).getTextContent())
                  , Integer.parseInt(element.getElementsByTagName("round").item(0).getTextContent())
                  , element.getElementsByTagName("tendency").item(0).getTextContent()
                  , new TrackChange( new Date(), user, new Date(), user)
                ));

            }
        }

        // Descending order
        Collections.sort(list, (Object o1, Object o2) -> {
            Fixture f1 = (Fixture)o1;
            Fixture f2 = (Fixture)o2;
            if (f1.getTime().after(f2.getTime()))
                return -1;
            else if (f1.getTime().before(f2.getTime()))
                return 1;
            else
                return 0;
        });
        return list;
    }
}
