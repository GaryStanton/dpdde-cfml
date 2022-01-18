component{
	this.name = "dpd-de-cfml-examples-" & hash(getCurrentTemplatePath());

	/**
	 * onError
	 */
   void function onError(struct exception, string eventName) {
       writeDump(Arguments);
       abort;
   }
}