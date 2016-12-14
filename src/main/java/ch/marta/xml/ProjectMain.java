package ch.marta.xml;

public class ProjectMain {
	public static void main(String[] args) {
		try {
			//TransformXmlToHtml.transform();
			TransformXmlToFo.transform();
			//ConvertFoToPdf.convert();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
