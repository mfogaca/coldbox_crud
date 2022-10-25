component extends="coldbox.system.EventHandler" {

	property name="errors" inject="cursotcc.utils.ErrorBean";

	/**
	 * Default Action
	 */
	function index( event, rc, prc ) {
		prc.qMensagens = entityLoad("Mensagem");
		event.setView( "main/index" );
	}

	/**
	 * New entity
	 */
	function newMensagem( event, rc, prc ) {
		prc.destinatarios = getDestinatarios();
		prc.destinatario = "";
		event.setView( "main/form" );
	}	

	/**
	 * Get entity
	 */
	function getMensagem( event, rc, prc ) {
		prc.destinatarios = getDestinatarios();		
		prc.record = entityLoadByPK("Mensagem", rc.id);
		event.setView( "main/form" );
	}

	/**
	 * Save entity
	 */
	function saveMensagem( event, rc, prc ) {
		//Identify the operation (I=Insert ou U=update)
		var operation = "I";
		if (!IsNull(rc.id) AND len(rc.id) > 0) {
			operation = "U";
		}

		//Validations
		var errors = validateRecord(rc);

		if (errors.hasErrors()) {
			prc.errors = errors;
			prc.destinatarios = getDestinatarios();	
			event.setView( "main/form" );
		} else {
			if (operation EQ "U") {
				prc.record = entityLoadByPK("Mensagem", rc.id); //Update
			} else {
				prc.record =entityNew("Mensagem"); //Insert
			}
			prc.record.setMensagem(mensagem);
			prc.record.setAssunto(assunto);
			prc.record.setDestinatario(destinatario);
			prc.record.setDatamensagem(datamensagem);
			prc.record.setDatasistema(now());
			entitySave(prc.record);
			ormFlush();
			prc.qMensagens = entityLoad("Mensagem");
			event.setView( "main/index" );
		}
	}

	/**
	 * Delete a record
	 */
	function deleteMensagem( event, rc, prc ) {
		var record = entityLoadByPK("Mensagem", rc.id);
		entityDelete(record);
		ormFlush();			
		prc.qMensagens = entityLoad("Mensagem");				
		event.setView( "main/index" );
	}

	array function getDestinatarios() {
		destinatarios = [{code:"Marcos", value:"Marcos"},{code:"Dagoberto", value:"Dagoberto"},{code:"Weller", value:"Weller"}];
		return destinatarios;
	}

	/**
	 * Apply validations to record before save
	 */
	ErrorBean function validateRecord(any record) {

		if (!len(trim(record.assunto))) {
			errors.addError('O campo assunto é obrigatório','assunto');
		}

		if (!len(trim(record.mensagem))) {
			errors.addError('O campo mensagem é obrigatório','mensagem');
		}		
		
		if (!len(trim(record.datamensagem))) {
			errors.addError('O campo data mensagem é obrigatório','datamensagem');
		}

		if (!len(trim(record.destinatario))) {
			errors.addError('O campo destinatário é obrigatório','destinatario');
		}		
		return errors;
	}		
	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ) {
	}

	function onRequestStart( event, rc, prc ) {
	}

	function onRequestEnd( event, rc, prc ) {
	}

	function onSessionStart( event, rc, prc ) {
	}

	function onSessionEnd( event, rc, prc ) {
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ) {
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
