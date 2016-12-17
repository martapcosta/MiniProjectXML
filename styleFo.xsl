<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/lfm">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

			<fo:layout-master-set>
				<fo:simple-page-master margin-right="10mm"
					margin-left="15mm" margin-bottom="20mm" margin-top="25mm"
					page-width="210mm" page-height="297mm" master-name="top-tracks-page">
					<fo:region-body margin-top="25mm" region-name="top-tracks-region" />
					<fo:region-before extent="10mm" region-name="page-header" />
					<fo:region-after region-name="page-footer" />
					<fo:region-start extent="5mm" />
					<fo:region-end extent="5mm" />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:page-sequence master-reference="top-tracks-page">
				<fo:static-content flow-name="page-header">
					<fo:block text-align="left" font-size="7pt">REST API 13122016
					</fo:block>
					<fo:block font-size="16pt" text-align="center"
						margin-bottom="5mm">Top 1000 Last FM Tracks</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="page-footer">
					<fo:block text-align="center" font-size="7pt">
						Page
						<fo:page-number />
						of
						<fo:page-number-citation ref-id="end" />
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="top-tracks-region">
					<fo:block>
						<fo:table text-align="center" table-layout="fixed" width="100%">
							<fo:table-column column-width="1cm" />
							<fo:table-column column-width="6.5cm" />
							<fo:table-column column-width="5.5cm" />
							<fo:table-column column-width="2.5cm" />
							<fo:table-column column-width="2.5cm" />
							<fo:table-header font-weight="bold">
								<fo:table-row>
									<fo:table-cell border="1pt solid black">
										<fo:block>Top</fo:block>
									</fo:table-cell>
									<fo:table-cell border="1pt solid black">
										<fo:block>Track Name</fo:block>
									</fo:table-cell>
									<fo:table-cell border="1pt solid black">
										<fo:block>Artist Name</fo:block>
									</fo:table-cell>
									<fo:table-cell border="1pt solid black">
										<fo:block>Played</fo:block>
									</fo:table-cell>
									<fo:table-cell border="1pt solid black">
										<fo:block>Listeners</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-header>
							<fo:table-body border="1pt solid black">
								<xsl:for-each select="tracks/track">
									<xsl:sort select="playcount" order="descending"
										data-type="number" />
									<fo:table-row>
										<fo:table-cell border="1pt solid black">
											<fo:block>
												<xsl:value-of select="position()" />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="1pt solid black">
											<fo:block>
												<xsl:for-each select="url[1]">
													<fo:basic-link color="grey">
														<xsl:attribute name="external-destination">
															<xsl:value-of select="." />
														</xsl:attribute>
														<xsl:value-of select="../name" />
													</fo:basic-link>
												</xsl:for-each>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="1pt solid black">
											<fo:block>
												<xsl:for-each select="artist">
													<fo:basic-link color="#8080ff">
														<xsl:attribute name="external-destination">
															<xsl:value-of select="./url" />
														</xsl:attribute>
														<xsl:value-of select="./name" />
													</fo:basic-link>
												</xsl:for-each>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="1pt solid black">
											<fo:block>
												<xsl:value-of select='format-number(playcount, "###,###")' />
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="1pt solid black">
											<fo:block>
												<xsl:value-of select='format-number(listeners, "###,###")' />
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>
					</fo:block>
					<fo:block id="end" />
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>