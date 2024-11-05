This script allows to you auto install Microsoft Office 2019.

And so, you need to create one package for Office 2019 deployment.

Download the Office Deployment tools from the Microsoft Download Center(https://www.microsoft.com/en-us/download/details.aspx?id=49117). After receiving a copy of the ODT, you need to create a configuration file configuration.xml .

You can create multiple files configuration.xml which will be used with ODT.

What you need it for: you can install Office 2019 directly from the Office CDN network, or you can download the installation files from the Office CDN network to a folder on your local network, for example, to a shared folder and install Office 2019 from this location. You can use different methods for different sets of computers in your organization.

To create a configuration file, I recommend using the Office Customization Tool(https://config.office.com/). Using this site, you can generate an answer file for Office 365 / Office 2019 with basic settings such as:

office architecture version;
products, components and languages;
installation parameters (Office CDN or "Local Source");
type of licensing.

And supplement it with product IDs supported by the Office Deployment Tool.

Installing Office 2019 using the Office Deployment Tool

After receiving the ODT and creating the configuration file configuration.xml you can install Office 2019.

Open an elevated command prompt, navigate to the folder where you saved the ODT and the file configuration.xml , and enter the following command to download the installation package to a network folder:

setup /download configuration.xml

next:

setup /configure configuration.xml

To install Office from a network folder or directly from the Office CDN network. Wait for the Office installation to finish.

From experience, it is better to test the installation of a package from the Office CDN network, and then create a local package.

Just in case, here is a complete list of ODT commands:

SETUP /download [path to configuration file]

SETUP /configure [path to configuration file]

SETUP /packager [path to configuration file] [output path]

SETUP /customize [path to configuration file]

SETUP /help

Microsoft's Deployment Guide for Office 2019(https://docs.microsoft.com/ru-ru/deployoffice/office2019/deploy#sample-configurationxml-file-to-use-with-the-office-deployment-tool)

Please note that this Office configuration tool contains codes for Project/Visio 2016, but does not contain product IDs that are supported by the Office Deployment Tool.
Microsoft is so Microsoft.