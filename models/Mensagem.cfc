component persistent="true" table="mensagens" {	
	property name="id" column="id" fieldtype="id" generator="increment";
	property name="assunto" ormtype="string" ;
	property name="mensagem" ormtype="text" ;
	property name="destinatario" ormtype="string" ;
	property name="datamensagem" ormtype="date" ;
	property name="datasistema" ormtype="timestamp" ;	
}