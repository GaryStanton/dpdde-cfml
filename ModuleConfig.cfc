/**
* This module wraps DPD DE functionality
**/
component {

	// Module Properties
    this.modelNamespace			= 'DPDDECFML';
    this.cfmapping				= 'DPDDECFML';
    this.parseParentSettings 	= true;

	/**
	 * Configure
	 */
	function configure(){

		// Skip information vars if the box.json file has been removed
		if( fileExists( modulePath & '/box.json' ) ){
			// Read in our box.json file for so we don't duplicate the information above
			var moduleInfo = deserializeJSON( fileRead( modulePath & '/box.json' ) );

			this.title 				= moduleInfo.name;
			this.author 			= moduleInfo.author;
			this.webURL 			= moduleInfo.repository.URL;
			this.description 		= moduleInfo.shortDescription;
			this.version			= moduleInfo.version;

		}

		// Settings
		settings = {
				'sftpUsername' : ''
			,	'sftpKeyfile' : ''
		};
	}

	function onLoad(){
		binder.map( "events@DPDDECFML" )
			.to( "#moduleMapping#.models.events" )
			.asSingleton()
			.initWith(
					sftpUsername 	= settings.sftpUsername
				,	sftpKeyfile 	= settings.sftpKeyfile
			);
	}

}