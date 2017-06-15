# UML Diagrams:

## Resources
- http://argouml-graphviz.stage.tigris.org/
	- All UML diagrams which are stored in XMI format can be processed and exported to PDF, SVG, PNG, etcetera
	- need to process using xslt first
	- Automatically repositioning all visual elements from UML diagrams that are stored in XMI. These can be exported with DOT to PDF, SVG, PNG, etc. This XLST runs independently of ArgoUML. [Pander]
- http://www.aarontrevena.co.uk/opensource/autodia/
- https://yarnpkg.com/en/package/jhipster-uml
	- This project's main goal is to bring support of UML (more precisely, XMI) files (from various editors) to JHipster so that it can read the files, without you answering the questions.
- https://marketplace.eclipse.org/content/emf-graphviz-emf2gv
	- http://emftools.tuxfamily.org/
	- https://www.openhub.net/p/emf2gv
- http://www.ryandesign.com/canviz/
	- an HTML5/Javascript canvas viewer (beta). [Ryan Schmidt]

**OTHER**
- https://sourceforge.net/projects/xmitransform/
	- XMI Transform is a tool written in PHP to convert XMI file to source code or
source code to XMI file.
- https://en.pdf24.org/xmi-2-pdf.html
	- Files of the type XMI or files with the file extension .xmi can be easily converted to PDF with the help of a PDF printer. 
	- PDF24 provides a MSI setup version of the PDF24 Creator. 
	- The download link of the latest version of the .msi setup is: https://www.pdf24.org/products/pdf-creator/download/pdf24-creator.msi
	
```	
	MSI command line arguments
	pdf24-creator.msi AUTOUPDATE=[Yes|No] DESKTOPICONS=[Yes|No] FAXPRINTER=[Yes|No] /[QR|QB|QN]
	AUTOUPDATE=Yes|No
	Enables or disables the autoupdate feature of PDF24. Set the public property [AUTOUPDATE=”No“] for disabling the autoupdate feature.
	The feature is enabled by default.

	DESKTOPICONS=Yes|No
	Creates or disables the Windows Desktop icons for PDF24-PDF and PDF24-Fax. Set the public property [DESKTOPICONS=”No”] for disabling
	the Windows Desktop icons. The Windows Desktop icons will be created by default.

	FAXPRINTER=Yes|No
	Enables or disables the Fax printer feature of PDF24. Set the public property [FAXPRINTER=”No“] for disabling the Fax printer feature.
	The feature is enabled by default.	
	The amount of user interface that installer displays can be controlled with /q options, in particular:

	/qn - No interface
	/qb - Basic interface - just a small progress dialog
	/qb! - Like /qb, but hide the Cancel button
	/qr - Reduced interface - display all dialogs that don't require user interaction (skip all modal dialogs)
	/qn+ - Like /qn, but display "Completed" dialog at the end
	/qb+ - Like /qb, but display "Completed" dialog at the end	
	
```

## Ubuntu PDF Printr
- https://launchpad.net/ubuntu/+source/cups-pdf/2.6.1-21
	- sudo apt-get install printer-driver-cups-pdf
	- sudo apt-get remove --auto-remove printer-driver-cups-pdf
	- https://www.steveroot.co.uk/2014/11/22/virtual-pdf-printer-for-our-small-office-network-a-step-by-step-how-to/
- install pdftk
	- easily manipulate PDFs
	
	
## ArgoUML
`http://argouml.tigris.org/`
	- Dec 15, 2011 	ArgoUML 0.34 released
	- And ArgoUML imports the UML1.4 formats XMI 1.1 & 1.2, but only writes XMI 1.2
	- diagram types supported
		Class diagram
		Statechart diagram
		Activity diagram (including Swimlanes)
		Use Case diagram
		Collaboration diagram
		Deployment diagram (includes Object and Component diagram in one)
		Sequence diagram
	- code generation for Java, C++, C#, PHP4 and PHP5
	- http://argouml-csharp.tigris.org/
		- enables C# code import to a UML model and C# code generation from a UML model
		Generate C# code from a UML model
		Import C# source and build a UML model based on the source
		Reverse engineer assemblies??
