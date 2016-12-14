package ch.marta.xml;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class TransformXmlToHtml {
	public static void transform() throws TransformerException {
		String from = "document.xml";
		String stylesheet = "styleHtml.xsl";
		String to = "document.html";

		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer transformer = factory
				.newTransformer(new StreamSource(stylesheet));
		transformer.transform(new StreamSource(from), new StreamResult(to));
		System.out.printf("%s + %s -> %s%n", from, stylesheet, to);
	}
}