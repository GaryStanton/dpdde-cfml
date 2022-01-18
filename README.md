# DPD DE CFML

DPD DE CFML provides a wrapper for DPD DE functionality.
At present, the module only includes access to SFTP file download for tracking events.

## Installation
```js
box install dpddecfml
```

## Examples
Check out the `/examples` folder for an example.

## Usage
The DPD DE CFML wrapper consists of a single model to manage the connection to the DPD SFTP server to download and process tracking event files.
The wrapper may be used standalone, or as a ColdBox module.


### Standalone
```cfc
	DPDDEEvents = new models.events(
			sftpUsername 	= 'accountnumber'
		,	sftpKeyFile 	= 'path/to/keyfile.ppk'
	);

```

### ColdBox
```cfc
DPDDEEvents 	= getInstance("events@DPDDECFML");
```
alternatively inject it directly into your handler
```cfc
property name="DPDDEEvents" inject="events@DPDDECFML";
```

When using with ColdBox, you'll want to insert your authentication details into your module settings:

```cfc
DPDDECFML = {
		sftpUsername 	= getSystemSetting("DPDDE_SFTPUSERNAME", "")
	,	sftpKeyfile 	= getSystemSetting("DPDDE_SFTPKEYFILE_PATH", "")
}
```

### Retrieve tracking event data
Tracking event files are uploaded to the DPD SFTP server every 20 minutes or so. The events component can be used to list, download and process these files.  

```cfc
fileList = DPDDEEvents.getFileList();
```

```cfc
fileContents = DPDEvents.processRemoteFiles(
		dateRange 			= '2021-01-01,2021-01-31'
	,	removeFromServer 	= false
);
```


## Author
Written by Gary Stanton.  
https://garystanton.co.uk
