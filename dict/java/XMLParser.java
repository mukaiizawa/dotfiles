import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

// Parse xml.

    Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(File or InputStream or ...);
    NodeList nodes = document.getElementsByTagName("input");
    for (int i = 0; i < nodes.getLength(); i++) {
      Element node = (Element)nodes.item(i);
      String content = node.getTextContent();
      String type = node.getAttribute("type");
      // ...
    }


// Verify xml.

    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    factory.setValidating(true);    // strict mode.
    DocumentBuilder builder = factory.newDocumentBuilder();
    String xmlPath = "xxx.xml";
    try (InputStream is = new FileInputStream(xmlPath)) {
      builder.parse(is);
    } catch (SAXException e) {
      // invalid xml
    }
