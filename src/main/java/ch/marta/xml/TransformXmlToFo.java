package ch.marta.xml;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class TransformXmlToFo {
	public static void transform() throws TransformerException {
		String from = "document.xml";
		String stylesheet = "styleFo.xsl";
		String to = "document.fo";

		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer transformer = factory
				.newTransformer(new StreamSource(stylesheet));
		transformer.transform(new StreamSource(from), new StreamResult(to));
		System.out.printf("%s + %s -> %s%n", from, stylesheet, to);
	}
}