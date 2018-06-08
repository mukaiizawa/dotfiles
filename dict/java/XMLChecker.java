import java.io.InputStream;
import java.io.FileInputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLChecker {

  public static void main(String[] args) throws Exception {
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    factory.setValidating(true);    // important!
    DocumentBuilder builder = factory.newDocumentBuilder();
    String xmlPath = "xxx.xml";
    try (InputStream is = new FileInputStream(xmlPath)) {
      builder.parse(is);
    }
  }

}
