<!doctype html>

<cfscript>
	setting requesttimeout="600";

	if (StructKeyExists(Form, 'fileList')) {
		DPDEvents = new models.events(
				sftpUsername 	= ''
			,	sftpKeyFile 	= ''
		);

		fileList = DPDEvents.getFileList();
	}

	if (StructKeyExists(Form, 'fileContents')) {
		DPDEvents = new models.events(
				sftpUsername 	= ''
			,	sftpKeyFile 	= ''
		);

		fileContents = DPDEvents.processRemoteFiles(
				dateRange 			= '#DateFormat(dateAdd('w', -1, Now()), 'yyyy-mm-dd')#, #DateFormat(Now(), 'yyyy-mm-dd')#'
			,	removeFromServer 	= false
		);
	}
</cfscript>

<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<title>DPD DE CFML examples</title>
	</head>

	<body>
		<div class="container">
			<h1>DPD DE CFML examples</h1>
			<hr>

			<div class="row">
				<div class="col-sm-6">
					<div class="mr-4">
						<h2>Events</h2>
						<p>Tracking events are stored on the DPD DE SFTP server. Enter authentication details in the index.cfm file to test the following fuctionality.</p>
						<form method="POST">
							<div class="input-group">
								<div class="">
									<button type="submit" class="btn btn-primary" type="button" name="fileList">View file list</button>
									<button type="submit" class="btn btn-primary" type="button" name="fileContents">View file contents</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<cfif structKeyExists(Variables, 'fileList')>
				<hr />
				<cfdump var="#fileList#">
			</cfif>

			<cfif structKeyExists(Variables, 'fileContents')>
				<hr />
				<cfdump var="#fileContents#">
			</cfif>
		</div>
	</body>
</html>